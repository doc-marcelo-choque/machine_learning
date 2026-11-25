Modificar `notebooks/01_experimento_otakus.ipynb` para incorporar una sección reproducible de persistencia y recuperación del modelo final seleccionado previamente mediante validación. El proceso deberá conservar intacto el criterio de selección y utilizar `joblib` para guardar el `Pipeline` completo.

Se respetará `AGENTS.md`, se utilizarán rutas relativas con `pathlib`, se mantendrá la documentación en español y en tercera persona, y no se modificará el dataset original.

## Implementación requerida

1. Recuperar el mejor modelo definido por los resultados de validación del experimento, sin volver a elegirlo a partir del conjunto de prueba.
2. Confirmar que el objeto a persistir contiene el preprocesamiento y el estimador dentro de un único `Pipeline` ya ajustado.
3. Serializarlo mediante Joblib en `modelos/modelo_otaku.joblib`, creando la carpeta solo si fuese necesario.
4. Generar `modelos/metadata_modelo.json` en UTF-8 con un formato legible y valores serializables en JSON.
5. Registrar en los metadatos, como mínimo:
   - nombre y propósito del modelo;
   - algoritmo seleccionado;
   - hiperparámetros elegidos;
   - métrica principal de selección y métricas reales disponibles, indicando si proceden de validación o prueba;
   - versión de Scikit-learn;
   - fecha y hora de entrenamiento en un formato inequívoco, con zona horaria cuando esté disponible;
   - nombres y orden esperado de las variables de entrada;
   - tipos de datos esperados;
   - categorías válidas observadas para las variables categóricas;
   - nombre y significado de la variable objetivo y de la clase positiva;
   - semilla aleatoria utilizada;
   - versiones de las dependencias necesarias para reproducir la inferencia, al menos Python, NumPy, pandas, Scikit-learn y Joblib.
6. Cargar nuevamente `modelos/modelo_otaku.joblib` desde disco en un objeto distinto.
7. Construir uno o más registros nuevos válidos con el mismo esquema de entrada y realizar inferencia con el pipeline recuperado.
8. Comparar las predicciones y, si están disponibles, las probabilidades del modelo original y del recuperado. La verificación deberá fallar de forma visible si no son equivalentes dentro de una tolerancia numérica adecuada.
9. Documentar el procedimiento, las rutas, el esquema de metadatos, las comprobaciones realizadas y las precauciones de compatibilidad y seguridad al cargar archivos Joblib.

## Reglas y verificación

- No se persistirá únicamente el estimador: deberá guardarse el pipeline completo para evitar duplicar o desalinear el preprocesamiento durante la inferencia.
- No se volverá a entrenar ni optimizar el modelo como consecuencia de la prueba de serialización.
- Las métricas registradas se tomarán de resultados reales y trazables; no se inventarán ni recalcularán sobre datos inadecuados.
- Las categorías válidas se obtendrán del esquema o de los datos de entrenamiento, nunca mediante una inspección orientada por el conjunto de prueba.
- Los tipos y valores derivados de NumPy se convertirán explícitamente a tipos compatibles con JSON.

El entregable estará compuesto por el notebook actualizado, `modelos/modelo_otaku.joblib` y `modelos/metadata_modelo.json`. 

