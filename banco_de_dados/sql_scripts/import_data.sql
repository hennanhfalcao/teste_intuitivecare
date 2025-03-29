\copy ans.operadoras_ativas (reg_ans, cnpj, razao_social, nome_fantasia, modalidade, logradouro, numero, complemento, bairro, cidade, uf, cep, ddd, telefone, fax, endereco_eletronico, representante, cargo_representante, regiao_de_comercializacao, data_registro_ans) FROM '../Relatorio_cadopconv_utf8.csv' DELIMITER ';' CSV HEADER ENCODING 'UTF8' QUOTE '"' ESCAPE '''';

\copy ans.demonstracoes_contabeis (data, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final) FROM '../1T2023conv_utf8.csv' DELIMITER ';' CSV HEADER ENCODING 'UTF8' QUOTE '"' ESCAPE '''';  

\copy ans.demonstracoes_contabeis (data, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final) FROM '../2T2023conv_utf8.csv' DELIMITER ';' CSV HEADER ENCODING 'UTF8' QUOTE '"' ESCAPE '''';

\copy ans.demonstracoes_contabeis (data, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final) FROM '../3T2023conv_utf8.csv' DELIMITER ';' CSV HEADER ENCODING 'UTF8' QUOTE '"' ESCAPE '''';  

\copy ans.demonstracoes_contabeis (data, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final) FROM '../4T2023conv_utf8.csv' DELIMITER ';' CSV HEADER ENCODING 'UTF8' QUOTE '"' ESCAPE '''';  

\copy ans.demonstracoes_contabeis (data, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final) FROM '../1T2024conv_utf8.csv' DELIMITER ';' CSV HEADER ENCODING 'UTF8' QUOTE '"' ESCAPE '''';

\copy ans.demonstracoes_contabeis (data, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final) FROM '../2T2024conv_utf8.csv' DELIMITER ';' CSV HEADER ENCODING 'UTF8' QUOTE '"' ESCAPE '''';

\copy ans.demonstracoes_contabeis (data, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final) FROM '../3T2024conv_utf8.csv' DELIMITER ';' CSV HEADER ENCODING 'UTF8' QUOTE '"' ESCAPE '''';

\copy ans.demonstracoes_contabeis (data, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final) FROM '../4T2024conv_utf8.csv'  DELIMITER ';' CSV HEADER ENCODING 'UTF8' QUOTE '"' ESCAPE '''';


BEGIN;

UPDATE ans.demonstracoes_contabeis  
SET trimestre = 
    CASE 
        WHEN data BETWEEN '2023-01-01' AND '2023-03-31' THEN 1
        WHEN data BETWEEN '2023-04-01' AND '2023-06-30' THEN 2
        WHEN data BETWEEN '2023-07-01' AND '2023-09-30' THEN 3
        WHEN data BETWEEN '2023-10-01' AND '2023-12-31' THEN 4
        WHEN data BETWEEN '2024-01-01' AND '2024-03-31' THEN 1
        WHEN data BETWEEN '2024-04-01' AND '2024-06-30' THEN 2
        WHEN data BETWEEN '2024-07-01' AND '2024-09-30' THEN 3
        WHEN data BETWEEN '2024-10-01' AND '2024-12-31' THEN 4
    END,
    ano = EXTRACT(YEAR FROM data)
WHERE data BETWEEN '2023-01-01' AND '2024-12-31';

COMMIT;