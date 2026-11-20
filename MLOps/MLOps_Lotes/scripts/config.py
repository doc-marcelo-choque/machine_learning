import os
from pathlib import Path

from dotenv import load_dotenv
from sqlalchemy import create_engine
from sqlalchemy.engine import URL

BASE_DIR = Path(__file__).resolve().parent.parent
load_dotenv(BASE_DIR / ".env")


def obtener_motor():
    """Crea el motor a partir de variables de entorno, sin credenciales en código."""
    password = os.getenv("DB_PASSWORD")
    if not password or password == "CAMBIAR_CONTRASENA":
        raise ValueError("Define DB_PASSWORD en el archivo .env")

    url = URL.create(
        drivername="postgresql+psycopg",
        username=os.getenv("DB_USER", "postgres"),
        password=password,
        host=os.getenv("DB_HOST", "localhost"),
        port=int(os.getenv("DB_PORT", "5432")),
        database=os.getenv("DB_NAME", "clientes_ml"),
    )
    return create_engine(url, pool_pre_ping=True)
