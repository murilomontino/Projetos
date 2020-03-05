SET search_path TO controledomuca

-- Apenas uma pode ser simples, ou seja, usar somente o básico SELECT, FROM, WHERE 
SELECT *
FROM usuario
WHERE permissao = '3'

-- JOIN de duas tabelas
SELECT nome, sobrenome, cep, cidade, estado
FROM pessoa JOIN endereco ON(endereco = id_endereco)

--▪ JOIN de várias tabelas variando o uso de NATURAL, USING e ON
SELECT login, senha, email, nome, sobrenome
FROM usuario NATURAL JOIN pessoa JOIN endereco ON(endereco = id_endereco)

SELECT num_nota, item, cadastro, pessoa_juridica, pessoa_fisica, cpf, nome, sobrenome
FROM nota_venda JOIN nota_fiscal USING(num_nota) JOIN cliente ON(id_cliente = comprador) JOIN pessoa_fisica ON(pessoa_fisica = cpf)
	JOIN pessoa ON(pessoa = id_pessoa)
	
--GROUP BY e ORDER BY
SELECT num_nota, comprador, sum(preco_unitario) 
FROM nota_venda JOIN item_venda ON(id_itens_venda = item) JOIN produto pro ON(pro.codigo_de_barras = produto)
GROUP BY num_nota, comprador
ORDER BY sum(preco_unitario) DESC

--Operações aritméticas
--Balanço Final

SELECT *, (lucro.lucrando - prejuizo.preju ) AS balanço_final
FROM (
	select sum(preco_unitario) as preju 
	from nota_compra aux_notaC 
	join item_venda aux_Venda ON(id_itens_venda = item)
	join produto ON(codigo_de_barras = produto)
		
	) prejuizo, 
	(
	select sum(preco_unitario) as lucrando 
	from nota_venda aux_notaC 
	join item_venda aux_Venda ON(id_itens_venda = item)
	join produto ON(codigo_de_barras = produto)	
	) lucro

--Lucro por produto vendido
SELECT nome, preco_real.valor_total_vendido, preco_fabrica.valor_total_fabrica, 
		(preco_real.valor_total_vendido-preco_fabrica.valor_total_fabrica) AS LUCRO
FROM (
	select nome, (preco_unitario*sum(qtd_venda)) as Valor_Total_Vendido
	from nota_fiscal natural join nota_venda join item_venda ON(item = id_itens_venda) 
									  		join produto on(codigo_de_barras = produto)
	group by codigo_de_barras, nome 
	) as preco_real
				  
	JOIN
	
	(
	select nome, (preco_fabrica*sum(qtd_venda)) as Valor_Total_Fabrica
	from nota_fiscal natural join nota_venda join item_venda ON(item = id_itens_venda) join produto on(codigo_de_barras = produto)
	group by codigo_de_barras, nome
	
	) as preco_fabrica USING(nome)
	
	--MAIOR COMPRA
SELECT max(total_comprador.maior) as BIG_COMPRA
FROM (
select num_nota, comprador as comprador, sum(preco_unitario) as maior
from nota_venda join item_venda on(id_itens_venda = item) join produto pro on(pro.codigo_de_barras = produto)
group by num_nota, comprador
order by sum(preco_unitario) DESC
) as total_comprador 
				