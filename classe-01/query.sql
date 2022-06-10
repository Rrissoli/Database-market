
DROP TABLE categorias


CREATE TABLE produtos(
id serial primary key,
  nome varchar(100),
  descricao text,
  preco int,
  quantidade_em_estoque int,
  categoria_id int references categorias(id)
);
CREATE TABLE categorias(
id serial primary key,
  nome varchar(50)
);
CREATE TABLE itens_do_pedido(
id serial primary key,
  pedido_id int references pedidos(id),
  quantidade int,
  produto_id int references produtos(id)
);
CREATE TABLE pedidos(
id serial primary key,
  valor int,
  cliente_cpf char(11) references cliente(cpf),
  vendedor_cpf char(11) references vendedor(cpf)
);
CREATE TABLE cliente(
cpf char(11) primary key UNIQUE,
  nome varchar(50)
);
  
CREATE TABLE vendedor(
cpf char(11) primary key UNIQUE,
  nome varchar(50)
);


DROP TABLE pedidos, itens_do_pedido, cliente, vendedor


INSERT INTO categorias(nome)
VALUES('frutas'),('verduras'),('massas'),('bebidas'),('utilidades');

INSERT INTO produtos(nome,descricao,preco,quantidade_em_estoque, categoria_id)
VALUES
('Maçã', 'Fonte de potássio e fibras', 90, 34, 1),
('Cebola','Rico em quercetina, antocianinas, vitaminas do complexo B', 50, 76,2),
('Abacate', 'Não contem Glutem', 150,64,1),
('Tomate', 'Rico em vitaminas A,B e C', 125,88, 2),
('Acelga','Não contem Glutem',235,13,2),
('Macarrão parafuso','Sêmola de trigo enriquecida com ferro e acido fólico, ovos ecorantes naturais',690,5, 3),
('Massa para lasanha', 'uma reunião de familia precisa ter comida boa', 875,19,3),
('refrigerante coca cola lata', 'sabor original', 350,189,4),
('refrigerante pepsi 2L', 'NÂO CONTEM GLUTEM', 700, 12, 4), 
('cerveja heineken 600ml', 'é uma cerveja lager puro malte refrescante', 1200,500,4),
('Agua Mineral sem gás', 'é agua adicionado de sais mineraias', 130,478,4),
('vassoura', 'pigmento, matéria sintética e metal', 2350,30,5),
('Saco para lixo','reforçado para garantir mais segurança', 1340,90,5),
('escova dental','faça uma limeza profunda com a tecnologia inovadora', 1000,44,5),
('balde para lixo 500ml', 'possui tampa e fabricado com material reciclavel', 2290,50,5);

INSERT INTO cliente(cpf,nome)
VALUES('80371350042','José Augusto Silva'),
('67642869061','Antonio Oliveira'),
('63170505018','Ana Rodrigues'),
('75670505018','Maria da Conceição');

INSERT INTO vendedor(cpf,nome)
VALUES('82539841031','Rodrigo Sampaio'),
('23262546003','Beatriz Souza Santos'),
('28007155023','Carlos Eduardo');

INSERT INTO pedidos(cliente_cpf,vendedor_cpf)
VALUES
('67642869061','82539841031');

INSERT INTO itens_do_pedido(pedido_id,quantidade,produto_id)
VALUES



SELECT produtos.nome as nome_produto , categorias.nome as categorias
FROM produtos 
JOIN categorias on produtos.categoria_id = categorias.id

SELECT vendedor.nome as vendedor , cliente.nome as cliente 
FROM pedidos 
JOIN cliente on cliente.cpf = pedidos.cliente_cpf
JOIN vendedor on vendedor.cpf = pedidos.vendedor_cpf

SELECT categorias.nome as categoria, sum(produtos.quantidade_em_estoque)
FROM produtos
JOIN categorias on categorias.id = produtos.categoria_id
GROUP BY categorias.nome

SELECT produtos.nome as produto_nome, itens_do_pedido.quantidade as quantidade 
FROM produtos
JOIN itens_do_pedido on produtos.id = itens_do_pedido.pedido_id