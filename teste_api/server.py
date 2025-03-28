from fastapi import FastAPI, Query
import pandas as pd

app = FastAPI()

CSV_PATH = '../banco_de_dados/Relatorio_cadopconv_utf8.csv'

def carregar_dados():
    return pd.read_csv(CSV_PATH, dtype=str, delimiter=';', usecols=['Registro_ANS', 'CNPJ', 'Razao_Social'])

@app.get("/operadoras/")
def listar_operadoras(
    nome: str = Query(None, min_length=3, title="Nome da operadora"),
    limit: int = Query(10, gt=0, le=100, title="Número de registros por página"),
    offset: int = Query(0, ge=0, title="Número do registro inicial"),
    ):

    df = carregar_dados()

    if nome:
        df = df[df["Razao_Social"].str.contains(nome, case=False, na=False)]
    total= len(df)
    df_paginado = df.iloc[offset:offset + limit]

    return {
        "total": total,
        "limit": limit,
        "offset": offset,
        "data": df_paginado.fillna("").to_dict(orient="records")
    }