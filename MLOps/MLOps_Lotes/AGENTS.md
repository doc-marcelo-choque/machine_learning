# AGENTS.md — Proyecto Machine Learning Batch

## Contexto

Proyecto de clasificación de clientes mediante Machine Learning, PostgreSQL y procesamiento Batch.

El entrenamiento y la inferencia ya están implementados. Se desarrollará una interfaz Streamlit para consultar y visualizar las predicciones almacenadas en PostgreSQL.

## Tecnologías

- Python
- PostgreSQL
- Scikit-learn
- Pandas
- SQLAlchemy
- Streamlit
- Plotly

## Estructura

- `scripts/`: entrenamiento, inferencia Batch y conexión a PostgreSQL.
- `sql/`: estructura y datos de la base de datos.
- `modelos/`: modelos entrenados.
- `app/`: dashboard Streamlit.
- `prompts/`: instrucciones específicas de desarrollo.

## Reglas generales

1. Revisar el código existente antes de implementar funcionalidades.
2. Mantener la estructura actual del proyecto.
3. Reutilizar funciones existentes siempre que sea posible.
4. No modificar el entrenamiento ni la inferencia Batch salvo autorización explícita.
5. Cargar las credenciales desde `.env`.
6. No incluir contraseñas en el código.
7. Utilizar consultas SQL parametrizadas cuando existan filtros.
8. No generar datos simulados para el dashboard.
9. Separar la visualización del procesamiento de Machine Learning.
10. Mantener un código sencillo, legible y modular.
11. Utliza el entorno de python indicado no crees nuevos entornos

## Entorno Python

El proyecto utiliza un entorno virtual local de Python ubicado en:

`C:\Users\Pc\anaconda326\envs\mlops\python.exe`

## Ejecución

Los comandos deben ejecutarse desde la raíz del proyecto.
