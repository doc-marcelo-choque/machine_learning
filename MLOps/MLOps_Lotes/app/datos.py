"""Lectura de PostgreSQL y preparación de resultados, sin ejecutar el modelo."""

from datetime import datetime, timezone

import pandas as pd
import streamlit as st
from sqlalchemy import text
from sqlalchemy.engine import Engine

from scripts.config import obtener_motor

CLASIFICACIONES = ["Compra", "No compra", "Sin clasificar"]
ZONA_HORARIA = "America/La_Paz"
CONSULTA_CLIENTES = """
    SELECT n.id AS cliente_id, n.edad, n.ingreso_mensual,
           n.antiguedad_meses, n.visitas_web_mes, n.minutos_web_mes,
           n.productos_vistos_mes, n.productos_carrito_mes,
           n.compras_previas, n.gasto_historico, n.descuentos_utilizados,
           n.canal_adquisicion, n.dispositivo, n.fecha_registro,
           p.prediccion, p.probabilidad_compra,
           p.version_modelo, p.fecha_prediccion
    FROM public.clientes_nuevos AS n
    LEFT JOIN public.predicciones_clientes AS p ON p.cliente_id = n.id
    ORDER BY n.id
"""

ETIQUETAS_COLUMNAS = {
    "cliente_id": "ID del cliente",
    "clasificacion": "Clasificación",
    "probabilidad_compra": "Probabilidad de compra (%)",
    "edad": "Edad",
    "canal_adquisicion": "Canal de adquisición",
    "dispositivo": "Dispositivo",
    "ingreso_mensual": "Ingreso mensual",
    "antiguedad_meses": "Antigüedad (meses)",
    "visitas_web_mes": "Visitas web al mes",
    "minutos_web_mes": "Minutos web al mes",
    "productos_vistos_mes": "Productos vistos al mes",
    "productos_carrito_mes": "Productos en carrito al mes",
    "compras_previas": "Compras previas",
    "gasto_historico": "Gasto histórico",
    "descuentos_utilizados": "Descuentos utilizados",
    "prediccion": "Predicción (1 compra, 0 no compra)",
    "fecha_registro": "Fecha de registro (Bolivia)",
    "fecha_prediccion": "Fecha de predicción (Bolivia)",
    "version_modelo": "Versión del modelo",
}


@st.cache_resource
def motor_dashboard() -> Engine:
    """Reutiliza la configuración .env y el pool de conexiones existente."""
    return obtener_motor()


@st.cache_data(ttl=300, max_entries=1, show_spinner=False)
def cargar_clientes() -> tuple[pd.DataFrame, datetime]:
    """Lee una instantánea; los filtros posteriores se aplican en memoria."""
    with motor_dashboard().connect() as conexion:
        conexion.execute(text("SET TRANSACTION READ ONLY"))
        conexion.execute(text("SET LOCAL statement_timeout = '15s'"))
        clientes = pd.read_sql_query(text(CONSULTA_CLIENTES), conexion)

    clientes["prediccion"] = clientes["prediccion"].astype("Int64")
    clientes["probabilidad_compra"] = pd.to_numeric(
        clientes["probabilidad_compra"], errors="raise"
    ).astype(float)
    clientes["clasificacion"] = (
        clientes["prediccion"].map({1: "Compra", 0: "No compra"}).fillna("Sin clasificar")
    )
    return clientes, datetime.now(timezone.utc)


def filtrar_clientes(
    clientes: pd.DataFrame, clasificacion: str, busqueda: str
) -> pd.DataFrame:
    """Filtra por clase y coincidencia exacta de ID, sin construir SQL dinámico."""
    resultado = clientes
    if clasificacion != "Todas":
        resultado = resultado.loc[resultado["clasificacion"].eq(clasificacion)]
    busqueda = busqueda.strip()
    if busqueda:
        if (
            not busqueda.isascii()
            or not busqueda.isdecimal()
            or len(busqueda) > 19
            or not 1 <= int(busqueda) <= 2**63 - 1
        ):
            raise ValueError("Escribe un ID entero positivo válido, sin letras ni decimales.")
        resultado = resultado.loc[resultado["cliente_id"].eq(int(busqueda))]
    return resultado.copy()


def preparar_tabla(clientes: pd.DataFrame) -> pd.DataFrame:
    """Usa las mismas columnas y unidades para la tabla y el CSV."""
    tabla = clientes.loc[:, list(ETIQUETAS_COLUMNAS)].reset_index(drop=True).copy()
    tabla["probabilidad_compra"] = tabla["probabilidad_compra"] * 100
    for columna in ("fecha_registro", "fecha_prediccion"):
        tabla[columna] = (
            pd.to_datetime(tabla[columna], utc=True)
            .dt.tz_convert(ZONA_HORARIA)
            .dt.strftime("%d/%m/%Y %H:%M:%S")
        )
    return tabla.rename(columns=ETIQUETAS_COLUMNAS)
