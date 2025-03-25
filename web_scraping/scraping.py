from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from webdriver_manager.chrome import ChromeDriverManager
import os
import requests


options = webdriver.ChromeOptions()
options.add_argument("--headless")

service = Service(ChromeDriverManager().install())
driver = webdriver.Chrome(service=service, options=options)

url = "https://www.gov.br/ans/pt-br/acesso-a-informacao/participacao-da-sociedade/atualizacao-do-rol-de-procedimentos"
driver.get(url)

div_content = driver.find_element(By.CLASS_NAME, "cover-richtext-tile")
links = div_content.find_elements(By.TAG_NAME, "a")

pdf_links = [
            link.get_attribute("href")
            for link in links
            if link.get_attribute("href") and link.get_attribute("href").endswith(".pdf") and 
            ("Anexo_I" in link.get_attribute("href") or "Anexo_II" in link.get_attribute("href"))
            ]

dir_path = os.path.dirname(os.path.abspath(__file__))

for link in pdf_links:
    reponse = requests.get(link, stream=True)
    if reponse.status_code == 200:
        filename = os.path.join(dir_path, link.split("/")[-1])
        with open(filename, "wb") as file:
            for chunk in reponse.iter_content(1024):
                file.write(chunk)
        print(f"Arquivo {filename} baixado com sucesso")
    else:
        print(f"Erro ao baixar {link}: {reponse.status_code}")   

driver.quit()