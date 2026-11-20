"""Predice clientes pendientes y persiste el resultado de cada lote en PostgreSQL."""

import logging

import joblib
import pandas as pd
from sqlalchemy import text

from config import BASE_DIR, obtener_motor

logging.basicConfig(level=logging.INFO, format="%(levelname)s | %(message)s")

CONSULTA_PENDIENTES = """
    SELECT n.*
    FROM clientes_nuevos AS n
    LEFT JOIN predicciones_clientes AS p ON p.cliente_id = n.id
    WHERE p.cliente_id IS NULL
    ORDER BY n.id
"""

INSERTAR_PREDICCION = """
    INSERT INTO predicciones_clientes
        (cliente_id, prediccion, probabilidad_compra, version_modelo)
    VALUES (:cliente_id, :prediccion, :probabilidad_compra, :version_modelo)
    ON CONFLICT (cliente_id) DO NOTHING
"""


def main():
    ruta_modelo = BASE_DIR / "modelos" / "modelo_clientes.joblib"
    if not ruta_modelo.exists():
        raise FileNotFoundError("Primero ejecuta: python 02_entrenar.py")

    paquete = joblib.load(ruta_modelo)  # Cargar únicamente modelos generados en un entorno confiable.
    motor = obtener_motor()
    with motor.connect() as conexion:
        clientes = pd.read_sql(text(CONSULTA_PENDIENTES), conexion)

    if clientes.empty:
        logging.info("No existen clientes pendientes de clasificación.")
        return

    X = clientes[paquete["columnas"]].copy()
    X[paquete["numericas"]] = X[paquete["numericas"]].astype(float)
    modelo = paquete["modelo"]
    predicciones = modelo.predict(X)
    probabilidades = modelo.predict_proba(X)[:, 1]

    registros = [
        {
            "cliente_id": int(id_cliente),
            "prediccion": int(pred),
            "probabilidad_compra": round(float(prob), 6),
            "version_modelo": paquete["version"],
        }
        for id_cliente, pred, prob in zip(clientes["id"], predicciones, probabilidades)
    ]

    # La transacción evita resultados parcialmente insertados si ocurre un error.
    with motor.begin() as conexion:
        resultado = conexion.execute(text(INSERTAR_PREDICCION), registros)

    logging.info("Clientes leídos: %s", len(clientes))
    logging.info("Predicciones nuevas insertadas: %s", resultado.rowcount)
    logging.info("Versión del modelo: %s", paquete["version"])


if __name__ == "__main__":
    main()
