Crea un notebook en `notebooks/entrenamiento.ipynb` utilizando `data/clientes.csv`.

El notebook debe contener celdas Markdown y código separadas, siguiendo estos pasos:

1. Objetivo del proyecto.
2. Importación de librerías.
3. Carga y visualización de los primeros registros.
4. Exploración de dimensiones, tipos de datos, valores faltantes y distribución de Churn.
5. Limpieza de TotalCharges y eliminación de customerID.
6. Separación de variables predictoras y Churn como objetivo (Yes=1, No=0).
7. División entrenamiento/prueba 80/20 con stratify y random_state=42.
8. Creación de un Pipeline con imputación, OneHotEncoder y DecisionTreeClassifier(max_depth=5, random_state=42).
9. Entrenamiento del modelo.
10. Evaluación mediante Accuracy, Precision, Recall, F1 y matriz de confusión.
11. Guardado del Pipeline completo en `models/modelo.pkl` mediante joblib.

Requisitos:
- Código corto y sencillo.
- Explicaciones Markdown por etapas.
- No generar otros archivos de resultados.
- No ejecutar el notebook automáticamente.