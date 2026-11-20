Crea una API REST utilizando FastAPI para realizar predicciones de abandono de clientes.

### Contexto
El proyecto ya contiene un modelo de clasificación entrenado con Scikit-learn y guardado mediante Joblib en `models/modelo.pkl`.

### Requisitos
1. Crear el archivo `api.py` en la raíz del proyecto.
2. Utilizar FastAPI y Pydantic.
3. Cargar `models/modelo.pkl` mediante Joblib al iniciar la aplicación.
4. Crear un endpoint GET `/` que devuelva información básica de la API.
5. Crear un endpoint GET `/health` que indique si el modelo está cargado.
6. Crear un endpoint POST `/predict` para recibir los datos de un cliente en formato JSON.
7. Definir un modelo Pydantic con las variables predictoras utilizadas durante el entrenamiento, respetando sus nombres y tipos.
8. Convertir los datos recibidos en un DataFrame de Pandas.
9. Ejecutar `predict()` y `predict_proba()` utilizando el modelo cargado.
10. Devolver una respuesta JSON con:
    - `prediccion`: "Abandona" o "No abandona".
    - `probabilidad_abandono`: valor entre 0 y 1.
11. Implementar validaciones básicas y manejo de errores.
12. Utilizar rutas relativas a la raíz del proyecto.

### Restricciones
- No volver a entrenar el modelo.
- No modificar el notebook existente.
- Mantener el código corto, sencillo y educativo.
- No crear archivos adicionales innecesarios.
- Seguir las instrucciones de `AGENTS.md`.