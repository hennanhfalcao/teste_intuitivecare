# Instruções de Preparação do Ambiente

Antes de qualquer coisa, crie um ambiente virtual com o comando:

```bash
python -m venv .venv
```

Ative-a com o comando:

```bash
.venv/Scripts/activate
```

Instale todas as dependências necessárias para execução dos testes com o comando:

```bash
pip install -r requirements.txt
```

Estando dentro do diretório principal `teste_intuitivecare`.

---

# Instruções para os Testes de Web Scraping e Transformação de Dados

Antes de executar o teste de transformação de dados (`transformacao.py`), garanta que o teste de Web Scraping, ou seja, o script `scraping.py`, tenha sido executado e o arquivo Anexo I tenha sido gerado.

---

# Instruções para o Teste de Banco de Dados

Este guia descreve o processo para configurar e executar o teste de importação de dados e análise no PostgreSQL.

## Passo 1: Verificar os Arquivos

Antes de executar qualquer script SQL, verifique se todos os arquivos necessários estão no diretório `teste_intuitivecare/banco_de_dados` com os **nomes exatos** que estão no script de importação.

## Passo 2: Converter os Arquivos CSV para UTF-8

1. Navegue até o diretório `teste_intuitivecare`.
2. Execute o script `converte_para_utf8.py` para garantir que todos os arquivos CSV estejam em UTF-8 antes de importá-los para o banco de dados.

   **Comando de execução:**

   ```bash
   python converte_para_utf8.py
   ```

   Isso vai gerar versões em UTF-8 dos arquivos CSV.

## Passo 3: Criação das Tabelas no Banco de Dados

1. Navegue até o diretório `teste_intuitivecare/banco_de_dados/sql_scripts/`.
2. Execute o script de criação do banco de dados `create_database.sql`.

   ```bash
   psql -U {usuario_do_banco} -f create_database.sql
   ```

3. Conecte-se ao banco de dados por meio do comando:

   ```bash
   psql -U {usuario_do_banco} -d teste_intuitive_care_db
   ```

4. Execute o script de criação das tabelas `schemas_and_tables.sql` para configurar o esquema do banco de dados.

   **Comando de execução:**

   ```bash
   psql -U {usuario_do_banco} -d teste_intuitive_care_db -f schemas_and_tables.sql
   ```

   Lembre-se de substituir `{usuario_do_banco}` pelo valor correspondente.

## Passo 4: Importação de Dados

1. Ainda no diretório `teste_intuitivecare/banco_de_dados/sql_scripts/`, execute o script `import_data.sql` para importar os dados para o banco de dados.

   **Comando de execução:**

   ```bash
   psql -U {usuario_do_banco} -d teste_intuitive_care_db -f import_data.sql
   ```

## Passo 5: Execução das Queries Analíticas

1. Após a importação dos dados, execute o script `queries.sql` para gerar as análises solicitadas.

   **Comando de execução:**

   ```bash
   psql -U {usuario_do_banco} -d teste_intuitive_care_db -f queries.sql
   ```

---

# Instruções para o Teste de API

O servidor foi desenvolvido utilizando FastAPI.

1. Para rodar o servidor, execute o comando abaixo dentro do diretório `teste_intuitivecare/teste_api`:

   ```bash
   uvicorn server:app --reload
   ```

2. A coleção do POSTMAN não foi salva com as responses para fins de otimização. Para acessar as responses, importe a coleção no próprio POSTMAN e execute as requests.

3. Garantindo que o backend está rodando, navegue até o diretório `teste_intuitivecare/teste_api/frontend`.

4. Instale todas as dependências com o comando:

   ```bash
   npm install
   ```

5. Rode o servidor com o comando:

   ```bash
   npm run serve
   ```

6. Acesse os servidores nas rotas indicadas nos terminais.

