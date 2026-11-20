# Clasificación de clientes con inferencia Batch y PostgreSQL

## Requisitos

PostgreSQL 14+ y Python 3.10+.

1. Crear una base de datos llamada `ClientesMl` en pgAdmin.
2. Ejecutar `clientesml.sql` dentro de esa base.
3. Editar `.env`, especialmente `DB_PASSWORD`. No subir `.env` a Git.
4. Utilizar el entorno existente `C:\Users\Pc\anaconda326\envs\mlops\python.exe`; no crear otro entorno.
5. Desde la raíz, instalar las dependencias y ejecutar los procesos necesarios:

```powershell
pip install -r requirements.txt
python scripts/02_entrenar.py
python scripts/03_inferencia_batch.py
```

## Dashboard de predicciones

Desde la raíz del proyecto:

```powershell
python -m streamlit run app/dashboard.py
```

Abrir `http://localhost:8501`. El dashboard lee las credenciales de `.env` mediante
`scripts/config.py` y consulta PostgreSQL en una transacción de solo lectura.
No entrena modelos ni ejecuta la inferencia.

- **Universo:** todos los registros de `clientes_nuevos`, unidos a
  `predicciones_clientes` por ID. Los datos históricos se reservan para el entrenamiento.
- **Indicadores y gráficos:** resumen global; incluye clientes sin clasificar en
  los conteos. Las probabilidades solo consideran clientes con predicción.
- **Resultados:** filtrar por clasificación y buscar por ID exacto. El CSV contiene
  las mismas filas y columnas que la tabla, con probabilidades entre 0 y 100 (%)
  y fechas en hora de Bolivia. Los valores de probabilidad vacíos indican pendientes.
- **Actualización:** caché de consultas de 5 minutos. Al interactuar después de ese
  plazo se vuelve a consultar; el botón **Actualizar datos** permite hacerlo de inmediato.
- Si no hay clientes, predicciones o coincidencias, se muestra el estado correspondiente.
  Los errores de conexión no exponen credenciales.

La visualización está en `app/dashboard.py`, la lectura y preparación en
`app/datos.py`, y los gráficos Plotly en `app/graficos.py`.


## Api rest de predicciones

Instalar 

`pip install "fastapi[standard]"`

Ejecutar

`fastapi dev api.py`  