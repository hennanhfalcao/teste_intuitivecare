CREATE TABLE demonstracoes_contabeis (
    data DATE,
    reg_ans INT,
    cd_conta_contabil VARCHAR(100),
    descricao TEXT,
    vl_saldo_inicial NUMERIC(15,2),
    vl_saldo_final NUMERIC(15,2),
    trimestre SMALLINT,
    ano SMALLINT
);

CREATE TABLE operadoras_ativas (
    reg_ans INT PRIMARY KEY,
    cnpj VARCHAR(20),
    razao_social TEXT,
    nome_fantasia TEXT,
    modalidade TEXT,
    logradouro TEXT,
    numero VARCHAR(10),
    complemento TEXT,
    bairro TEXT,
    cidade TEXT,
    uf CHAR(2),
    cep VARCHAR(10),
    ddd VARCHAR(2),
    telefone VARCHAR(20),
    fax VARCHAR(12),
    endereco_eletronico TEXT,
    representante TEXT,
    cargo_representante TEXT,
    regiao_de_comercializacao INT,
    data_registro_ans DATE
);