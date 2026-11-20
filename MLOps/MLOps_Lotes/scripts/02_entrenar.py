"""Entrena, evalúa y persiste el modelo de clasificación de clientes."""

import json
import logging
from datetime import datetime, timezone

import joblib
import pandas as pd
from sklearn.compose import ColumnTransformer
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import accuracy_score, classification_report, f1_score, roc_auc_score
from sklearn.model_selection import train_test_split
from sklearn.pipeline import Pipeline
from sklearn.preprocessing import OneHotEncoder
from sqlalchemy import text

from config import BASE_DIR, obtener_motor

logging.basicConfig(level=logging.INFO, format="%(levelname)s | %(message)s")

NUMERICAS = [
    "edad", "ingreso_mensual", "antiguedad_meses", "visitas_web_mes",
    "minutos_web_mes", "productos_vistos_mes", "productos_carrito_mes",
    "compras_previas", "gasto_historico", "descuentos_utilizados",
]
CATEGORICAS = ["canal_adquisicion", "dispositivo"]
COLUMNAS = NUMERICAS + CATEGORICAS


def main():
    motor = obtener_motor()
    with motor.connect() as conexion:
        datos = pd.read_sql(
            text("SELECT * FROM clientes_historicos ORDER BY id"), conexion
        )

    if len(datos) < 40 or datos["compro"].nunique() < 2:
        raise ValueError("Se requieren al menos 40 registros y ambas clases para entrenar.")

    X = datos[COLUMNAS].copy()
    X[NUMERICAS] = X[NUMERICAS].astype(float)
    y = datos["compro"].astype(int)

    X_train, X_test, y_train, y_test = train_test_split(
        X, y, test_size=0.25, random_state=42, stratify=y
    )

    def crear_pipeline():
        preprocesador = ColumnTransformer(
            transformers=[
                ("categoricas", OneHotEncoder(handle_unknown="ignore"), CATEGORICAS),
                ("numericas", "passthrough", NUMERICAS),
            ]
        )
        return Pipeline([
            ("preprocesador", preprocesador),
            ("clasificador", RandomForestClassifier(
                n_estimators=120, max_depth=7, random_state=42, n_jobs=-1
            )),
        ])

    modelo = crear_pipeline()
    modelo.fit(X_train, y_train)
    pred = modelo.predict(X_test)
    prob = modelo.predict_proba(X_test)[:, 1]
    metricas = {
        "accuracy": round(float(accuracy_score(y_test, pred)), 4),
        "f1": round(float(f1_score(y_test, pred, zero_division=0)), 4),
        "roc_auc": round(float(roc_auc_score(y_test, prob)), 4),
        "registros_entrenamiento": int(len(X_train)),
        "registros_prueba": int(len(X_test)),
    }
    logging.info("Evaluación (conjunto de prueba): %s", metricas)
    logging.info("Reporte de clasificación:\n%s", classification_report(y_test, pred, zero_division=0))

    # Una vez evaluado, se reajusta con todos los históricos para producción.
    modelo_final = crear_pipeline()
    modelo_final.fit(X, y)
    version = datetime.now(timezone.utc).strftime("%Y%m%dT%H%M%SZ")
    carpeta = BASE_DIR / "modelos"
    carpeta.mkdir(exist_ok=True)
    joblib.dump({"modelo": modelo_final, "columnas": COLUMNAS, "numericas": NUMERICAS, "version": version}, carpeta / "modelo_clientes.joblib")
    (carpeta / "metricas.json").write_text(json.dumps(metricas, indent=2), encoding="utf-8")
    logging.info("Modelo guardado: %s | versión: %s", carpeta / "modelo_clientes.joblib", version)


if __name__ == "__main__":
    main()
