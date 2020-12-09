CREATE DATABASE tabaquitos_cachimba;
USE tabaquitos_cachimba;


-- Tabla `Paises`
-- -----------------------------------------------------
CREATE TABLE Paises(
  idPaises INT NOT NULL AUTO_INCREMENT,
  Nombre VARCHAR(45) NOT NULL,
  PRIMARY KEY (idPaises));
  
  -- -----------------------------------------------------
-- Inserto datos a las columnas de la tabla 'Paises'

INSERT INTO paises (idPaises, Nombre) VALUES (1, 'ESPAÑA');
INSERT INTO paises (idPaises, Nombre) VALUES (2, 'ALEMANIA');
INSERT INTO paises (idPaises, Nombre) VALUES (3, 'EE.UU');
INSERT INTO paises (idPaises, Nombre) VALUES (4, 'TURQUIA');

-- -----------------------------------------------------
-- Table `Marcas`

CREATE TABLE Marcas (
  idMarcas INT NOT NULL AUTO_INCREMENT,
  Nombre VARCHAR(45) NOT NULL,
  idPais INT NOT NULL,
  PRIMARY KEY (idMarcas),
  CONSTRAINT idPais
    FOREIGN KEY (idPais)
	REFERENCES Paises (idPaises)
    ON DELETE CASCADE
    );
    

    
-- -----------------------------------------------------
-- Inserto datos a las columnas de la tabla 'Marcas'

INSERT INTO marcas (idMarcas, Nombre, idPais) VALUES (1, 'ADALYA', 4);
INSERT INTO marcas (idMarcas, Nombre, idPais) VALUES (2, 'OVERDOZZ', 1);
INSERT INTO marcas (idMarcas, Nombre, idPais) VALUES (3, 'CHAOS', 2);
INSERT INTO marcas (idMarcas, Nombre, idPais) VALUES (4, 'ALFAKER', 4);
INSERT INTO marcas (idMarcas, Nombre, idPais) VALUES (5, 'TANGIER', 3);

-- -----------------------------------------------------
-- Table `Sabores`

CREATE TABLE Sabores (
  idSabores INT NOT NULL,
  idMarca INT NOT NULL,
  Nombre VARCHAR(45) NOT NULL,
  PRIMARY KEY (idSabores),
  CONSTRAINT idMarca
    FOREIGN KEY (idMarca)
    REFERENCES Marcas (idMarcas)
);

-- Inserto datos a las columnas de la tabla de sabores

INSERT INTO sabores (idSabores, idMarca, Nombre) VALUES (1, 1, 'MELON');
INSERT INTO sabores (idSabores, idMarca, Nombre) VALUES (2, 1, 'SANDIA');
INSERT INTO sabores (idSabores, idMarca, Nombre) VALUES (3, 2, 'MELOCOTON');
INSERT INTO sabores (idSabores, idMarca, Nombre) VALUES (4, 3, 'FRAMBUESA');
INSERT INTO sabores (idSabores, idMarca, Nombre) VALUES (5, 4, 'LIMON');
INSERT INTO sabores (idSabores, idMarca, Nombre) VALUES (6, 3, 'LIMA');
INSERT INTO sabores (idSabores, idMarca, Nombre) VALUES (7, 5, 'CHOCOLATE');
INSERT INTO sabores (idSabores, idMarca, Nombre) VALUES (8, 4, 'MENTA');
INSERT INTO sabores (idSabores, idMarca, Nombre) VALUES (9, 2, 'CARAMELO');


-- -----------------------------------------------------
-- Table 'Tabacosdecachimba`

CREATE TABLE IF NOT EXISTS Tabacosdecachimba(
  idTabacosdecachimba INT NOT NULL AUTO_INCREMENT,
  Marcas INT NOT NULL,
  Sabores INT NOT NULL,
  Gramos INT NOT NULL,
  Precio INT NOT NULL,
  PRIMARY KEY (idTabacosdecachimba),
  CONSTRAINT Marcas
    FOREIGN KEY (Marcas)
    REFERENCES Marcas (idMarcas),
  CONSTRAINT Sabores
    FOREIGN KEY (Sabores)
    REFERENCES Sabores (idSabores)
);
    
    -- Inserto datos a las columnas de la tabla 'Tabacosdecachimba'
    
INSERT INTO tabacosdecachimba (idTabacosdecachimba, Marcas, Sabores, Gramos, Precio) VALUES (1, 1, 1, 25, 5);
INSERT INTO tabacosdecachimba (idTabacosdecachimba, Marcas, Sabores, Gramos, Precio) VALUES (2, 2, 3, 25, 5);
INSERT INTO tabacosdecachimba (idTabacosdecachimba, Marcas, Sabores, Gramos, Precio) VALUES (3, 3, 6, 25, 5);
INSERT INTO tabacosdecachimba (idTabacosdecachimba, Marcas, Sabores, Gramos, Precio) VALUES (4, 4, 5, 25, 5);
INSERT INTO tabacosdecachimba (idTabacosdecachimba, Marcas, Sabores, Gramos, Precio) VALUES (5, 5, 7, 25, 5);
INSERT INTO tabacosdecachimba (idTabacosdecachimba, Marcas, Sabores, Gramos, Precio) VALUES (6, 2, 9, 25, 5);

-- Visualizar  tablas
SELECT * FROM paises;
SELECT * FROM marcas;
SELECT * FROM sabores;
SELECT * FROM tabacosdecachimba;


-- Actualizar resgistros de una tabla
-- Tabla PAISES

UPDATE paises SET nombre = "FRANKFURT" WHERE idPaises = 2;
UPDATE marcas SET nombre = "BLUEHORSE" WHERE idMarcas = 1;
UPDATE sabores SET nombre = "CAFÉ" WHERE idSabores = 1;
UPDATE tabacosdecachimba SET Gramos = 200 WHERE idTabacosdecachimba = 1;

-- Eliminar columnas o tablas completas

ALTER TABLE tabacosdecachimba DROP constraint Marcas;
ALTER TABLE tabacosdecachimba ADD constraint Fk_Marcas foreign key (marcas) references marcas (idmarcas)  on delete cascade;
ALTER TABLE tabacosdecachimba DROP constraint sabores;
ALTER TABLE tabacosdecachimba ADD constraint Fk_sabores foreign key (sabores) references sabores(idsabores)  on delete cascade;

DELETE FROM marcas where idmarcas=5; 

-- SOY INCAPAZ DE HACERLO



-- Consultas SELECT

SELECT idMarca,nombre FROM sabores WHERE  idMarca = 2;
SELECT Marcas,sabores,Gramos FROM tabacosdecachimba WHERE gramos <50;
SELECT  nombre,idpais FROM marcas WHERE idpais = 4 OR idpais = 3;
SELECT*FROM tabacosdecachimba WHERE sabores BETWEEN 3 AND 7 ORDER BY sabores DESC;