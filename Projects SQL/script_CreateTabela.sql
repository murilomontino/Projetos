CREATE SCHEMA IF NOT EXISTS controledomuca;

SET search_path to controledomuca;

CREATE DOMAIN CPF AS VARCHAR(11);
CREATE DOMAIN CNPJ AS VARCHAR(11);

CREATE TABLE IF NOT EXISTS Usuario (
	id_usuario SERIAL,
    login VARCHAR(45) NOT NULL PRIMARY KEY, 
	senha VARCHAR(20) NOT NULL, 
	permissao CHAR,
	email VARCHAR(45),
	UNIQUE(login),
	UNIQUE(email)
);

CREATE TABLE IF NOT EXISTS Endereco (
	id_endereco SERIAL PRIMARY KEY,
	cep VARCHAR(45) NOT NULL,
	bairro VARCHAR(45),
	cidade VARCHAR(45),
	estado VARCHAR(45),
	pais VARCHAR(45),
	UNIQUE(cep, cidade, estado, pais)
);


CREATE TABLE IF NOT EXISTS Pessoa (
	id_pessoa SERIAL PRIMARY KEY,
	nome VARCHAR(45) NOT NULL,
	sobrenome VARCHAR(45),
	telefone VARCHAR(45)[],
	endereco INT,
	CONSTRAINT fk_endereco FOREIGN KEY (endereco) REFERENCES Endereco (id_endereco)

);

ALTER TABLE Usuario
ADD id_pessoa INT NOT NULL,
ADD CONSTRAINT fk_pessoa FOREIGN KEY (id_pessoa) REFERENCES Pessoa (id_pessoa);	

CREATE TABLE IF NOT EXISTS Pessoa_fisica(
	id_fisica SERIAL ,
	cpf CPF NOT NULL PRIMARY KEY,
	pessoa INT,
	CONSTRAINT fk_pessoa FOREIGN KEY (pessoa) REFERENCES Pessoa (id_pessoa),
	UNIQUE(pessoa, cpf)
);

CREATE TABLE IF NOT EXISTS Pessoa_juridica(
	id_juridica SERIAL ,
	cnpj CNPJ NOT NULL PRIMARY KEY,
	pessoa INT,
	CONSTRAINT fk_pessoa FOREIGN KEY (pessoa) REFERENCES Pessoa (id_pessoa),
	UNIQUE(cnpj, pessoa)
);
	
CREATE TABLE IF NOT EXISTS Fornecedor(
	id_fornecedor SERIAL,
	empresa CNPJ PRIMARY KEY,
	CONSTRAINT fk_empresa FOREIGN KEY(empresa) REFERENCES Pessoa_juridica (cnpj)

);	
	
CREATE TABLE IF NOT EXISTS Cliente(
	id_cliente SERIAL NOT NULL PRIMARY KEY,
	pessoa_juridica VARCHAR,
	pessoa_fisica VARCHAR,
	CONSTRAINT fk_pessoa_juridica FOREIGN KEY(pessoa_juridica) REFERENCES Pessoa_juridica (cnpj),	
	CONSTRAINT fk_pessoa_fisica FOREIGN KEY(pessoa_fisica) REFERENCES Pessoa_fisica (cpf)

);


CREATE TABLE IF NOT EXISTS Produto(
	codigo_de_barras BIGINT PRIMARY KEY NOT NULL,
	nome VARCHAR(45) NOT NULL,
	validade DATE NOT NULL,
	data_cadastro DATE NOT NULL,
	preco_unitario REAL NOT NULL,
	preco_fabrica REAL NOT NULL,
	quantidade_estoque INT NOT NULL


);

CREATE TABLE IF NOT EXISTS  Item_venda(
	id_itens_venda SERIAL PRIMARY KEY,
	qtd_venda INT NOT NULL,
	produto BIGINT NOT NULL,
	CONSTRAINT fk_produto FOREIGN KEY(produto) REFERENCES produto (codigo_de_barras)
);



CREATE TABLE IF NOT EXISTS Nota_fiscal(
	num_nota VARCHAR(20) PRIMARY KEY,
	cadastro DATE NOT NULL,
	vencimento DATE
);

CREATE TABLE IF NOT EXISTS Nota_venda (
	id_nota_venda SERIAL PRIMARY KEY,
	num_nota VARCHAR,
	comprador INT,
	item INT,
	CONSTRAINT fk_item FOREIGN KEY(item) REFERENCES Item_venda (id_itens_venda),
	CONSTRAINT fk_comprador FOREIGN KEY(comprador) REFERENCES cliente(id_cliente),
	CONSTRAINT fk_nota_venda FOREIGN KEY (nota) REFERENCES Nota_fiscal(num_nota)
	);

CREATE TABLE IF NOT EXISTS Nota_compra (
	id_nota_compra SERIAL PRIMARY KEY,
	num_nota VARCHAR,
	fornecedor CNPJ,
	item INT,
	CONSTRAINT fk_item FOREIGN KEY(item) REFERENCES Item_venda (id_itens_venda),
	CONSTRAINT fk_fornecedor FOREIGN KEY(fornecedor) REFERENCES fornecedor(empresa),
	CONSTRAINT fk_nota_compra FOREIGN KEY(nota) REFERENCES Nota_fiscal(num_nota)
	);





