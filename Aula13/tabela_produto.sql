CREATE TABLE produtos_tipo(
	idTipo SERIAL PRIMARY KEY,
	descricaoTipo VARCHAR NOT NULL
);

CREATE TABLE produtos(
	idProd SERIAL PRIMARY KEY,
	descricaoProd VARCHAR NOT NULL,
	precoProd DECIMAL(10,2),
	tipo INT REFERENCES produtos_tipo(idTipo)
);


INSERT INTO produtos_tipo (descricaotipo)
VALUES 	('Computador'), 
		('Impressora'), 
		('Smartphone');

INSERT INTO produtos (descricaoprod, precoprod, tipo)
VALUES 	('Desktop', 1200.00, 1),
		('Notebook', 4000.00, 1),
		('Impressora Laser', 1500.00, 2),
		('Impressora Jato de Tinta', 500.00, 2),
		('Headset Gamer', 300.00, NULL);

SELECT * FROM produtos p;
SELECT * FROM produtos_tipo pt;


-- LEFT JOIN
SELECT p.idprod, p.descricaoprod, p.precoprod, pt.descricaotipo
FROM produtos p LEFT JOIN produtos_tipo pt
ON p.tipo = pt.idTipo

--RIGHT JOIN 
SELECT p.idprod, p.descricaoprod, p.precoprod, pt.descricaotipo
FROM produtos p RIGHT JOIN produtos_tipo pt
ON p.tipo = pt.idTipo

--FULL OUTER JOIN
SELECT p.idprod, p.descricaoprod, p.precoprod, pt.descricaotipo
FROM produtos p FULL JOIN produtos_tipo pt
ON p.tipo = pt.idTipo

--INNER JOIN ou JOIN
SELECT p.idprod, p.descricaoprod, p.precoprod, pt.descricaotipo
FROM produtos p JOIN produtos_tipo pt
ON p.tipo = pt.idTipo

