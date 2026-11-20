# 01_crear_dashboard.md

Desarrolla un dashboard en Streamlit para visualizar las predicciones de clientes generadas por el proceso Batch.

Antes de implementar, revisa `AGENTS.md`, `scripts/config.py`, `scripts/03_inferencia_batch.py` y `sql/clientesml.sql` para identificar la estructura real de los datos.

## Requisitos

Crear `app/dashboard.py` con:

### Indicadores KPI
- Total de clientes.
- Clientes clasificados.
- Clientes con predicción de compra.
- Clientes con predicción de no compra.
- Probabilidad promedio de compra.

### Visualizaciones
- Distribución de las clasificaciones.
- Histograma de probabilidades.
- Clasificaciones por rango de edad.
- Probabilidad promedio por canal de adquisición.

### Tabla de resultados
- Mostrar los clientes y sus predicciones.
- Incorporar filtros por clasificación.
- Permitir buscar por ID del cliente.
- Permitir exportar resultados a CSV.

## Condiciones

- Utilizar Streamlit, Pandas y Plotly.
- Reutilizar la conexión existente a PostgreSQL.
- Consultar únicamente datos reales de las tablas existentes.
- Incorporar un botón de actualización de datos.
- Utilizar caché para las consultas.
- Manejar errores y tablas vacías.
- Mantener una interfaz moderna, sencilla y en español.
- Actualizar `requirements.txt` si faltan dependencias.

No modificar los scripts de entrenamiento e inferencia Batch.