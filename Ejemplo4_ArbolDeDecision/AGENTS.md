# AGENTS.md

## Objetivo

Desarrollar un proyecto educativo de Machine Learning para la detección de otakus mediante modelos de clasificación, utilizando datos sintéticos y un enfoque humorístico, sin comprometer el rigor metodológico.

## Entorno de desarrollo

- Utilizar Python y Scikit-learn como tecnologías principales.
- Utilizar exclusivamente el siguiente intérprete de Python:

```
C:\Users\Pc\anaconda3\python.exe
```

- Ejecutar los comandos desde la raíz del proyecto.
- No crear entornos virtuales ni cambiar de intérprete sin autorización.
- Registrar las dependencias necesarias en `requirements.txt`.

## Estándares de desarrollo

- Aplicar buenas prácticas de Machine Learning e ingeniería de software.
- Priorizar código sencillo, legible y mantenible, considerando el carácter educativo del proyecto.
- Utilizar nombres descriptivos para variables, funciones y archivos.
- Incorporar comentarios técnicos que expliquen las decisiones relevantes del código.
- Respetar la estructura de carpetas establecida.
- Gestionar las rutas mediante `pathlib`, evitando rutas absolutas en el código fuente.
- Establecer una semilla aleatoria de `42` cuando corresponda.
- Evitar dependencias, abstracciones y patrones de diseño innecesarios.

## Integridad experimental

- Evitar cualquier forma de fuga de información (Data Leakage).
- Preservar la integridad del dataset original `data/detector_otakus.csv`.
- Garantizar la reproducibilidad de los experimentos.
- Utilizar exclusivamente métricas y resultados obtenidos mediante ejecuciones verificables.
- Mantener separados los procesos de entrenamiento e inferencia.
- Reutilizar el Pipeline persistido durante la inferencia, sin volver a ajustar sus componentes.
- No presentar los resultados obtenidos con datos sintéticos como evidencia científica sobre poblaciones reales.

## Documentación

- Redactar la documentación en español y en tercera persona.
- Utilizar explicaciones técnicas, claras y didácticas.
- Mantener actualizado el README cuando se incorporen nuevas funcionalidades.
- Conservar el enfoque educativo y humorístico del proyecto.

## Restricciones

- Ejecutar únicamente las tareas definidas en el prompt actual.
- No adelantar etapas posteriores del proyecto.
- No incorporar funcionalidades ni técnicas que no hayan sido solicitadas.
- No modificar archivos ajenos a la tarea.
- No eliminar ni sobrescribir archivos sin justificación.
- No almacenar credenciales o información sensible en el código fuente.
- No realizar commits ni publicar cambios sin autorización.

## Verificación

- Ejecutar y verificar el código generado antes de finalizar cada tarea.
- Corregir los errores identificados durante la ejecución.
- No ocultar errores ni sustituir resultados fallidos por información ficticia.
- Informar sobre los archivos creados o modificados, las verificaciones realizadas y las limitaciones encontradas.