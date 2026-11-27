# OtakuDetector AI

OtakuDetector AI es un proyecto educativo de Machine Learning que estudia, con datos sintéticos y en tono humorístico, la clasificación de personas como otakus o no otakus.


## Tecnologías

- Python 3.*
- NumPy y pandas
- Matplotlib y Seaborn
- Scikit-learn
- Jupyter
- Joblib
- Streamlit
- FastAPI

## Dataset

El archivo `data/detector_otakus.csv` contiene observaciones sintéticas sobre edad, consumo de anime y manga, asistencia a convenciones, preferencias y hábitos, entre otras variables. `persona_id` identifica cada registro y `es_otaku` es la variable objetivo binaria. El archivo constituye la fuente original del experimento y no debe modificarse, eliminarse ni regenerarse.

## Preparación del entorno

En PowerShell, se crea y activa un entorno Conda con los siguientes comandos:

```powershell
conda create -n otaku_detector python=3.13 -y
conda activate machinelearning
pip install -r requirements.txt
python -c "import sys; print(sys.executable)"
```
