SET search_path to controledomuca;

--------------------------------------------------------------------------
--INSERT INTO ENDERECO(id_endereco, cep, bairro, cidade, estado, pais)

INSERT INTO  ENDERECO(id_endereco, cep, cidade, estado, pais)

VALUES 
(1001, '49099563', 'SÃO CRISTOVÃO', 'SERGIPE', 'BRASIL'),
(1002, '44856715', 'SALVADOR', 'BAHIA', 'BRASIL'),
(1003, '44856715', 'CALDAS DO JORRO - TUCANO', 'BAHIA', 'BRASIL'),
(1004, '12658694', 'RIO DE JANEIRO', 'RIO DE JANEIRO', 'BRASIL'),
(1005, '03659751', 'SÃO PAULO', 'SÃO PAULO', 'BRASIL');
--------------------------------------------------------------------------
--INSERT INTO PESSOA(id_pessoa, nome, sobrenome, telefone, endereco)
INSERT INTO  PESSOA(id_pessoa, nome, sobrenome, telefone, endereco)
VALUES
(101, 'Murilo', 'Montino', null, 1003 ),
(102, 'Mario', 'Silva', null, 1003 ),
(103, 'Sadia', 'Empresa', null, 1005 ),
(104, 'Odebrech', 'Empresa', null, 1004 ),
(105, 'Deric', 'Pinheiro', null, 1002 ),
(106, 'UFS', 'Universidade', null, 1001 ),
(107, 'Adalberto', 'Andrade da Silva', null, 1001 ),
(108, 'Indefinido', 'da Silva', null, 1001 ),
(100, 'Admin', 'Admin', null, null );


-- --------------------------------------------------------------------------
--INSERT INTO USUARIO(id_usuario, login, senha, permissao, email, pessoa)
INSERT INTO  USUARIO(id_usuario, login, senha, permissao, email, pessoa)

VALUES 
(1,'admin', 'admin', 3, 'admin@hotmail.com', 100),
(2, 'mucamon', 'muca123', 1, 'murilomontino@hotmail.com',101),
(3, 'sadia', 'queijosuiço', 2, 'sadia_olaf@gmail.com', 103);

--------------------------------------------------------------------------
--INSERT INTO PESSOA_FISICA(id_fisica, cpf, pessoa)
INSERT INTO  PESSOA_FISICA(cpf, pessoa)
VALUES
('578496313-0', 101),
('327495396-3', 102),
('868442509-9', 105),
('560021213-1', 106),
('018496313-3', 107),
('000000000-0', 108),
('Indefinido', 100);


--------------------------------------------------------------------------
--INSERT INTO PESSOA_JURIDICA(id_juridica, cnpj, pessoa)
INSERT INTO PESSOA_JURIDICA(cnpj, pessoa)
VALUES
('888226958-4',103),
('545235398-5',104),
('Indefinido',100);


--------------------------------------------------------------------------
--INSERT INTO FORNECEDOR(id_fornecedor, empresa)
INSERT INTO FORNECEDOR(empresa)
VALUES ('545235398-5');

--------------------------------------------------------------------------
--INSERT INTO CLIENTE(id_cliente, pessoa_juridica, pessoa_fisica)
INSERT INTO CLIENTE(id_cliente, pessoa_juridica, pessoa_fisica)
VALUES
(2000,'Indefinido','Indefinido');

INSERT INTO CLIENTE(id_cliente, pessoa_juridica)
VALUES
(2001, '888226958-4');

INSERT INTO CLIENTE(id_cliente, pessoa_fisica)
VALUES
(2002, '578496313-0'),
(2003, '327495396-3'),
(2006, '868442509-9'),
(2007, '560021213-1'),
(2008, '018496313-3'),
(2009, '000000000-0');
--------------------------------------------------------------------------
--INSERT INTO PRODUTO(codigo_de_barras, nome, validade, data_cadastro, preco_unitario, preco_fabrica, quantidade_estoque )
INSERT INTO PRODUTO(codigo_de_barras, nome, validade, data_cadastro, preco_unitario, preco_fabrica, quantidade_estoque)
VALUES
(54879320014588, 'MIOJO SADIA SABOR FRANGO', '01-06-2020', '29-08-2018', 1.00, 0.50, 500),
(43768219014496, 'MACARRÃO', '22-03-2019', '29-08-2018', 2.30, 0.50, 230),
(32658108014309, 'CIMENTO', '08-12-2030', '29-08-2018', 21.00, 0.50, 5),
(21547097014215, 'MOLHO', '01-01-2018', '29-08-2017', 1.45, 0.50, 10),
(10474986014120, 'KETCHUP', '31-01-2022', '29-08-2018', 3.00, 0.50, 88);




--------------------------------------------------------------------------
--INSERT INTO ITEM_VENDA(id_itens_venda, qtd_venda, produto)
INSERT INTO ITEM_VENDA(id_itens_venda, qtd_venda, produto)
VALUES
-- MIOJO
(5005, 3, 54879320014588), --x
(5006, 7, 54879320014588), --x
(5007, 2, 54879320014588), --x
(5008, 1, 54879320014588), --x
-- CIMENTO
(5010, 10, 32658108014309), --x
(5011, 1, 32658108014309),-- x
-- MACARRAO
(5012, 4, 43768219014496), --x
(5013, 1, 43768219014496), --x
(5014, 2, 43768219014496), --x
(5015, 5, 43768219014496),
-- KETCHUP
(5016, 1, 10474986014120), --x
-- MOLHO
(5017, 1, 21547097014215),--x
(5018, 1, 21547097014215), --x
(5019, 2, 21547097014215), --x
(5020, 2, 21547097014215); --x

--------------------------------------------------------------------------
--INSERT INTO NOTA_FISCAL(num_nota, cadastro, vencimento, item)
INSERT INTO NOTA_FISCAL(num_nota, cadastro, vencimento)
VALUES
--CIMENTO FORNECEDOR
(11001,'29-08-2018', null),

(11002,'29-07-2018', null),

( 11003,'30-07-2018', null),

( 11004,'29-06-2018', null),

( 11005,'29-06-2018', null),

(11006,'29-08-2017', null);

--------------------------------------------------------------------------
--INSERT INTO NOTA_VENDA(nota, comprador)
INSERT INTO NOTA_VENDA(nota, comprador, item)
VALUES 
--COMPRADOR 1
(11002, 2000, 5011),
(11002, 2000, 5017),
(11002, 2000, 5012),
(11002, 2000, 5015),
--COMPRADOR 2
(11003, 2009, 5016),
(11003, 2009, 5013),
(11003, 2009, 5016),
(11003, 2009, 5018),
-- COMPRADOR 3
(11004, 2008, 5007),
(11004, 2008, 5019),
(11004, 2008, 5014),
-- COMPRADOR 4
(11005, 2007, 5018),
(11005, 2007, 5015),

--COMPRADOR 5
(11006, 2006, 5020);

--------------------------------------------------------------------------
--INSERT INTO NOTA_COMPRA(nota, fornecedor, item)
INSERT INTO NOTA_COMPRA(nota, fornecedor, item)
VALUES (11001, '545235398-5', 5010);























