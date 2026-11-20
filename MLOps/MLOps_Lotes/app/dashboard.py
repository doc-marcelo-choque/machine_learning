"""Dashboard de consulta de predicciones Batch: ejecutar desde la raíz."""

from pathlib import Path
import sys

import pandas as pd
import streamlit as st
from sqlalchemy.exc import SQLAlchemyError

# Streamlit agrega app/ a sys.path; permite reutilizar scripts/config.py.
RAIZ = Path(__file__).resolve().parent.parent
if str(RAIZ) not in sys.path:
    sys.path.insert(0, str(RAIZ))

from app.datos import (  # noqa: E402
    CLASIFICACIONES,
    ZONA_HORARIA,
    cargar_clientes,
    filtrar_clientes,
    preparar_tabla,
)
from app.graficos import crear_graficos  # noqa: E402

st.set_page_config(
    page_title="Predicciones de clientes | ML Batch",
    page_icon=":material/insights:",
    layout="wide",
)

with st.container(horizontal=True, vertical_alignment="center"):
    st.title("Predicciones de clientes", anchor=False)
    st.button(
        "Actualizar datos", icon=":material/refresh:", key="actualizar",
        on_click=cargar_clientes.clear,
        help="Vuelve a consultar las predicciones guardadas en PostgreSQL.",
    )
st.caption("Consulta los resultados del proceso Batch y descubre oportunidades de compra.")

try:
    with st.spinner("Consultando clientes y predicciones…"):
        clientes, fecha_lectura = cargar_clientes()
except ValueError:
    st.error(
        "Revisa la configuración de conexión en el archivo .env de la raíz "
        "(DB_HOST, DB_PORT, DB_NAME, DB_USER y DB_PASSWORD).",
        title="No se pudo cargar la configuración",
    )
    st.stop()
except SQLAlchemyError as error:
    codigo = getattr(getattr(error, "orig", None), "sqlstate", None)
    if codigo == "42P01":
        mensaje = (
            "Faltan las tablas clientes_nuevos o predicciones_clientes. "
            "Comprueba que la base seleccionada tenga la estructura de sql/clientesml.sql."
        )
    else:
        mensaje = (
            "Comprueba que PostgreSQL esté disponible, las credenciales de .env sean "
            "correctas y el usuario tenga acceso de lectura a las tablas. "
            "Después pulsa Actualizar datos."
        )
    st.error(mensaje, title="No se pudieron consultar los datos")
    st.stop()

hora_local = pd.Timestamp(fecha_lectura).tz_convert(ZONA_HORARIA)
st.caption(
    f"Datos consultados: {hora_local:%d/%m/%Y %H:%M:%S} (Bolivia) · "
    "Caché: 5 minutos · Universo: clientes nuevos del proceso Batch."
)

clasificados = clientes.loc[clientes["prediccion"].notna()]
compra = int(clientes["prediccion"].eq(1).sum())
no_compra = int(clientes["prediccion"].eq(0).sum())
promedio = clasificados["probabilidad_compra"].mean()

with st.container(horizontal=True):
    st.metric("Total de clientes", len(clientes), border=True,
              help="Clientes de la tabla clientes_nuevos, incluidos los pendientes.")
    st.metric("Clientes clasificados", len(clasificados), border=True)
    st.metric("Predicción de compra", compra, border=True)
    st.metric("Predicción de no compra", no_compra, border=True)
    st.metric("Probabilidad promedio", "—" if pd.isna(promedio) else f"{promedio:.1%}",
              border=True, help="Promedio de compra entre los clientes clasificados.")

pendientes = len(clientes) - len(clasificados)
st.caption(
    f"Sin clasificar: {pendientes} · Las predicciones son estimaciones del modelo, "
    "no compras realizadas. Los filtros de abajo afectan únicamente a la tabla y al CSV."
)

if clientes.empty:
    st.info("La tabla clientes_nuevos todavía no contiene clientes.")
else:
    if clasificados.empty:
        st.info(
            "Hay clientes registrados, pero todavía no hay predicciones Batch. "
            "Las probabilidades se mostrarán cuando existan resultados guardados."
        )
    with st.grid(2, min_column_width=380, gap="medium"):
        for titulo, figura, descripcion in crear_graficos(clientes):
            with st.container(border=True):
                st.subheader(titulo)
                st.plotly_chart(figura, width="stretch", alt=descripcion,
                                config={"displaylogo": False}, key=titulo)

st.subheader("Resultados por cliente")
with st.container(horizontal=True, vertical_alignment="bottom"):
    clasificacion = st.segmented_control(
        "Clasificación", ["Todas", *CLASIFICACIONES], default="Todas",
        required=True, key="clasificacion",
    )
    busqueda = st.text_input(
        "Buscar por ID del cliente", placeholder="ID exacto, por ejemplo: 12",
        key="cliente_id", max_chars=19,
    )

try:
    filtrados = filtrar_clientes(clientes, str(clasificacion), busqueda or "")
except ValueError as error:
    st.warning(str(error))
    st.stop()

tabla = preparar_tabla(filtrados)
st.caption(f"{len(tabla)} de {len(clientes)} clientes · Fechas en hora de Bolivia (UTC−4).")
if tabla.empty:
    st.info("No hay clientes que coincidan con los filtros seleccionados.")

st.dataframe(
    tabla, hide_index=True, width="stretch", key="resultados",
    alt="Clientes que cumplen los filtros, con sus características y predicciones de compra.",
    column_config={
        "ID del cliente": st.column_config.NumberColumn(format="%d", pinned=True),
        "Probabilidad de compra (%)": st.column_config.NumberColumn(format="%.2f%%"),
        "Ingreso mensual": st.column_config.NumberColumn(format="%.2f"),
        "Gasto histórico": st.column_config.NumberColumn(format="%.2f"),
    },
)
st.download_button(
    "Exportar resultados a CSV", data=tabla.to_csv(index=False).encode("utf-8-sig"),
    file_name="predicciones_clientes.csv", mime="text/csv", key="exportar",
    icon=":material/download:", on_click="ignore", disabled=tabla.empty,
    help="Descarga únicamente los resultados de la tabla con los filtros actuales.",
)
