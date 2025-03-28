SELECT o.razao_social AS nome_operadora, d.reg_ans, SUM(d.vl_saldo_final) AS total_despesas  
FROM public.demonstracoes_contabeis d
JOIN public.operadoras_ativas o ON d.reg_ans = o.reg_ans
WHERE d.cd_conta_contabil IN (
    SELECT DISTINCT cd_conta_contabil
    FROM public.demonstracoes_contabeis
    WHERE descricao LIKE '%EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS%HOSPITALAR%'
    )
AND d.trimestre = 4 
AND d.ano = 2024  
GROUP BY o.razao_social, d.reg_ans  
ORDER BY total_despesas DESC  
LIMIT 10;

SELECT o.razao_social AS nome_operadora, d.reg_ans, SUM(d.vl_saldo_final) AS total_despesas  
FROM public.demonstracoes_contabeis d
JOIN public.operadoras_ativas o ON d.reg_ans = o.reg_ans
WHERE d.cd_conta_contabil IN (
    SELECT DISTINCT cd_conta_contabil
    FROM public.demonstracoes_contabeis
    WHERE descricao LIKE '%EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS%HOSPITALAR%'
    )    
AND d.ano = 2024
GROUP BY o.razao_social, d.reg_ans  
ORDER BY total_despesas DESC  
LIMIT 10;
