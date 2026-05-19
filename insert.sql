USE ecommerce_dio;

-- =========================
-- INSERÇÃO DE DADOS PARA TESTES
-- =========================

INSERT INTO CLIENTE (NOME, IDENTIFICACAO, ENDERECO, EMAIL, TELEFONE) VALUES
('Lucas Giannini', 'CLI001', 'São Paulo - SP', 'lucas@email.com', '1199999-1111'),
('Maria Souza', 'CLI002', 'Campinas - SP', 'maria@email.com', '1199999-2222'),
('Tech Soluções LTDA', 'CLI003', 'Santos - SP', 'contato@techsolucoes.com', '133333-4444'),
('Comercial Alfa SA', 'CLI004', 'Rio de Janeiro - RJ', 'financeiro@alfa.com', '213333-5555');

INSERT INTO CLIENTE_PF (idCLIENTE_PF, CPF, DATA_NASCIMENTO) VALUES
(1, '123.456.789-10', '2005-08-15'),
(2, '987.654.321-00', '1998-03-20');

INSERT INTO CLIENTE_PJ (idCLIENTE_PJ, CNPJ, RAZAO_SOCIAL) VALUES
(3, '12.345.678/0001-90', 'Tech Soluções LTDA'),
(4, '98.765.432/0001-11', 'Comercial Alfa SA');

INSERT INTO FORMA_PAGAMENTO (NOME, STATUS) VALUES
('Cartão de Crédito', 'ATIVO'),
('Pix', 'ATIVO'),
('Boleto', 'ATIVO'),
('Cartão de Débito', 'INATIVO');

INSERT INTO FORMA_PAGAMENTO_has_CLIENTE VALUES
(1, 1), (2, 1),
(2, 2), (3, 2),
(1, 3), (2, 3), (3, 3),
(2, 4);

INSERT INTO PRODUTO (CATEGORIA, DESCRICAO, VALOR) VALUES
('Eletrônicos', 'Smartphone Galaxy X', 2500.00),
('Informática', 'Notebook Lenovo Ideapad', 4200.00),
('Acessórios', 'Mouse Gamer RGB', 120.00),
('Acessórios', 'Teclado Mecânico', 350.00),
('Casa', 'Cafeteira Elétrica', 230.00),
('Informática', 'Monitor 24 Polegadas', 850.00);

INSERT INTO FORNECEDOR (RAZAO_SOCIAL, CNPJ) VALUES
('Fornecedor Brasil Tech', '11.111.111/0001-11'),
('Distribuidora Eletrônicos SP', '22.222.222/0001-22'),
('Casa Utilidades LTDA', '33.333.333/0001-33');

INSERT INTO DISPONIBILIZANDO_PRODUTO VALUES
(1, 1), (1, 2), (1, 6),
(2, 1), (2, 3), (2, 4),
(3, 5);

INSERT INTO VENDEDOR (RAZAO_SOCIAL, LOCAL, CNPJ, CPF) VALUES
('Fornecedor Brasil Tech', 'São Paulo - SP', '11.111.111/0001-11', NULL),
('Loja Gamer Max', 'Curitiba - PR', '44.444.444/0001-44', NULL),
('João Vendas Online', 'São Paulo - SP', NULL, '111.222.333-44');

INSERT INTO PRODUTOS_POR_VENDEDOR VALUES
(1, 1), (1, 2),
(2, 3), (2, 4), (2, 6),
(3, 5);

INSERT INTO ESTOQUE (LOCAL) VALUES
('Galpão São Paulo'),
('Centro de Distribuição Campinas'),
('Estoque Rio de Janeiro');

INSERT INTO PRODUTO_has_ESTOQUE VALUES
(1, 1, 50), (1, 2, 30),
(2, 1, 15), (2, 2, 10),
(3, 1, 200),
(4, 1, 80), (4, 2, 40),
(5, 3, 60),
(6, 2, 25);

INSERT INTO PEDIDO (STATUS, DESCRICAO, FRETE, CLIENTE_idCLIENTE, DATA_PEDIDO) VALUES
('PAGO', 'Pedido de smartphone e mouse', 35.00, 1, '2026-05-01 10:20:00'),
('ENTREGUE', 'Pedido de notebook', 50.00, 2, '2026-05-02 14:30:00'),
('ENVIADO', 'Compra corporativa de monitores', 120.00, 3, '2026-05-03 09:10:00'),
('EM_PROCESSAMENTO', 'Pedido de cafeteira', 20.00, 4, '2026-05-04 16:45:00'),
('PAGO', 'Pedido de teclado e mouse', 25.00, 1, '2026-05-05 11:00:00');

INSERT INTO RELACAO_PRODUTO_PEDIDO VALUES
(1, 1, 1),
(1, 3, 2),
(2, 2, 1),
(3, 6, 5),
(4, 5, 3),
(5, 4, 1),
(5, 3, 1);

INSERT INTO ENTREGA (STATUS, CODIGO_RASTREIO) VALUES
('EM_TRANSPORTE', 'BR123456789SP'),
('ENTREGUE', 'BR987654321SP'),
('EM_TRANSPORTE', 'BR111222333RJ'),
('AGUARDANDO_ENVIO', 'BR444555666RJ'),
('AGUARDANDO_ENVIO', 'BR777888999SP');

INSERT INTO ENTREGA_has_PEDIDO VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);
