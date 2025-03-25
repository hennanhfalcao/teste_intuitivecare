import subprocess
import sys

def instalar_pacotes(pacote):
    try:
        __import__(pacote)
        print(f"{pacote} já está instalado")
    except ImportError:
        print(f"{pacote} não está instalado. Instalando...")
        subprocess.check_call([sys.executable, "-m", "pip", "install", pacote])