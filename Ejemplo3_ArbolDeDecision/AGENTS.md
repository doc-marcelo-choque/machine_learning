## Objetivo

Proyecto de entrenamiento de modelo ML para detecccion de otakus utilizando modelos de clasificacion

## Alcance y tecnología

- Se utilizarán Python y Scikit-learn como tecnologías principales.
- Se aplicarán buenas prácticas de Machine Learning y de ingeniería de software.
- Se mantendrá la estructura de carpetas establecida; cualquier archivo nuevo deberá ubicarse según su responsabilidad.
- Se utilizarán rutas relativas construidas con `pathlib`, evitando rutas absolutas dependientes del equipo.
- Se establecerá una semilla aleatoria de `42` siempre que el componente utilizado permita controlar la aleatoriedad.

## Interprete



## Metodología de Machine Learning

- Se evitará toda fuga de información durante el entrenamiento, la selección de modelos y la evaluación.
- El dataset original `data/detector_otakus.csv` no se modificará, eliminará ni regenerará.
- No se inventarán métricas, resultados experimentales ni conclusiones no sustentadas por ejecuciones verificables.
- Se verificará el funcionamiento del código generado antes de dar una tarea por terminada.
- El entrenamiento y la inferencia se mantendrán separados: la inferencia reutilizará el pipeline persistido y no volverá a ajustar transformadores ni modelos.

