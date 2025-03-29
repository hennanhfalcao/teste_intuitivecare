from fastapi import FastAPI, HTTPException, Query
from fastapi.middleware.cors import CORSMiddleware
import pandas as pd


app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)
CSV_PATH = '../banco_de_dados/Relatorio_cadopconv_utf8.csv'

def carregar_dados():
    return pd.read_csv(CSV_PATH, dtype=str, delimiter=';', usecols=['Registro_ANS', 'CNPJ', 'Razao_Social'])

@app.get("/operadoras/")
def listar_operadoras(
    nome: str = Query(None, title="Nome da operadora"),
    limit: int = Query(10, title="Número de registros por página"),
    offset: int = Query(0, title="Número do registro inicial"),
    ):
    
    if nome is not None and len(nome) < 3:
        raise HTTPException(status_code=422, detail="O parâmetro 'nome' deve ter pelo menos 3 caracteres.")

    if limit < 0:
        raise HTTPException(status_code=422, detail="O parâmetro 'limit' não pode ser negativo.")

    if limit > 50:
        raise HTTPException(status_code=422, detail="O parâmetro 'limit' não pode ser maior que 50.")
    
    if offset < 0:
        raise HTTPException(status_code=422, detail="O parâmetro 'offset' não pode ser negativo.")


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