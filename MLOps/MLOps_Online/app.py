from pathlib import Path

import joblib
import pandas as pd
import streamlit as st


RAIZ_PROYECTO = Path(__file__).resolve().parent
RUTA_MODELO = RAIZ_PROYECTO / "models/modelo.pkl"
RUTA_DATOS = RAIZ_PROYECTO / "data/clientes.csv"

ETIQUETAS = {
    "gender": "Género",
    "SeniorCitizen": "Persona mayor (0 = no, 1 = sí)",
    "Partner": "Tiene pareja",
    "Dependents": "Tiene personas dependientes",
    "tenure": "Antigüedad (meses)",
    "PhoneService": "Servicio telefónico",
    "MultipleLines": "Varias líneas telefónicas",
    "InternetService": "Servicio de internet",
    "OnlineSecurity": "Seguridad en línea",
    "OnlineBackup": "Respaldo en línea",
    "DeviceProtection": "Protección de dispositivos",
    "TechSupport": "Soporte técnico",
    "StreamingTV": "Televisión en streaming",
    "StreamingMovies": "Películas en streaming",
    "Contract": "Tipo de contrato",
    "PaperlessBilling": "Factura electrónica",
    "PaymentMethod": "Método de pago",
    "MonthlyCharges": "Cargo mensual",
    "TotalCharges": "Cargos totales",
}

ETIQUETAS_CATEGORIAS = {
    "Yes": "Sí",
    "No": "No",
    "Female": "Mujer",
    "Male": "Hombre",
    "No phone service": "Sin servicio telefónico",
    "No internet service": "Sin servicio de internet",
    "Fiber optic": "Fibra óptica",
    "Month-to-month": "Mes a mes",
    "One year": "Un año",
    "Two year": "Dos años",
    "Bank transfer (automatic)": "Transferencia bancaria (automática)",
    "Credit card (automatic)": "Tarjeta de crédito (automática)",
    "Electronic check": "Cheque electrónico",
    "Mailed check": "Cheque por correo",
}


@st.cache_resource
def cargar_modelo():
    return joblib.load(RUTA_MODELO)


st.set_page_config(page_title="Predicción de abandono de clientes")
st.title("Predicción de abandono de clientes")
st.write("Complete los datos del cliente para estimar su probabilidad de abandono.")

modelo = cargar_modelo()
datos = pd.read_csv(RUTA_DATOS)
datos["TotalCharges"] = pd.to_numeric(datos["TotalCharges"], errors="coerce")
columnas = list(modelo.feature_names_in_)

with st.form("datos_cliente"):
    respuestas = {}
    izquierda, derecha = st.columns(2)

    for indice, columna in enumerate(columnas):
        with (izquierda if indice % 2 == 0 else derecha):
            etiqueta = ETIQUETAS.get(columna, columna)
            serie = datos[columna].dropna()

            if pd.api.types.is_integer_dtype(serie):
                opciones = {"min_value": 0, "value": int(serie.median()), "step": 1}
                if columna == "SeniorCitizen":
                    opciones["max_value"] = 1
                respuestas[columna] = st.number_input(etiqueta, **opciones)
            elif pd.api.types.is_numeric_dtype(serie):
                respuestas[columna] = st.number_input(
                    etiqueta, min_value=0.0, value=float(serie.median()),
                    step=0.01, format="%.2f",
                )
            else:
                categorias = sorted(serie.unique().tolist())
                respuestas[columna] = st.selectbox(
                    etiqueta, categorias,
                    format_func=lambda valor: ETIQUETAS_CATEGORIAS.get(valor, valor),
                )

    enviar = st.form_submit_button("Predecir abandono", type="primary")

if enviar:
    cliente = pd.DataFrame([respuestas], columns=columnas)
    prediccion = int(modelo.predict(cliente)[0])
    indice_abandono = list(modelo.classes_).index(1)
    probabilidad = modelo.predict_proba(cliente)[0][indice_abandono]

    if prediccion == 1:
        st.warning("Se estima que este cliente abandonará el servicio.")
    else:
        st.success("Se estima que este cliente permanecerá en el servicio.")

    st.metric("Probabilidad estimada de abandono", f"{probabilidad:.1%}")
