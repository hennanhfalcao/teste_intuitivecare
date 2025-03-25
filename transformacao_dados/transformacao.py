import subprocess
import sys

try: 
    import pdfplumber
    print("PDF Plumber já está instalado")
except ImportError:
    print("PDF Plumber não está instalado. Instalando...")
    subprocess.check_call([sys.executable, "-m", "pip", "install", "pdfplumber"])

try:
    import pandas
    print("Pandas já está instalado")
except ImportError:
    print("Pandas não está instalado. Instalando...")
    subprocess.check_call([sys.executable, "-m", "pip", "install", "pandas"])


import pdfplumber
import os
import pandas as pd

pdf_path = os.path.join(os.path.dirname(os.path.abspath(__file__)), "../web_scraping/Anexo_I_Rol_2021RN_465.2021_RN627L.2024.pdf")
csv_path = os.path.join(os.path.dirname(os.path.abspath(__file__)), "teste.csv")

with pdfplumber.open(pdf_path) as pdf:
    for i, page in enumerate(pdf.pages):
        tables = page.extract_tables()
        print(f"Página {i+1}: {len(tables)} tabelas encontradas")
