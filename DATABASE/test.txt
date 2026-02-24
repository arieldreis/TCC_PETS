-- Criar banco de dados
CREATE DATABASE loja_dev;

-- Usar banco
USE loja_dev;

-- Criar tabela de clientes
CREATE TABLE clientes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    email VARCHAR(100),
    telefone VARCHAR(20),
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Criar tabela de produtos
CREATE TABLE produtos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(150),
    descricao TEXT,
    preco DECIMAL(10,2),
    estoque INT,
    criado_em DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Criar tabela de pedidos
CREATE TABLE pedidos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT,
    data_pedido DATETIME DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(50),
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

-- Criar tabela de itens do pedido
CREATE TABLE itens_pedido (
    id INT PRIMARY KEY AUTO_INCREMENT,
    pedido_id INT,
    produto_id INT,
    quantidade INT,
    preco_unitario DECIMAL(10,2),
    FOREIGN KEY (pedido_id) REFERENCES pedidos(id),
    FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

-- Inserts clientes
INSERT INTO clientes (nome, email, telefone) VALUES
('João Silva', 'joao@email.com', '11999990001'),
('Maria Oliveira', 'maria@email.com', '11999990002'),
('Carlos Souza', 'carlos@email.com', '11999990003'),
('Ana Costa', 'ana@email.com', '11999990004'),
('Fernanda Lima', 'fernanda@email.com', '11999990005');

-- Inserts produtos
INSERT INTO produtos (nome, descricao, preco, estoque) VALUES
('Notebook Gamer', 'Notebook com 16GB RAM e RTX 4060', 7500.00, 10),
('Mouse Sem Fio', 'Mouse ergonômico 2.4GHz', 120.50, 50),
('Teclado Mecânico', 'Switch Blue ABNT2', 350.90, 30),
('Monitor 27"', 'Monitor 144Hz Full HD', 1899.99, 15),
('Headset Gamer', 'Headset com cancelamento de ruído', 499.00, 25);

-- Inserts pedidos
INSERT INTO pedidos (cliente_id, status) VALUES
(1, 'Processando'),
(2, 'Enviado'),
(3, 'Entregue'),
(1, 'Cancelado'),
(4, 'Processando');

-- Inserts itens_pedido
INSERT INTO itens_pedido (pedido_id, produto_id, quantidade, preco_unitario) VALUES
(1, 1, 1, 7500.00),
(1, 2, 2, 120.50),
(2, 3, 1, 350.90),
(3, 4, 1, 1899.99),
(4, 5, 1, 499.00),
(5, 2, 3, 120.50);

-- Query aleatória para teste
SELECT c.nome, p.id AS pedido_id, p.status, SUM(i.quantidade * i.preco_unitario) AS total
FROM clientes c
JOIN pedidos p ON c.id = p.cliente_id
JOIN itens_pedido i ON p.id = i.pedido_id
GROUP BY p.id;