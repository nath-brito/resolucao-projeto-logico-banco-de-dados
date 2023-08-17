-- Criando o banco de dados para o cenário de e-commerce --

CREATE DATABASE IF NOT EXISTS ecommerce;
USE ecommerce;

-- Adicionando tabelas --

-- Cliente --
CREATE TABLE client(
			idClient SMALLINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
            Fname VARCHAR(20),
            Minit CHAR(3),
            Lname VARCHAR(20),
            CPF CHAR (11) NOT NULL,
            Adress VARCHAR(45),
            BirthDate DATE,
            CONSTRAINT unique_CPF_client UNIQUE (CPF)

);

-- Produto --
CREATE TABLE product(
			idProduct SMALLINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
            Pname VARCHAR(30),
            Category VARCHAR(20),
            Description VARCHAR (45),
            Value FLOAT,
            Rating FLOAT (2,1),
			Size ENUM ('small', 'medium', 'large') DEFAULT 'medium'
);

-- Pedido --
CREATE TABLE order_info(
			idOrder SMALLINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
            fk_client SMALLINT,
            Status ENUM('Processando', 'EmAndamento', 'Faturado', 'Enviado', 'Entregue') DEFAULT 'Processando',
            Description VARCHAR(255),
            Shipment FLOAT DEFAULT 10,
            Payment_method ENUM('Boleto', 'Cartão', 'Dois Cartões', 'PIX'),
            CONSTRAINT fk_client_order FOREIGN KEY (fk_client) REFERENCES client(idClient)
);

-- Fornecedor --
CREATE TABLE supplier(
			idSupplier SMALLINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
            CNPJ CHAR(14) NOT NULL,
            Trade_name VARCHAR(255),
            Contact_info VARCHAR(45) NOT NULL,
            Adress VARCHAR(45),
            CONSTRAINT unique_CNPJ_supplier UNIQUE (CNPJ)
);

-- Vendedor (terceiro) --
CREATE TABLE seller(
			idSeller SMALLINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
			CNPJ CHAR(14) NOT NULL,
            Trade_name VARCHAR(255),
            Contact_info VARCHAR(45) NOT NULL,
            Adress VARCHAR(45),
            CONSTRAINT unique_CNPJ_seller UNIQUE (CNPJ)

);
            
-- Estoque (local) --
CREATE TABLE storage(
			idStorage SMALLINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
            Location VARCHAR(45),
            Description VARCHAR (255)
);

-- Relação produto/estoque --
CREATE TABLE product_storage(
			fk_product SMALLINT,
            fk_storage SMALLINT,
            CONSTRAINT fk_product_storage FOREIGN KEY(fk_product) REFERENCES product(idProduct),
            CONSTRAINT fk_storage_product FOREIGN KEY(fk_storage) REFERENCES storage(idStorage)
);

-- Relação pedido/produtos --
CREATE TABLE order_product(
			fk_order SMALLINT,
            fk_product SMALLINT,
            Quantity SMALLINT,
            Status ENUM('Disponível', 'SemEstoque') DEFAULT 'Disponível',
            CONSTRAINT fk_order_product FOREIGN KEY(fk_order) REFERENCES order_info(idOrder),
            CONSTRAINT fk_product_order FOREIGN KEY(fk_product) REFERENCES product(idProduct)
);

-- Relação produto/fornecedor --
CREATE TABLE product_supplier(
			fk_product SMALLINT,
            fk_supplier SMALLINT,
            CONSTRAINT fk_product_supplier FOREIGN KEY(fk_product) REFERENCES product(idProduct),
            CONSTRAINT fk_supplier_product FOREIGN KEY(fk_supplier) REFERENCES supplier(idSupplier)
);

-- Relação produto/vendedor -- 
CREATE TABLE product_seller(
			fk_product SMALLINT,
            fk_seller SMALLINT,
            CONSTRAINT fk_product_seller FOREIGN KEY(fk_product) REFERENCES product(idProduct),
            CONSTRAINT fk_seller_product FOREIGN KEY(fk_seller) REFERENCES seller(idSeller)
);

SHOW TABLES;