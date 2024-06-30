CREATE TABLE Product
(
	model char(4),
	maker char(1),
	typee varchar(8)
)

CREATE TABLE Printer 
(
	code int,
	model varchar(4),
	price decimal(10,2)
)

INSERT INTO Product(model, maker,typee)
VALUES('SA','S','SAD');

INSERT INTO Printer(code,model,price)
VALUES(34,'SAS',3.23)

ALTER TABLE Printer
ADD typee varchar(6), color char(1)

ALTER TABLE Printer
DROP COLUMN Price

DROP TABLE Product
DROP TABLE Printer
