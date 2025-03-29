CREATE SCHEMA IF NOT EXISTS ans;

DROP TABLE IF EXISTS ans.demonstracoes_contabeis;
DROP TABLE IF EXISTS ans.operadoras_ativas;

CREATE TABLE ans.operadoras_ativas (
    reg_ans INT,
    cnpj VARCHAR(20),
    razao_social TEXT,
    nome_fantasia TEXT,
    modalidade TEXT,
    logradouro TEXT,
    numero VARCHAR(20),
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

CREATE TABLE ans.demonstracoes_contabeis (
    data DATE,
    reg_ans INT,
    cd_conta_contabil VARCHAR(100),
    descricao TEXT,
    vl_saldo_inicial NUMERIC(15,2),
    vl_saldo_final NUMERIC(15,2)
);

ALTER TABLE ans.demonstracoes_contabeis SET (fillfactor = 80);

CREATE INDEX IF NOT EXISTS idx_operadoras_cnpj ON ans.operadoras_ativas(cnpj);
CREATE INDEX IF NOT EXISTS idx_demcont_reg_ans ON ans.demonstracoes_contabeis(reg_ans);
CREATE INDEX IF NOT EXISTS idx_demcont_periodo ON ans.demonstracoes_contabeis(ano, trimestre);