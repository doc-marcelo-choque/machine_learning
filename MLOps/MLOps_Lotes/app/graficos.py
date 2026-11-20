"""Gráficos Plotly construidos únicamente a partir de los resultados consultados."""

import pandas as pd
import plotly.express as px
import plotly.graph_objects as go

from app.datos import CLASIFICACIONES


def crear_graficos(clientes: pd.DataFrame) -> list[tuple[str, go.Figure, str]]:
    """Incluye pendientes en los conteos y excluye nulos de las probabilidades."""
    distribucion = (
        clientes["clasificacion"].value_counts()
        .reindex(CLASIFICACIONES, fill_value=0)
        .rename_axis("Clasificación").reset_index(name="Clientes")
    )
    figura_clases = px.bar(
        distribucion, x="Clasificación", y="Clientes", color="Clasificación",
        text="Clientes", category_orders={"Clasificación": CLASIFICACIONES},
    )
    figura_clases.update_layout(showlegend=False)
    descripcion = "; ".join(
        f"{fila['Clasificación']}: {fila['Clientes']} clientes"
        for _, fila in distribucion.iterrows()
    )
    graficos = [("Distribución de las clasificaciones", figura_clases, descripcion)]

    probabilidades = clientes.loc[clientes["prediccion"].notna()].dropna(
        subset=["probabilidad_compra"]
    )
    if not probabilidades.empty:
        figura_histograma = go.Figure(go.Histogram(
            x=probabilidades["probabilidad_compra"],
            xbins={"start": 0, "end": 1, "size": 0.1},
            hovertemplate="Probabilidad: %{x:.0%}<br>Clientes: %{y}<extra></extra>",
        ))
        figura_histograma.update_layout(
            xaxis_title="Probabilidad de compra", yaxis_title="Clientes",
            xaxis={"range": [0, 1], "tickformat": ".0%"},
        )
        promedio = probabilidades["probabilidad_compra"].mean()
        graficos.append((
            "Histograma de probabilidades", figura_histograma,
            f"Probabilidades de {len(probabilidades)} clientes clasificados, "
            f"con un promedio de {promedio:.1%}.",
        ))

    por_edad = clientes.assign(rango_edad=pd.cut(
        clientes["edad"], bins=[17, 25, 35, 45, 55, 65, 85],
        labels=["18–25", "26–35", "36–45", "46–55", "56–65", "66–85"],
    ))
    conteos = (
        por_edad.groupby(["rango_edad", "clasificacion"], observed=True, as_index=False)
        .agg(Clientes=("cliente_id", "size"))
    )
    figura_edades = px.bar(
        conteos, x="rango_edad", y="Clientes", color="clasificacion",
        barmode="group", text="Clientes",
        category_orders={
            "rango_edad": ["18–25", "26–35", "36–45", "46–55", "56–65", "66–85"],
            "clasificacion": CLASIFICACIONES,
        },
        labels={"rango_edad": "Rango de edad (años)", "clasificacion": "Clasificación"},
    )
    graficos.append((
        "Clasificaciones por rango de edad", figura_edades,
        "Clientes agrupados entre 18 y 85 años; cada rango distingue compra, "
        "no compra y clientes sin clasificar.",
    ))

    if not probabilidades.empty:
        canales = (
            probabilidades.groupby("canal_adquisicion", as_index=False)
            ["probabilidad_compra"].mean().sort_values("probabilidad_compra", ascending=False)
        )
        figura_canales = px.bar(
            canales, x="canal_adquisicion", y="probabilidad_compra",
            text="probabilidad_compra",
            labels={"canal_adquisicion": "Canal de adquisición",
                    "probabilidad_compra": "Probabilidad promedio de compra"},
        )
        figura_canales.update_traces(texttemplate="%{y:.1%}", hovertemplate="%{x}: %{y:.1%}<extra></extra>")
        figura_canales.update_yaxes(range=[0, 1], tickformat=".0%")
        mejor = canales.iloc[0]
        graficos.append((
            "Probabilidad promedio por canal", figura_canales,
            f"El canal {mejor['canal_adquisicion']} tiene el mayor promedio de compra: "
            f"{mejor['probabilidad_compra']:.1%}, entre los clientes clasificados.",
        ))

    for _, figura, _ in graficos:
        figura.update_layout(
            height=340, margin={"l": 10, "r": 10, "t": 25, "b": 10},
            legend={"orientation": "h", "y": -0.25, "title_text": ""},
        )
        if figura is figura_clases or figura is figura_edades:
            figura.update_yaxes(tickformat="d")
    return graficos
