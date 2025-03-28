import os
from tabula import read_pdf
import pandas as pd
import zipfile


pdf_path = os.path.join(os.path.dirname(os.path.abspath(__file__)), "../web_scraping/Anexo_I_Rol_2021RN_465.2021_RN627L.2024.pdf")
csv_path = os.path.join(os.path.dirname(os.path.abspath(__file__)), "tabela_completa.csv")
zip_path = os.path.join(os.path.dirname(os.path.abspath(__file__)), "Teste_Hennan_Heim_Falcao.zip")

tabelas_extraidas = read_pdf(pdf_path, pages="3-181", multiple_tables=True, lattice=True)
print(f"{len(tabelas_extraidas)} tabelas extraídas")

df = pd.DataFrame

df_final = tabelas_extraidas[0]

for i in range(1, len(tabelas_extraidas)):
    df_final = pd.concat([df_final, tabelas_extraidas[i]], ignore_index=True)

df_final.columns = df_final.columns.str.replace(r'\r', ' ', regex=True)
df_final = df_final.replace(r'\r',' ', regex=True)
df_final.columns = df_final.columns.str.replace('OD', 'ODONTOLÓGICO', regex=True)
df_final.columns = df_final.columns.str.replace('AMB', 'AMBULATÓRIO', regex=True)
df_final = df_final.where(pd.notna(df_final), None)

df_final.to_csv(csv_path, index=False, sep=";", encoding="utf-8-sig", na_rep="NULL")

print(f"Arquivo {csv_path} criado com sucesso")

with zipfile.ZipFile(zip_path, 'w', zipfile.ZIP_DEFLATED) as zipf:
    zipf.write(csv_path, os.path.basename(csv_path))

print(f"Arquivo {zip_path} criado com sucesso")