USE ecommerce_dio;

-- ============================================================
-- QUERIES DO DESAFIO
-- Cada consulta responde uma pergunta de negócio.
-- ============================================================

-- 1) Recuperação simples com SELECT:
-- Quais clientes estão cadastrados?
SELECT
    idCLIENTE,
    NOME,
    IDENTIFICACAO,
    ENDERECO
FROM CLIENTE;

-- 2) Filtro com WHERE:
-- Quais produtos custam mais de R$ 500,00?
SELECT
    idPRODUTO,
    CATEGORIA,
    DESCRICAO,
    VALOR
FROM PRODUTO
WHERE VALOR > 500;

-- 3) Atributo derivado:
-- Qual o valor total de cada item vendido considerando preço * quantidade?
SELECT
    p.idPEDIDO,
    pr.DESCRICAO AS produto,
    rpp.QUANTIDADE,
    pr.VALOR AS valor_unitario,
    (rpp.QUANTIDADE * pr.VALOR) AS subtotal_produto
FROM PEDIDO p
INNER JOIN RELACAO_PRODUTO_PEDIDO rpp
    ON p.idPEDIDO = rpp.PEDIDO_idPEDIDO
INNER JOIN PRODUTO pr
    ON pr.idPRODUTO = rpp.PRODUTO_idPRODUTO;

-- 4) ORDER BY:
-- Quais produtos são mais caros?
SELECT
    DESCRICAO,
    CATEGORIA,
    VALOR
FROM PRODUTO
ORDER BY VALOR DESC;

-- 5) Quantos pedidos foram feitos por cada cliente?
SELECT
    c.idCLIENTE,
    c.NOME,
    COUNT(p.idPEDIDO) AS total_pedidos
FROM CLIENTE c
LEFT JOIN PEDIDO p
    ON c.idCLIENTE = p.CLIENTE_idCLIENTE
GROUP BY c.idCLIENTE, c.NOME
ORDER BY total_pedidos DESC;

-- 6) HAVING:
-- Quais clientes fizeram mais de 1 pedido?
SELECT
    c.NOME,
    COUNT(p.idPEDIDO) AS total_pedidos
FROM CLIENTE c
INNER JOIN PEDIDO p
    ON c.idCLIENTE = p.CLIENTE_idCLIENTE
GROUP BY c.idCLIENTE, c.NOME
HAVING COUNT(p.idPEDIDO) > 1;

-- 7) Algum vendedor também é fornecedor?
-- Comparação feita pelo CNPJ ou razão social.
SELECT
    v.idVENDEDOR,
    v.RAZAO_SOCIAL AS vendedor,
    f.idFORNECEDOR,
    f.RAZAO_SOCIAL AS fornecedor,
    f.CNPJ
FROM VENDEDOR v
INNER JOIN FORNECEDOR f
    ON v.CNPJ = f.CNPJ
    OR v.RAZAO_SOCIAL = f.RAZAO_SOCIAL;

-- 8) Relação de produtos, fornecedores e estoques:
SELECT
    pr.DESCRICAO AS produto,
    f.RAZAO_SOCIAL AS fornecedor,
    e.LOCAL AS local_estoque,
    phe.QUANTIDADE
FROM PRODUTO pr
INNER JOIN DISPONIBILIZANDO_PRODUTO dp
    ON pr.idPRODUTO = dp.PRODUTO_idPRODUTO
INNER JOIN FORNECEDOR f
    ON f.idFORNECEDOR = dp.FORNECEDOR_idFORNECEDOR
INNER JOIN PRODUTO_has_ESTOQUE phe
    ON pr.idPRODUTO = phe.PRODUTO_idPRODUTO
INNER JOIN ESTOQUE e
    ON e.idESTOQUE = phe.ESTOQUE_idESTOQUE
ORDER BY pr.DESCRICAO, f.RAZAO_SOCIAL;

-- 9) Relação de nomes dos fornecedores e nomes dos produtos:
SELECT
    f.RAZAO_SOCIAL AS fornecedor,
    pr.DESCRICAO AS produto
FROM FORNECEDOR f
INNER JOIN DISPONIBILIZANDO_PRODUTO dp
    ON f.idFORNECEDOR = dp.FORNECEDOR_idFORNECEDOR
INNER JOIN PRODUTO pr
    ON pr.idPRODUTO = dp.PRODUTO_idPRODUTO
ORDER BY f.RAZAO_SOCIAL, pr.DESCRICAO;

-- 10) Valor total de cada pedido, incluindo frete:
SELECT
    p.idPEDIDO,
    c.NOME AS cliente,
    p.STATUS,
    SUM(rpp.QUANTIDADE * pr.VALOR) AS total_produtos,
    p.FRETE,
    (SUM(rpp.QUANTIDADE * pr.VALOR) + p.FRETE) AS valor_total_pedido
FROM PEDIDO p
INNER JOIN CLIENTE c
    ON c.idCLIENTE = p.CLIENTE_idCLIENTE
INNER JOIN RELACAO_PRODUTO_PEDIDO rpp
    ON p.idPEDIDO = rpp.PEDIDO_idPEDIDO
INNER JOIN PRODUTO pr
    ON pr.idPRODUTO = rpp.PRODUTO_idPRODUTO
GROUP BY p.idPEDIDO, c.NOME, p.STATUS, p.FRETE
ORDER BY valor_total_pedido DESC;

-- 11) Quais clientes possuem mais de uma forma de pagamento?
SELECT
    c.NOME,
    COUNT(fpc.FORMA_PAGAMENTO_idFORMA_PAGAMENTO) AS qtd_formas_pagamento
FROM CLIENTE c
INNER JOIN FORMA_PAGAMENTO_has_CLIENTE fpc
    ON c.idCLIENTE = fpc.CLIENTE_idCLIENTE
GROUP BY c.idCLIENTE, c.NOME
HAVING COUNT(fpc.FORMA_PAGAMENTO_idFORMA_PAGAMENTO) > 1;

-- 12) Status dos pedidos com entrega e código de rastreio:
SELECT
    p.idPEDIDO,
    c.NOME AS cliente,
    p.STATUS AS status_pedido,
    e.STATUS AS status_entrega,
    e.CODIGO_RASTREIO
FROM PEDIDO p
INNER JOIN CLIENTE c
    ON c.idCLIENTE = p.CLIENTE_idCLIENTE
INNER JOIN ENTREGA_has_PEDIDO ep
    ON p.idPEDIDO = ep.PEDIDO_idPEDIDO
INNER JOIN ENTREGA e
    ON e.idENTREGA = ep.ENTREGA_idENTREGA
ORDER BY p.idPEDIDO;
