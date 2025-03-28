Antes de executar os scripts sql garante que os arquivos baixados estejam no diretório teste_intuitivecare/banco_de_dados com os nomes iguais aos que estão no script de importação.
O script de conversão converte_para_utf8 deve ser executado no diretório teste_intuitivecare, depois de convertidos, aí sim executar os scripts de criação das tabelas e importação estando dentro do diretório ./banco_de_dados/sql_scripts/
os comandos para execução com o POSTGRESQL: 
Criação das tabelas: psql -U {usuario do banco de dados} -d {banco_de_dados} -f tables.sql
Importação: psql -U {usuario do banco de dados} -d {banco_de_dados} -f import_data.sql
