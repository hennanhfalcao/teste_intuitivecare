# Instruções de preparação do ambiente

Antes de qualquer coisa, crie um ambiente virtual com o comando `python -m venv .venv` no diretório raiz, ative-a com o comando `.venv/Scripts/activate`, instale todas as dependências necessárias para execução dos testes com o comando `pip install -r requirements.txt` estando dentro do diretório principal `teste_intuitivecare`.  

# Instruções para os testes de Web Scraping e Transformação de Dados

Antes de executar o teste de transformação de dados(`transformacao.py`), garanta que o teste de Web Scraping, ou seja, o script `scraping.py` tenha sido executado e o arquivo Anexo I tenha sido gerado.

# Instruções para o Teste de Banco de Dados

Este guia descreve o processo para configurar e executar o teste de importação de dados e análise no PostgreSQL.

## Passo 1: Verificar os Arquivos

Antes de executar qualquer script SQL, verifique se todos os arquivos necessários estão no diretório `teste_intuitivecare/banco_de_dados` com os **nomes exatos** que estão no script de importação.  
O banco de dados utilizado foi o PostgreSQL
## Passo 2: Converter os Arquivos CSV para UTF-8

1. Navegue até o diretório `teste_intuitivecare`.
2. Execute o script `converte_para_utf8.py` para garantir que todos os arquivos CSV estejam em UTF-8 antes de importá-los para o banco de dados.
   - **Comando de execução:**

     ```bash
     python converte_para_utf8.py
     ```

   Isso vai gerar versões em UTF-8 dos arquivos CSV.

## Passo 3: Criação das Tabelas no Banco de Dados

1. Navegue até o diretório `teste_intuitivecare/banco_de_dados/sql_scripts/`.
2. Execute o script de criação das tabelas `tables.sql` para configurar o esquema do banco de dados.
   - **Comando de execução:**

     ```bash
     psql -U {usuario_do_banco} -d {banco_de_dados} -f tables.sql
     ```

   Lembre-se de substituir `{usuario_do_banco}` e `{banco_de_dados}` pelos valores correspondentes.

## Passo 4: Importação de Dados

1. Ainda no diretório `teste_intuitivecare/banco_de_dados/sql_scripts/`, execute o script `import_data.sql` para importar os dados para o banco de dados.
   - **Comando de execução:**

     ```bash
     psql -U {usuario_do_banco} -d {banco_de_dados} -f import_data.sql
     ```

## Passo 5: Execução das Queries Analíticas

1. Após a importação dos dados, execute o script `queries_analiticas.sql` para gerar as análises solicitadas.
   - **Comando de execução:**

     ```bash
     psql -U {usuario_do_banco} -d {banco_de_dados} -f queries_analiticas.sql
     ```  
# Instruções para o Teste de API  
O servidor foi desenvolvido utilizando FastAPI.  
1.Para rodar o servidor, execute o comando `uvicorn server:app --reload` dentro do diretório `teste_intuitivecare/teste_api`. 
2. A coleção do POSTMAN não foi salva com as responses para fins de otimização, para acessar as responses, importe a coleção no próprio POSTMAN e execute as requests.  
3. Garantindo que o backend está rodando, vá para o diretório `teste_intuitivecare/teste_api/frontend`  
4. Instale todas as dependências com o comando `npm install`  
5. Rode o servidor com o comando `npm run serve`  
6. Acesse os servidores nas rotas indicadas nos terminais.
