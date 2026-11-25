Revisar el notebook ejecutado `notebooks/01_experimento_otakus.ipynb` y enriquecerlo con interpretaciones rigurosas en celdas Markdown, basadas exclusivamente en las salidas, tablas, métricas y gráficas reales producidas por su ejecución.

Se respetará `AGENTS.md`, se mantendrá la documentación en español y en tercera persona, y no se modificará `data/detector_otakus.csv`. Las interpretaciones deberán ser accesibles para un contexto educativo, conservar el tono humorístico del proyecto y distinguir con claridad evidencia, inferencia y limitación.

## Análisis requerido

Se incorporarán interpretaciones junto a la sección o resultado correspondiente, cubriendo como mínimo:

- Los hallazgos del análisis exploratorio, incluidas distribuciones, desbalance de clases, relaciones relevantes, datos faltantes, valores atípicos y redundancias observadas.
- El desempeño del `DummyClassifier` y lo que representa como referencia mínima.
- El significado individual de Accuracy, Precision, Recall, F1-score y ROC-AUC en el contexto de la clase positiva `es_otaku=1`.
- La comparación del rendimiento y la estabilidad de `LogisticRegression` y `DecisionTreeClassifier`, considerando promedios y dispersión entre particiones.
- Los resultados de la validación cruzada y el grado de consistencia entre folds.
- Los hiperparámetros seleccionados por `GridSearchCV` y su efecto esperado sobre complejidad, regularización y generalización.
- Las matrices de confusión, detallando falsos positivos y falsos negativos sin trivializar su significado.
- Las curvas ROC y, cuando estén disponibles, las curvas Precision-Recall y de aprendizaje.
- El diagnóstico de overfitting y underfitting a partir de evidencia de entrenamiento, validación y curvas de aprendizaje.
- Los coeficientes de la regresión logística, teniendo en cuenta el preprocesamiento, la codificación y que una asociación no implica causalidad.
- Las reglas y divisiones más relevantes del árbol de decisión, evitando extrapolar fuera de los datos observados.
- La importancia de las variables, aclarando las limitaciones del método de importancia utilizado.
- Las variables relacionadas con hábitos de higiene, con tratamiento respetuoso y humorístico, sin convertir correlaciones sintéticas en estereotipos sobre personas reales.
- La justificación del modelo final a partir de la métrica principal y los resultados de validación.
- Las conclusiones, limitaciones del experimento, posibles sesgos de los datos sintéticos y líneas de mejora.


