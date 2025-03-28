SELECT o.razao_social AS nome_operadora, d.reg_ans, SUM(d.vl_saldo_final) AS total_despesas  
FROM public.demonstracoes_contabeis d
JOIN public.operadoras_ativas o ON d.reg_ans = o.reg_ans
WHERE d.cd_conta_contabil = '41131'  
AND d.data BETWEEN '2024-10-01' AND '2024-12-31'  
GROUP BY o.razao_social, d.reg_ans  
ORDER BY total_despesas DESC  
LIMIT 10;

SELECT o.razao_social AS nome_operadora, d.reg_ans, SUM(d.vl_saldo_final) AS total_despesas  
FROM public.demonstracoes_contabeis d
JOIN public.operadoras_ativas o ON d.reg_ans = o.reg_ans
WHERE d.cd_conta_contabil = '41131'  
AND d.data BETWEEN '2024-01-01' AND '2024-12-31'  
GROUP BY o.razao_social, d.reg_ans  
ORDER BY total_despesas DESC  
LIMIT 10;