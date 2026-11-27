Desarrollar una API REST utilizando FastAPI para realizar predicciones de clasificación binaria en el proyecto OtakuDetector AI, reutilizando el modelo de Machine Learning previamente entrenado y serializado.

Utilizar los archivos existentes:

- `modelos/modelo_otaku.joblib`
- `modelos/metadata_modelo.json`

Respetar las instrucciones de `AGENTS.md` y mantener las funcionalidades existentes del proyecto.

## 1. Estructura

Crear los siguientes archivos:

- `api/__init__.py`: inicialización del paquete.
- `api/main.py`: configuración de FastAPI y endpoints.

Agregar fastapi, uvicorn y pydantic al archivo `requirements.txt`, conservando las dependencias existentes.

## 2. Carga del modelo

Cargar el Pipeline serializado mediante Joblib y utilizar pathlib para localizar los archivos desde la raíz del proyecto.

Cargar el modelo una sola vez durante el inicio de la aplicación.

Consultar los metadatos para identificar las variables de entrada, el algoritmo seleccionado y las categorías válidas.

No volver a entrenar el modelo ni implementar manualmente el preprocesamiento.

## 3. Esquemas y validación

Utilizar Pydantic para definir y validar los datos recibidos por la API.

Inspeccionar el modelo serializado y los metadatos para identificar las características que realmente requiere el Pipeline.

Definir los campos numéricos y categóricos correspondientes, incluyendo rangos y categorías válidas.

No incluir `persona_id` ni `es_otaku` como datos de entrada.

Definir también un esquema para la respuesta de la predicción.

## 4. Endpoints

Implementar los siguientes endpoints:

### GET /

Mostrar el nombre, la descripción y la versión de la API.

### GET /health

Informar si la API se encuentra operativa y el modelo está disponible.

### GET /model/info

Devolver información del modelo, incluyendo:

- Algoritmo utilizado.
- Versión.
- Variables de entrada.
- Métricas de evaluación disponibles.

Utilizar exclusivamente la información real almacenada en los metadatos.

### POST /predict

Recibir las características de una persona mediante JSON.

Construir un DataFrame compatible con el Pipeline entrenado.

Utilizar predict() para obtener la clasificación y predict_proba() para obtener la probabilidad correspondiente a la clase positiva `es_otaku=1`.

Devolver una respuesta JSON con:

- Predicción numérica: 0 o 1.
- Clasificación: No otaku u Otaku.
- Probabilidad de ser otaku.
- Nombre del algoritmo utilizado.
- Mensaje humorístico según la clasificación.

## 5. Documentación de la API

Configurar el título, la descripción y la versión de FastAPI.

Documentar los endpoints mediante descripciones y ejemplos válidos de solicitudes y respuestas.

Utilizar la documentación automática Swagger UI disponible en `/docs`.

## Restricciones

- No modificar el dataset original.
- No modificar ni volver a entrenar el modelo.
- No modificar el notebook experimental.
- No modificar la aplicación Streamlit existente.
- No generar predicciones ni probabilidades ficticias.
- No incorporar bases de datos, autenticación ni arquitecturas innecesariamente complejas.
- Utilizar código sencillo, organizado y con comentarios técnicos claros.
- Mantener toda la documentación en español.