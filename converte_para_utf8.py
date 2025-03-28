import os
import csv
import chardet

def converter_csv_para_utf8(pasta_entrada, pasta_saida):
    if not os.path.exists(pasta_saida):
        os.makedirs(pasta_saida)
    
    for arquivo_nome in os.listdir(pasta_entrada):
        if arquivo_nome.endswith('.csv'): 
            caminho_entrada = os.path.join(pasta_entrada, arquivo_nome)
            caminho_saida = os.path.join(pasta_saida, arquivo_nome.replace('.csv', 'conv_utf8.csv'))
            
            with open(caminho_entrada, 'rb') as f:
                raw_data = f.read()
                encoding = chardet.detect(raw_data)['encoding']
            
            with open(caminho_entrada, 'r', encoding=encoding, errors='replace') as entrada:
                with open(caminho_saida, 'w', encoding='utf-8', newline='') as saida:
                    leitor = csv.reader(entrada, delimiter=';')
                    escritor = csv.writer(saida, delimiter=';')
                    for linha in leitor:
                        escritor.writerow(linha)
            
            print(f"Arquivo {arquivo_nome} convertido e salvo como {caminho_saida}")

pasta_entrada = "./banco_de_dados"
pasta_saida = "./banco_de_dados"

converter_csv_para_utf8(pasta_entrada, pasta_saida)