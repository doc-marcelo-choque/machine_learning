Crea `app.py` para realizar predicciones de abandono de clientes con Streamlit.

Requisitos:
1. Cargar `models/modelo.pkl` mediante joblib.
2. Mostrar el título "Predicción de abandono de clientes".
3. Crear un formulario con todas las variables predictoras utilizadas durante el entrenamiento.
4. Utilizar selectbox para variables categóricas y number_input para variables numéricas.
5. Respetar los nombres de columnas y las categorías originales de `clientes.csv`.
6. Crear el botón "Predecir abandono".
7. Construir un DataFrame de una fila con los datos del formulario.
8. Utilizar model.predict() y model.predict_proba().
9. Mostrar si el cliente abandonará o permanecerá, junto con la probabilidad estimada de abandono.
10. Mostrar un mensaje comprensible para el usuario.

Mantener una interfaz sencilla y profesional.

No reentrenar el modelo desde Streamlit. No utilizar MLflow ni bases de datos.