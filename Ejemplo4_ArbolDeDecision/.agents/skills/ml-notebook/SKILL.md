---
name: ml-notebook
description: Crea y modifica notebooks Jupyter profesionales, didácticos y reproducibles para Machine Learning y ciencia de datos.
---

# Skill: ml-notebook

## Propósito

Crear o modificar notebooks Jupyter que expliquen un análisis o experimento de ciencia de datos de forma clara, rigurosa y reproducible. El notebook debe acompañar el razonamiento, no limitarse a ejecutar código ni convertirse en un informe excesivamente extenso.

Aplicar las instrucciones del proyecto y los requisitos explícitos de la tarea. No duplicarlos ni agregar requisitos de proyecto a esta guía. Mantener el enfoque general: no asumir un dataset, dominio, algoritmo, idioma o nivel académico específico si no se solicita.

## Estructura y narrativa

- Organizar el notebook en secciones con una progresión comprensible, desde el propósito y los datos hasta el análisis, el modelado cuando corresponda, los resultados y las conclusiones.
- Ajustar las secciones al objetivo real; no incluir etapas, técnicas o entregables que no aporten a la tarea.
- Abrir con un título y una breve descripción del problema, objetivo y alcance. Definir los datos y las variables relevantes antes de analizarlos.
- Mantener una secuencia que permita entender por qué se realiza cada paso, qué se hizo y qué se observó.
- Cerrar con conclusiones respaldadas por resultados observados, limitaciones y posibles siguientes pasos pertinentes.

## Organización de celdas

- Usar celdas Markdown para títulos, contexto, conceptos, decisiones, interpretación y transiciones.
- Usar celdas de código para una unidad de trabajo coherente; evitar celdas monolíticas y fragmentación excesiva.
- Separar configuración e importaciones, carga y revisión de datos, transformaciones, análisis, entrenamiento, evaluación y visualizaciones cuando estén presentes.
- Mantener un orden de ejecución lineal, de arriba hacia abajo. Evitar depender de variables creadas en celdas posteriores o de ejecuciones manuales fuera de orden.
- Evitar salidas redundantes, tablas o gráficos repetidos y celdas vacías o experimentales sin propósito.

## Documentación y teoría

- Explicar conceptos, métodos y decisiones con precisión y lenguaje accesible al público definido por la tarea.
- Presentar primero la intuición y luego el detalle necesario; conectar cada método con su función en el análisis.
- Incluir supuestos, ventajas y limitaciones cuando sean relevantes para interpretar un método o resultado.
- Usar notación LaTeX legible para fórmulas matemáticas. Definir símbolos, explicar qué representa la expresión y relacionarla con el problema; no incluir fórmulas decorativas o sin interpretación.
- Diferenciar claramente hechos observados, hipótesis, decisiones metodológicas e interpretaciones.
- Atribuir fuentes externas cuando se incorporen definiciones, métodos o afirmaciones específicas que requieran referencia. No inventar citas.

## Calidad del código y reproducibilidad

- Preferir código sencillo, legible y explícito, con nombres descriptivos y responsabilidades acotadas.
- Reutilizar las herramientas y convenciones del proyecto. Evitar abstracciones, dependencias, configuraciones y pasos de instalación innecesarios.
- Mantener las transformaciones y el ajuste del modelo dentro de un flujo que impida aprender información del conjunto de evaluación. Ajustar cada transformación solo con los datos de entrenamiento.
- No afirmar que una ejecución, resultado o experimento se completó si no se verificó. No inventar resultados ni sustituir errores por salidas aparentes de éxito.
- Mantener consistencia entre código, tablas, figuras y texto; calcular métricas y valores a partir de la ejecución efectiva.
- Dejar explícitos los parámetros importantes y las fuentes de aleatoriedad cuando sean pertinentes, siguiendo las instrucciones del proyecto o de la tarea.

## Visualización e interpretación

- Elegir cada tabla o gráfico para responder una pregunta concreta y usar la visualización más sencilla que lo permita.
- Incluir títulos informativos, etiquetas de ejes, unidades cuando correspondan, leyendas necesarias y formatos legibles.
- Mantener escalas y categorías adecuadas; no ocultar distribuciones, incertidumbre o desbalance que afecten la interpretación.
- Explicar qué muestra la figura y qué se puede —y no se puede— concluir. No interpretar asociación como causalidad.
- Interpretar métricas en el contexto del problema y explicar su significado cuando el público pueda no conocerlas. Indicar la clase positiva o la referencia usada cuando aplique.
- Relacionar las conclusiones con evidencia presentada y señalar límites de los datos, el diseño experimental y la generalización.

## Verificación del notebook

- Cuando la tarea lo permita, ejecutar el notebook completo en orden desde un estado limpio para detectar errores de dependencias entre celdas y confirmar que las salidas corresponden al código actual.
- Revisar que rutas y recursos requeridos estén disponibles según la estructura del proyecto, sin introducir rutas locales específicas del equipo.
- Inspeccionar errores, advertencias relevantes, salidas obsoletas, gráficos y tablas después de la ejecución.
- Si no es posible o no está permitido ejecutarlo, indicarlo con claridad y realizar únicamente las comprobaciones alternativas que correspondan; no presentar el notebook como verificado en ejecución.
- Al modificar un notebook existente, preservar el contenido no relacionado con la tarea y comprobar que la estructura del archivo siga siendo un notebook válido.
