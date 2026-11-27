Crear el notebook `notebooks/01_experimento_otakus.ipynb` para desarrollar un experimento de clasificación binaria utilizando el dataset sintético `data/detector_otakus.csv`.

Se utilizarán los algoritmos LogisticRegression y DecisionTreeClassifier para predecir la variable `es_otaku`, comparar su rendimiento y seleccionar el modelo más adecuado.

Respetar las instrucciones de `AGENTS.md`, utilizar rutas relativas mediante pathlib y conservar el dataset original.

El notebook deberá contener explicaciones teóricas sencillas, celdas Markdown y código comentado. Toda la documentación deberá redactarse en español y en tercera persona, con un enfoque didáctico dirigido a estudiantes que están aprendiendo Machine Learning.

## 1. Definición del problema

- Describir el problema de clasificación.
- Establecer el objetivo del experimento.
- Identificar las variables predictoras y la variable objetivo.
- Formular una hipótesis sencilla.
- Explicar brevemente los algoritmos que se utilizarán.

## 2. Configuración y carga de datos

- Importar las bibliotecas necesarias.
- Establecer random_state=42 para garantizar la reproducibilidad de las operaciones aleatorias.
- Cargar el dataset.
- Mostrar los primeros registros, dimensiones y tipos de datos.
- Identificar las variables numéricas y categóricas.

## 3. Calidad de los datos

- Identificar valores nulos.
- Identificar registros duplicados.
- Revisar los tipos de datos.
- Verificar los rangos y categorías de las variables.
- Excluir `persona_id` de las variables predictoras.
- Identificar posibles variables redundantes.

Si no existen valores faltantes, no implementar técnicas de imputación innecesarias.

## 4. Partición de los datos

Separar las variables predictoras X de la variable objetivo y.

Utilizar train_test_split para realizar una partición estratificada:

- 80 % para entrenamiento.
- 20 % para prueba.
- random_state=42.

Explicar la finalidad de cada conjunto de datos.

Reservar el conjunto de prueba exclusivamente para la evaluación final del modelo seleccionado.

## 5. Análisis exploratorio de datos

Realizar el análisis exploratorio utilizando los datos de entrenamiento.

Incluir:

- Distribución de la variable objetivo.
- Estadísticas descriptivas.
- Histogramas de variables numéricas.
- Gráficos de frecuencia de variables categóricas.
- Matriz de correlación de variables numéricas.
- Relación de algunas variables predictoras con la variable objetivo.

## 6. Preprocesamiento

Preparar las variables para el entrenamiento utilizando:

- OneHotEncoder para las variables categóricas.
- StandardScaler para las variables numéricas de la regresión logística.
- ColumnTransformer para organizar las transformaciones.
- Pipeline para integrar el preprocesamiento y el modelo.

Configurar OneHotEncoder con handle_unknown="ignore".

El árbol de decisión no deberá utilizar escalado, debido a que no lo necesita.

## 7. Modelo de referencia 

Utilizar DummyClassifier con la estrategia most_frequent como modelo de referencia.

Explicar qué es un baseline y por qué los modelos entrenados deberían superar su rendimiento.

## 8. Entrenamiento de los modelos

Construir y entrenar los siguientes modelos:

- LogisticRegression.
- DecisionTreeClassifier.

Utilizar configuraciones sencillas de hiperparámetros, explicando los principales parámetros utilizados.

Limitar la profundidad del árbol de decisión para controlar su complejidad.

No implementar todavía GridSearchCV ni otras técnicas de optimización automática.

## 9. Validación cruzada y comparación

Utilizar StratifiedKFold con cinco particiones, shuffle=True y random_state=42.

Evaluar el baseline y los dos modelos utilizando exactamente las mismas particiones.

Calcular:

- Accuracy.
- Precision.
- Recall.
- F1-score.
- ROC-AUC.

Presentar una tabla comparativa con el promedio y la desviación estándar del F1-score de cada modelo.

Generar un gráfico comparativo de los resultados.

Seleccionar el mejor modelo utilizando el F1-score promedio de la validación cruzada, considerando `es_otaku=1` como clase positiva.

No utilizar el conjunto de prueba para seleccionar el modelo.

## 10. Evaluación final e interpretación

Entrenar el modelo seleccionado utilizando todo el conjunto de entrenamiento y evaluarlo sobre el conjunto de prueba.

Presentar:

- Accuracy.
- Precision.
- Recall.
- F1-score.
- ROC-AUC.
- Matriz de confusión.
- Curva ROC.

Explicar qué representa cada métrica y cómo debe interpretarse.

Comparar el rendimiento del modelo seleccionado sobre los datos de entrenamiento y prueba para identificar posibles problemas de overfitting o underfitting.

Visualizar el árbol de decisión y los coeficientes de la regresión logística para comprender de manera básica cómo funcionan ambos modelos. Utilizar los nombres de las variables transformadas.

## 11. Inferencia con nuevos datos

Crear un registro ficticio compatible con las variables del dataset.

Utilizar el Pipeline del modelo seleccionado para:

- Realizar una predicción.
- Obtener la probabilidad de pertenecer a la clase otaku.
- Mostrar e interpretar el resultado con un mensaje humorístico.

Dejar el Pipeline entrenado disponible en una variable denominada `mejor_modelo` para su posterior serialización.

## 12. Conclusiones y limitaciones

Incluir una conclusión preliminar que indique:

- Qué modelo obtuvo el mejor rendimiento.
- Si los modelos superaron al baseline.
- Qué variables resultaron relevantes.
- Qué limitaciones presenta el experimento.
- Qué mejoras podrían realizarse posteriormente.

Aclarar que los datos son sintéticos y que el proyecto tiene una finalidad exclusivamente educativa y humorística.

## Entregables

- Notebook `notebooks/01_experimento_otakus.ipynb`.

## Restricciones

- No modificar el dataset original.
- No inventar métricas ni resultados.
- Evitar fugas de información durante el preprocesamiento.
- No implementar optimización automática de hiperparámetros.
- No utilizar técnicas avanzadas de explicabilidad.
- No serializar todavía el modelo.
- No desarrollar la aplicación Streamlit.
- Evitar código innecesariamente complejo, funciones abstractas y estructuras difíciles de comprender para estudiantes principiantes.

No ejecutar el notebook generado