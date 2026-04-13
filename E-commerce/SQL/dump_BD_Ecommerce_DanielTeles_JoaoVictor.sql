-- Daniel Teles de Oliveira RA:00334427
-- Joao Victor Torres Soares RA:00330701
-- -----------------------------------------------------
-- Inserção de Tipos de Usuário
-- -----------------------------------------------------
-- Define os perfis possíveis dentro do sistema
INSERT INTO Tipo_Usuario (nome_tipo) VALUES
('Cliente'),     -- Usuário que realiza compras
('Vendedor'),    -- Usuário que anuncia/vende produtos
('Admin');       -- Usuário com privilégios administrativos


-- -----------------------------------------------------
-- Inserção de Categorias
-- -----------------------------------------------------
-- Define as categorias disponíveis para classificação dos produtos
INSERT INTO Categoria (nome, descricao) VALUES
('Eletrônicos', 'Dispositivos tecnológicos e acessórios'),
('Moda', 'Roupas e acessórios em geral'),
('Casa & Cozinha', 'Itens domésticos e utilitários'),
('Esportes', 'Produtos esportivos'),
('Beleza', 'Cosméticos e cuidados pessoais'),
('Livros', 'Literatura em geral'),
('Games', 'Jogos e acessórios gamer'),
('Automotivo', 'Peças e acessórios automotivos'),
('Infantil', 'Produtos para crianças'),
('Alimentos', 'Produtos alimentícios diversos');


-- -----------------------------------------------------
-- Inserção de Transportadoras
-- -----------------------------------------------------
-- Empresas responsáveis pela entrega dos pedidos
INSERT INTO Transportadora (nome, cnpj) VALUES
('Jadlog Express', '12.345.678/0001-90'),
('Correios Brasil', '34.567.890/0001-11'),
('Flash Entregas', '56.789.012/0001-22'),
('Total Express', '78.901.234/0001-33'),
('Loggi', '11.222.333/0001-44'),
('Sequoia Log', '22.333.444/0001-55'),
('DHL Brasil', '33.444.555/0001-66'),
('FedEx Brasil', '44.555.666/0001-77'),
('Amazon Logistics BR', '55.666.777/0001-88'),
('Braspress', '66.777.888/0001-99');


-- -----------------------------------------------------
-- Inserção de Usuários
-- -----------------------------------------------------
-- Cada usuário possui um tipo (cliente, vendedor ou admin)
INSERT INTO Usuario (Tipo_Usuario_tipo_usuario_id, nome_completo, email, data_cadastro, telefone) VALUES
(1, 'Carlos Henrique Silva', 'carlos.silva@email.com', '2025-01-10', '11988887777'), -- Cliente
(1, 'Juliana Andrade Lima', 'juliana.lima@email.com', '2025-02-12', '21977776666'),
(2, 'Marcos Vinicius Souza', 'marcos.souza@email.com', '2025-03-05', '31966665555'), -- Vendedor
(1, 'Fernanda Rocha Alves', 'fernanda.alves@email.com', '2025-03-15', '41955554444'),
(3, 'Administrador Sistema', 'admin@ecommerce.com', '2025-01-01', '11999990000'), -- Admin
(2, 'Rafael Monteiro Costa', 'rafael.costa@email.com', '2025-04-02', '21988889999'),
(1, 'Patrícia Gomes Ribeiro', 'patricia.ribeiro@email.com', '2025-02-25', '31977778888'),
(1, 'Bruno Martins Dias', 'bruno.dias@email.com', '2025-03-28', '41966667777'),
(2, 'Thiago Nunes Pereira', 'thiago.pereira@email.com', '2025-04-05', '51955556666'),
(1, 'Amanda Ferreira Lopes', 'amanda.lopes@email.com', '2025-04-10', '11944445555');


-- -----------------------------------------------------
-- Inserção de Endereços
-- -----------------------------------------------------
-- Cada endereço pertence a um usuário (relação 1:N)
INSERT INTO Endereco (Usuario_usuario_id, logradouro, cep, complemento, estado_uf, cidade) VALUES
(1,'Rua Afonso Pena, 120','01001000','Apto 12','SP','São Paulo'),
(2,'Av. Brasil, 500','22020002','Casa','RJ','Rio de Janeiro'),
(3,'Rua Minas Gerais, 77','30130010','Bloco B','MG','Belo Horizonte'),
(4,'Rua das Flores, 200','80010000','Fundos','PR','Curitiba'),
(5,'Av. Paulista, 1500','01310000','Sala 10','SP','São Paulo'),
(6,'Rua Goiás, 45','74000000','Casa','GO','Goiânia'),
(7,'Av. Central, 900','40000000','Ap 101','BA','Salvador'),
(8,'Rua Independência, 321','90000000','Casa','RS','Porto Alegre'),
(9,'Av. Brasil Norte, 88','65000000','Bloco A','MA','São Luís'),
(10,'Rua Vitória, 55','29000000','Casa','ES','Vitória');


-- -----------------------------------------------------
-- Inserção de Pessoa Física
-- -----------------------------------------------------
-- Complementa dados de usuários do tipo PF
INSERT INTO Usuario_PF (Usuario_usuario_id, cpf, data_nascimento) VALUES
(1,'12345678901','1995-05-10'),
(2,'23456789012','1990-11-22'),
(4,'34567890123','1988-03-15'),
(7,'45678901234','1997-07-30'),
(8,'56789012345','1993-09-18'),
(10,'67890123456','2000-01-25'),
(3,'78901234567','1992-12-12'),
(6,'89012345678','1985-06-06'),
(9,'90123456789','1998-08-08'),
(5,'01234567890','1980-10-10');


-- -----------------------------------------------------
-- Inserção de Pessoa Jurídica
-- -----------------------------------------------------
-- Complementa dados de usuários do tipo PJ
INSERT INTO Usuario_PJ (Usuario_usuario_id, razao_social, cnpj, inscricao_estadual) VALUES
(1,'Tech Silva LTDA','11.111.111/0001-11','IS12345'),
(2,'Moda Andrade EPP','22.222.222/0001-22','IS23456'),
(3,'Souza Vendas ME','33.333.333/0001-33','IS34567'),
(4,'Alves Comércio LTDA','44.444.444/0001-44','IS45678'),
(5,'Admin Systems SA','55.555.555/0001-55','IS56789'),
(6,'Costa Distribuidora','66.666.666/0001-66','IS67890'),
(7,'Ribeiro Imports LTDA','77.777.777/0001-77','IS78901'),
(8,'Dias E-commerce','88.888.888/0001-88','IS89012'),
(9,'Pereira Atacado','99.999.999/0001-99','IS90123'),
(10,'Lopes Digital Store','10.101.010/0001-10','IS01234');


-- -----------------------------------------------------
-- Inserção de Produtos
-- -----------------------------------------------------
-- Cada produto pertence a uma categoria
INSERT INTO Produto (Categoria_categoria_id, preco, ativo, estoque_qtd) VALUES
(1, 1999.90, 1, '50'),  -- Eletrônicos
(2, 129.90, 1, '200'),
(3, 89.90, 1, '150'),
(4, 299.90, 1, '80'),
(5, 59.90, 1, '300'),
(6, 39.90, 1, '500'),
(7, 249.90, 1, '120'),
(8, 799.90, 1, '40'),
(9, 49.90, 1, '250'),
(10, 19.90, 1, '600');


-- -----------------------------------------------------
-- Inserção de Anúncios
-- -----------------------------------------------------
-- Liga vendedor + produto (quem está vendendo o quê)
INSERT INTO Anuncio (Usuario_usuario_id, Produto_produto_id, nome, descricao, data, ativo) VALUES
(3,1,'Notebook Gamer','Alta performance para jogos','2025-04-01',1),
(6,2,'Camiseta Premium','Algodão 100%','2025-04-02',1),
(9,3,'Panela Antiaderente','Cozinha moderna','2025-04-03',1),
(2,4,'Bola Futebol','Profissional','2025-04-04',1),
(8,5,'Creme Facial','Hidratante diário','2025-04-05',1),
(7,6,'Livro Romance','Best seller','2025-04-06',1),
(1,7,'Headset Gamer','Som surround','2025-04-07',1),
(4,8,'Drone Pro','Filmagens aéreas','2025-04-08',1),
(5,9,'Acessório Carro','Organizador interno','2025-04-09',1),
(10,10,'Chocolate Gourmet','Premium artesanal','2025-04-10',1);


-- -----------------------------------------------------
-- Inserção de Pedidos
-- -----------------------------------------------------
-- Representa compras realizadas pelos usuários
INSERT INTO Pedido (Usuario_usuario_id, data_pedido, status, valor_total) VALUES
(1,'2025-04-01','Entregue',1999.90),
(2,'2025-04-02','Enviado',129.90),
(3,'2025-04-03','Processando',89.90),
(4,'2025-04-04','Cancelado',299.90),
(5,'2025-04-05','Pago',59.90),
(6,'2025-04-06','Entregue',39.90),
(7,'2025-04-07','Enviado',249.90),
(8,'2025-04-08','Pago',799.90),
(9,'2025-04-09','Processando',49.90),
(10,'2025-04-10','Entregue',19.90);


-- -----------------------------------------------------
-- Inserção de Itens do Pedido
-- -----------------------------------------------------
-- Relaciona produtos aos pedidos (resolve N:N)
INSERT INTO Item_Pedido (Pedido_pedido_id, Produto_produto_id, quantidade, preco_unitario, observacao) VALUES
(1,1,1,1999.90,'Entrega rápida'),
(2,2,1,129.90,''),
(3,3,1,89.90,''),
(4,4,1,299.90,'Produto com embalagem reforçada'),
(5,5,1,59.90,''),
(6,6,1,39.90,''),
(7,7,1,249.90,''),
(8,8,1,799.90,'Produto frágil'),
(9,9,1,49.90,''),
(10,10,1,19.90,'Presente');


-- -----------------------------------------------------
-- Inserção de Pagamentos
-- -----------------------------------------------------
-- Registra como o pedido foi pago
INSERT INTO Pagamento (Pedido_pedido_id, nome, descricao, status, valor_pago, data_pagamento) VALUES
(1,'Cartão de Crédito','Pagamento aprovado via cartão','Aprovado',1999.90,'2025-04-01'),
(2,'Pix','Pagamento instantâneo','Aprovado',129.90,'2025-04-02'),
(3,'Boleto','Aguardando compensação','Pendente',89.90,'2025-04-03'),
(4,'Cartão de Crédito','Pagamento recusado','Recusado',299.90,'2025-04-04'),
(5,'Pix','Pagamento confirmado','Aprovado',59.90,'2025-04-05'),
(6,'Cartão de Débito','Pagamento aprovado','Aprovado',39.90,'2025-04-06'),
(7,'Pix','Pagamento aprovado','Aprovado',249.90,'2025-04-07'),
(8,'Cartão de Crédito','Pagamento aprovado','Aprovado',799.90,'2025-04-08'),
(9,'Boleto','Pago após compensação','Aprovado',49.90,'2025-04-09'),
(10,'Pix','Pagamento aprovado','Aprovado',19.90,'2025-04-10');


-- -----------------------------------------------------
-- Inserção de Entregas
-- -----------------------------------------------------
-- Relaciona pedido + transportadora + status de entrega
INSERT INTO Entrega (Transportadora_transportadora_id, Pedido_pedido_id, data_entrega, status, codigo_rastreio) VALUES
(1,1,'2025-04-03','Entregue','BR123456789SP'),
(2,2,'2025-04-05','Em trânsito','BR234567890RJ'),
(3,3,'2025-04-06','Separação','BR345678901MG'),
(4,4,'2025-04-07','Cancelado','BR456789012PR'),
(5,5,'2025-04-07','Entregue','BR567890123SP'),
(6,6,'2025-04-08','Entregue','BR678901234GO'),
(7,7,'2025-04-09','Em trânsito','BR789012345BA'),
(8,8,'2025-04-10','Entregue','BR890123456RS'),
(9,9,'2025-04-11','Processando','BR901234567MA'),
(10,10,'2025-04-12','Entregue','BR012345678ES');


-- -----------------------------------------------------
-- Inserção de Avaliações
-- -----------------------------------------------------
-- Usuários avaliam produtos comprados
INSERT INTO Avaliacao (Usuario_usuario_id, Produto_produto_id, nota, descricao) VALUES
(1,1,5,'Produto excelente, superou expectativas'),
(2,2,4,'Muito bom, entrega rápida'),
(3,3,3,'Ok, poderia ser melhor'),
(4,4,5,'Excelente qualidade'),
(5,5,4,'Bom custo-benefício'),
(6,6,3,'Produto razoável'),
(7,7,5,'Muito bom, recomendo'),
(8,8,4,'Ótima performance'),
(9,9,2,'Não atendeu totalmente'),
(10,10,5,'Excelente, recomendo muito');


-- -----------------------------------------------------
-- Inserção de Características dos Produtos
-- -----------------------------------------------------
-- Dados técnicos detalhados de cada produto
INSERT INTO Características (Produto_produto_id, nome, descricao, marca, modelo, cor, peso, dimensao) VALUES
(1,'Notebook Gamer','Alta performance para jogos pesados','Dell','G15','Preto',2.50,15.60),
(2,'Camiseta','Camiseta algodão premium','Nike','Classic','Branca',0.20,0.50),
(3,'Panela','Panela antiaderente resistente','Tramontina','Ultra','Vermelha',1.20,1.00),
(4,'Bola','Bola profissional de futebol','Adidas','Match','Branca',0.45,0.70),
(5,'Creme Facial','Hidratação profunda','Nivea','Care','Branco',0.30,0.40),
(6,'Livro','Romance bestseller','Saraiva','Edição 1','N/A',0.50,2.00),
(7,'Headset','Som surround gamer','HyperX','Cloud II','Preto/Vermelho',0.35,1.20),
(8,'Drone','Filmagem aérea 4K','DJI','Mini 3','Cinza',0.80,3.50),
(9,'Acessório Carro','Organizador interno','Multilaser','AutoPro','Preto',0.60,1.00),
(10,'Chocolate','Chocolate gourmet artesanal','Lindt','Excellence','Marrom',0.10,0.20);