# Projeto Lógico de Banco de Dados — E-commerce

Este projeto replica e refina a modelagem lógica de um cenário de e-commerce, considerando clientes, pedidos, produtos, fornecedores, vendedores, estoque, pagamento e entrega.

## Refinamentos aplicados

- **Cliente PF e PJ:** uma conta pode ser Pessoa Física ou Pessoa Jurídica, mas não pode possuir os dois tipos ao mesmo tempo.
- **Pagamento:** um cliente pode possuir mais de uma forma de pagamento cadastrada.
- **Entrega:** cada pedido pode possuir dados de entrega com status e código de rastreio.
- **Relacionamentos N:N:** foram criadas tabelas associativas para representar produtos por pedido, produtos por fornecedor, produtos por vendedor, produtos em estoque, formas de pagamento por cliente e entregas por pedido.

## Arquivos

- `01_create.sql`: cria o banco, tabelas, chaves primárias, chaves estrangeiras, constraints e triggers.
- `02_insert.sql`: insere dados fictícios para testes.
- `03_queries.sql`: contém consultas SQL com SELECT, WHERE, atributos derivados, ORDER BY, GROUP BY, HAVING e JOINs.

## Principais perguntas respondidas pelas queries

- Quais clientes estão cadastrados?
- Quais produtos custam mais de R$ 500?
- Qual o subtotal de cada item vendido?
- Quais produtos são mais caros?
- Quantos pedidos foram feitos por cada cliente?
- Quais clientes fizeram mais de um pedido?
- Algum vendedor também é fornecedor?
- Qual a relação entre produtos, fornecedores e estoques?
- Qual a relação entre nomes dos fornecedores e nomes dos produtos?
- Qual o valor total de cada pedido incluindo frete?
- Quais clientes possuem mais de uma forma de pagamento?
- Qual o status de entrega e código de rastreio de cada pedido?

## Como executar

No MySQL Workbench ou em outro cliente MySQL, execute os arquivos nesta ordem:

1. `01_create.sql`
2. `02_insert.sql`
3. `03_queries.sql`
