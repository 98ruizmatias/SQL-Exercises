-- Ejercicio 1

CREATE DATABASE Provedores;

-- Ejercicio 2

DROP DATABASE Provedores;

-- Ejercicio 3

CREATE TABLE Provedores.Pieza
(
	idPieza INT NOT NULL,
	nombre VARCHAR(45) NOT NULL,
	PRIMARY KEY (idPieza)
);

CREATE TABLE Provedores.Proveedor
(
	idProvedor INT NOT NULL,
	nombre VARCHAR(45) NOT NULL,
	PRIMARY KEY (idProvedor)
);

CREATE TABLE Provedores.PiezaHasProvedor
(
	idProvedor INT  NOT NULL,
	idPieza INT NOT NULL,
	precio DOUBLE NOT NULL,
	PRIMARY KEY (idProvedor, idPieza),
	FOREIGN KEY (idProvedor) REFERENCES Provedores.Proveedor(idProvedor),
	FOREIGN KEY (idPieza) REFERENCES Provedores.Pieza(idPieza)
);

-- Ejercicio 4

					-- Tabla Pieza

INSERT INTO Provedores.Pieza VALUES (234895, 'Tenaza Media');
INSERT INTO Provedores.Pieza VALUES (345282, 'Bulon G5 Diametro 15');
INSERT INTO Provedores.Pieza VALUES (124537, 'Tenaza 35');
INSERT INTO Provedores.Pieza VALUES (234159, 'Bulon K40');

					-- Tabla Provedores

INSERT INTO Provedores.Proveedor VALUES (13, 'Bulones Jose');
INSERT INTO Provedores.Proveedor VALUES (38, 'Tenaza Florencio Varela');
INSERT INTO Provedores.Proveedor VALUES (11, 'Bulones Avellaneda');
INSERT INTO Provedores.Proveedor VALUES (31, 'Tenaza Gabriel');

					-- Tabla Precio-Provedores

INSERT INTO Provedores.PiezaHasProvedor VALUES (13, 345282, 14.56);	
INSERT INTO Provedores.PiezaHasProvedor VALUES (13, 234159, 7.45);	
INSERT INTO Provedores.PiezaHasProvedor VALUES (11, 234159, 16.65);		
INSERT INTO Provedores.PiezaHasProvedor VALUES (31, 124537, 123.65);
INSERT INTO Provedores.PiezaHasProvedor VALUES (31, 234895, 175.23);				

-- Ejercicio 7

SELECT nombre 
FROM Pieza;

-- Ejercicio 8

SELECT * 
FROM Provedores;

-- Ejercicio 9

SELECT AVG(precio) 
FROM PiezaHasProvedor
GROUP BY idProvedor;

-- Ejercicio 10

SELECT DISTINCT nombre 
FROM Proveedor AS A
JOIN PiezaHasProvedor AS B
ON A.idProvedor = B.idProvedor
WHERE idPieza = 234159;

-- Ejercicio 11

SELECT DISTINCT A.nombre
FROM Pieza AS A
JOIN PiezaHasProvedor AS B
ON A.idPieza = B.idPieza
JOIN Proveedor AS C
ON B.idProvedor = C.idProvedor
WHERE C.nombre = 'Bulones Jose';

-- Ejercicio 12

SELECT DISTINCT A.nombre, C.nombre, MAX(B.precio)
FROM Proveedor AS A
JOIN PiezaHasProvedor AS B
ON A.idProvedor = B.idProvedor
JOIN Pieza AS C
ON B.idPieza = C.idPieza
GROUP BY A.idProvedor
ORDER BY B.precio DESC;

-- Ejercicio 13

UPDATE PiezaHasProvedor 
SET precio = precio + (precio * 0.06);

-- Ejercicio 14

UPDATE Pieza
SET nombre = 'Bulon K405'
WHERE nombre = 'Bulon K40';


