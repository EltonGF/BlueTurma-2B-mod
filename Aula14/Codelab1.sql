SELECT * FROM funcionarios f 

SELECT nome, sobrenome, email FROM funcionarios f; -- ex.1

SELECT f.nome, f.sobrenome, f.email FROM funcionarios f WHERE f.cargo LIKE 'Sales Rep' --ex2

SELECT DISTINCT f.cargo FROM funcionarios f --ex3

SELECT DISTINCT l.cidade FROM lojas l  --ex4 

SELECT f.nome, f.sobrenome, f.email, l.cidade, l.pais, l.telefone 
FROM funcionarios f INNER JOIN lojas l ON f.codloja = l.codloja 
WHERE f.cargo = 'President';  --ex5

SELECT MAX(p.precocompra), p.nomeproduto FROM produtos p ORDER BY p.precocompra DESC LIMIT 1;
SELECT MAX(p.precocompra), p.nomeproduto FROM produtos p; --ex6
SELECT p.precocompra, p.nomeproduto FROM produtos p ORDER BY precocompra DESC LIMIT 1  --ex6(ok no meu)

SELECT MIN (precocompra), nomeproduto FROM produtos p ;--ex7

SELECT p.precocompra, p.nomeproduto FROM produtos p ORDER BY precocompra ASC LIMIT 1 --ex7(ok no meu)

SELECT p.nomeproduto FROM produtos p 
WHERE p.qtdEstoque = (SELECT MIN(qtdEstoque) FROM produtos); --ex8

SELECT p.nomeproduto FROM produtos p 
WHERE p.qtdEstoque = (SELECT MAX(qtdEstoque) FROM produtos); --ex9

SELECT p.nomeproduto FROM produtos p 
WHERE p.qtdEstoque = (SELECT qtdEstoque FROM produtos ORDER BY qtdestoque ASC LIMIT 1)  --ex8(outra forma)

SELECT p.nomeproduto FROM produtos p 
WHERE p.qtdEstoque = (SELECT qtdEstoque FROM produtos ORDER BY qtdestoque DESC LIMIT 1)  --ex9(outra forma)

SELECT p.nomeproduto, SUM(d.quantidadepedida)
FROM produtos p INNER JOIN detalhespedidos d ON p.codproduto = d.codproduto
GROUP BY p.nomeproduto;


