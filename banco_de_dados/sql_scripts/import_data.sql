\copy public.demonstracoes_contabeis (data, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final) FROM 'C:\Users\SAMSUNG\Documents\CIENCIA_DA_COMPUTACAO\intuitivecare\teste_intuitivecare\banco_de_dados\2023\1T2023conv_utf8.csv' DELIMITER ';' CSV HEADER ENCODING 'UTF8' QUOTE '"' ESCAPE '''';

UPDATE demonstracoes_contabeis  
SET trimestre = 1, ano = 2023  
WHERE data BETWEEN '2023-01-01' AND '2023-03-31';  

\copy public.demonstracoes_contabeis (data, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final) FROM 'C:\Users\SAMSUNG\Documents\CIENCIA_DA_COMPUTACAO\intuitivecare\teste_intuitivecare\banco_de_dados\2023\2t2023conv_utf8.csv' DELIMITER ';' CSV HEADER ENCODING 'UTF8' QUOTE '"' ESCAPE '''';

UPDATE demonstracoes_contabeis  
SET trimestre = 2, ano = 2023  
WHERE data BETWEEN '2023-04-01' AND '2023-06-30';  

\copy public.demonstracoes_contabeis (data, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final) FROM 'C:\Users\SAMSUNG\Documents\CIENCIA_DA_COMPUTACAO\intuitivecare\teste_intuitivecare\banco_de_dados\2023\3T2023conv_utf8.csv' DELIMITER ';' CSV HEADER ENCODING 'UTF8' QUOTE '"' ESCAPE '''';  

UPDATE demonstracoes_contabeis  
SET trimestre = 3, ano = 2023  
WHERE data BETWEEN '2023-07-01' AND '2023-09-30';  

\copy public.demonstracoes_contabeis (data, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final) FROM 'C:\Users\SAMSUNG\Documents\CIENCIA_DA_COMPUTACAO\intuitivecare\teste_intuitivecare\banco_de_dados\2023\4T2023conv_utf8.csv' DELIMITER ';' CSV HEADER ENCODING 'UTF8' QUOTE '"' ESCAPE '''';  

UPDATE demonstracoes_contabeis  
SET trimestre = 4, ano = 2023  
WHERE data BETWEEN '2023-10-01' AND '2023-12-31';  

\copy public.demonstracoes_contabeis (data, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final) FROM 'C:\Users\SAMSUNG\Documents\CIENCIA_DA_COMPUTACAO\intuitivecare\teste_intuitivecare\banco_de_dados\2024\1T2024conv_utf8.csv' DELIMITER ';' CSV HEADER ENCODING 'UTF8' QUOTE '"' ESCAPE '''';  

UPDATE demonstracoes_contabeis  
SET trimestre = 1, ano = 2024  
WHERE data BETWEEN '2024-01-01' AND '2024-03-31';  

\copy public.demonstracoes_contabeis (data, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final) FROM 'C:\Users\SAMSUNG\Documents\CIENCIA_DA_COMPUTACAO\intuitivecare\teste_intuitivecare\banco_de_dados\2024\2T2024conv_utf8.csv' DELIMITER ';' CSV HEADER ENCODING 'UTF8' QUOTE '"' ESCAPE '''';  

UPDATE demonstracoes_contabeis  
SET trimestre = 2, ano = 2024  
WHERE data BETWEEN '2024-04-01' AND '2024-06-30';  

\copy public.demonstracoes_contabeis (data, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final) FROM 'C:\Users\SAMSUNG\Documents\CIENCIA_DA_COMPUTACAO\intuitivecare\teste_intuitivecare\banco_de_dados\2024\3T2024conv_utf8.csv' DELIMITER ';' CSV HEADER ENCODING 'UTF8' QUOTE '"' ESCAPE '''';  

UPDATE demonstracoes_contabeis  
SET trimestre = 3, ano = 2024  
WHERE data BETWEEN '2024-07-01' AND '2024-09-30';  

\copy public.demonstracoes_contabeis (data, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final) FROM 'C:\Users\SAMSUNG\Documents\CIENCIA_DA_COMPUTACAO\intuitivecare\teste_intuitivecare\banco_de_dados\2024\4T2024conv_utf8.csv' DELIMITER ';' CSV HEADER ENCODING 'UTF8' QUOTE '"' ESCAPE '''';  

UPDATE demonstracoes_contabeis  
SET trimestre = 4, ano = 2024  
WHERE data BETWEEN '2024-10-01' AND '2024-12-31';  

\copy public.operadoras_ativas (reg_ans, cnpj, razao_social, nome_fantasia, modalidade, logradouro, numero, complemento, bairro, cidade, uf, cep, ddd, telefone, fax, endereco_eletronico, representante, cargo_representante, regiao_de_comercializacao, data_registro_ans) FROM 'C:\Users\SAMSUNG\Documents\CIENCIA_DA_COMPUTACAO\intuitivecare\teste_intuitivecare\banco_de_dados\Operadoras_ativas\Relatorio_cadopconv_utf8.csv' DELIMITER ';' CSV HEADER ENCODING 'UTF8' QUOTE '"' ESCAPE '''';  