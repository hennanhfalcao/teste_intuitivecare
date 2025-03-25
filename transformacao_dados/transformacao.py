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
