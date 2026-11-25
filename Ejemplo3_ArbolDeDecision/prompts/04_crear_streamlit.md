
Crear una aplicación web de inferencia en `app/app.py` con Streamlit. La aplicación cargará el pipeline ya entrenado desde `modelos/modelo_otaku.joblib` y sus metadatos desde `modelos/metadata_modelo.json`; no volverá a entrenar el modelo ni reimplementará el preprocesamiento.

Se respetará `AGENTS.md`, se utilizarán rutas relativas robustas construidas con `pathlib` a partir de la ubicación del archivo, y toda la interfaz y documentación se redactarán en español y en tercera persona.

## Funcionalidad requerida

- Cargar el `Pipeline` serializado mediante Joblib dentro de una función decorada con `st.cache_resource`.
- Cargar y validar los metadatos del modelo. Podrá utilizarse un mecanismo de caché apropiado para datos inmutables.
- Gestionar de forma clara los errores por archivos ausentes, incompatibilidad de versiones, metadatos inválidos o fallo durante la carga, sin mostrar una traza técnica completa al usuario final.
- Construir un formulario con todas las variables de entrada que requiera el pipeline, respetando exactamente sus nombres y los tipos registrados en los metadatos.
- Utilizar sliders, selectores, campos numéricos y otros controles adecuados al dominio, rango y tipo de cada variable.
- Obtener las opciones categóricas desde los metadatos, en lugar de mantener listas divergentes en la aplicación.
- Validar rangos, valores obligatorios, categorías y tipos antes de realizar la inferencia. Se deberán mostrar mensajes útiles ante entradas inválidas.
- Construir un `pandas.DataFrame` de una fila, con columnas en el orden y con los tipos esperados por el pipeline.
- Obtener la clase mediante `predict()`.
- Obtener la probabilidad de pertenecer a la clase positiva mediante `predict_proba()`, localizando explícitamente la posición de esa clase en `classes_` en lugar de asumir de forma ciega que corresponde a una columna fija.
- Mostrar de forma destacada la clasificación y la probabilidad estimada, con formato comprensible.
- Incorporar mensajes humorísticos relacionados con el anime que varíen según el resultado, sin presentar la clasificación como un juicio real sobre una persona.
- Mostrar información tomada de los metadatos sobre el algoritmo seleccionado, hiperparámetros relevantes y métricas reales, indicando el origen de cada métrica.
- Informar de forma visible que el modelo utiliza datos sintéticos, tiene finalidad educativa y humorística, y no debe emplearse para decisiones reales.

## Interfaz y diseño

La interfaz será moderna, legible y adaptable, inspirada en una estética de anime mediante una paleta coherente, jerarquía visual, tarjetas o secciones y detalles gráficos sobrios. El estilo no deberá perjudicar el contraste, la accesibilidad ni la claridad de los controles. Se evitarán recursos externos innecesarios y contenido con restricciones de autor.

El formulario deberá separar las variables por grupos comprensibles, por ejemplo datos generales, consumo de contenido, participación en actividades y hábitos. Los mensajes humorísticos deberán acompañar la experiencia sin ocultar advertencias, errores ni resultados.

## Arquitectura y restricciones

- La aplicación no leerá el dataset de entrenamiento para inferir el esquema ni las categorías.
- No llamará a `fit`, `fit_transform`, `GridSearchCV` ni a ninguna rutina de entrenamiento.
- No duplicará `OneHotEncoder`, `StandardScaler`, imputaciones o reglas de ingeniería de características ya incluidas en el pipeline.
- No modificará el modelo, los metadatos ni `data/detector_otakus.csv`.
- Se mantendrán separadas la carga de artefactos, la creación y validación de entradas, la inferencia y la presentación.
- Se añadirán comentarios técnicos únicamente donde expliquen decisiones no evidentes, como la resolución de rutas, el caché o la clase positiva.

## Verificación y entregable

Se verificará al menos que:

1. `streamlit run app/app.py` inicia la aplicación desde la raíz del proyecto sin errores.
2. El modelo y los metadatos se cargan una sola vez por recurso cacheado.
3. El formulario genera un DataFrame compatible con el esquema persistido.
4. Una entrada válida produce clase y probabilidad.
5. Las entradas inválidas y la ausencia temporal de artefactos muestran errores controlados.
6. No se ejecuta ningún entrenamiento durante el inicio ni durante una predicción.

El entregable será `app/app.py` y, solo si resulta imprescindible para mantener el código claro, módulos auxiliares dentro de `app/`. No se alterarán los resultados experimentales ni la selección del modelo.

