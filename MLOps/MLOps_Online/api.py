from pathlib import Path
from typing import Literal

import joblib
import pandas as pd
from fastapi import FastAPI, HTTPException
from fastapi.responses import JSONResponse
from pydantic import BaseModel, ConfigDict, Field


RUTA_MODELO = Path(__file__).resolve().parent / "models/modelo.pkl"
aplicacion = FastAPI(title="API de predicción de abandono de clientes")

try:
    modelo = joblib.load(RUTA_MODELO)
except Exception:
    modelo = None


class Cliente(BaseModel):
    model_config = ConfigDict(extra="forbid", allow_inf_nan=False)

    gender: Literal["Female", "Male"]
    SeniorCitizen: Literal[0, 1]
    Partner: Literal["Yes", "No"]
    Dependents: Literal["Yes", "No"]
    tenure: int = Field(ge=0)
    PhoneService: Literal["Yes", "No"]
    MultipleLines: Literal["Yes", "No", "No phone service"]
    InternetService: Literal["DSL", "Fiber optic", "No"]
    OnlineSecurity: Literal["Yes", "No", "No internet service"]
    OnlineBackup: Literal["Yes", "No", "No internet service"]
    DeviceProtection: Literal["Yes", "No", "No internet service"]
    TechSupport: Literal["Yes", "No", "No internet service"]
    StreamingTV: Literal["Yes", "No", "No internet service"]
    StreamingMovies: Literal["Yes", "No", "No internet service"]
    Contract: Literal["Month-to-month", "One year", "Two year"]
    PaperlessBilling: Literal["Yes", "No"]
    PaymentMethod: Literal[
        "Electronic check", "Mailed check",
        "Bank transfer (automatic)", "Credit card (automatic)",
    ]
    MonthlyCharges: float = Field(ge=0)
    TotalCharges: float | None = Field(..., ge=0)


@aplicacion.get("/")
def inicio():
    return {
        "nombre": "API de predicción de abandono de clientes",
        "endpoints": ["/health", "/predict"],
    }


@aplicacion.get("/health")
def estado():
    if modelo is None:
        return JSONResponse(status_code=503, content={"modelo_cargado": False})
    return {"modelo_cargado": True}


@aplicacion.post("/predict")
def predecir(datos_cliente: Cliente):
    if modelo is None:
        raise HTTPException(status_code=503, detail="El modelo no está disponible.")

    cliente = pd.DataFrame(
        [datos_cliente.model_dump()], columns=modelo.feature_names_in_
    )
    try:
        prediccion = int(modelo.predict(cliente)[0])
        indice_abandono = list(modelo.classes_).index(1)
        probabilidad = float(modelo.predict_proba(cliente)[0][indice_abandono])
    except Exception as error:
        raise HTTPException(
            status_code=500, detail="No se pudo calcular la predicción."
        ) from error

    return {
        "prediccion": "Abandona" if prediccion == 1 else "No abandona",
        "probabilidad_abandono": probabilidad,
    }
