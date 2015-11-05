USE proyectodaw;

-- Atributo compuesto de Candidato ----------------------------------------------------
DROP TABLE IF EXISTS `direccion`;

CREATE TABLE `direccion` (
    `idDir` INT(11) NOT NULL AUTO_INCREMENT UNIQUE,
    `numero` INT(11) NOT NULL,
    `calle` VARCHAR(30) NOT NULL,
    `ciudad` VARCHAR(30) NOT NULL,
    `estado` VARCHAR(30) NOT NULL,
    `codigoPostal` INT(11) NOT NULL,
    PRIMARY KEY (`idDir`)
)  ENGINE=MYISAM DEFAULT CHARSET=LATIN1 AUTO_INCREMENT=1;

INSERT INTO `direccion` (`numero`, `calle`, `ciudad`, `estado`, `codigoPostal`) 
	VALUES (123, 'Ave. Tec', 'Monterrey', 'Nuevo Leon', 65630);
INSERT INTO `direccion` (`numero`, `calle`, `ciudad`, `estado`, `codigoPostal`)
	VALUES (666, 'Hells St.', 'Monterrey', 'Nuevo Leon', 66666);
INSERT INTO `direccion` (`numero`, `calle`, `ciudad`, `estado`, `codigoPostal`)
	VALUES (321, 'Privada Cet', 'Monterrey', 'Nuevo Leon', 64792);
INSERT INTO `direccion` (`numero`, `calle`, `ciudad`, `estado`, `codigoPostal`)
	VALUES (175, 'Blv. Sentido humano', 'Monterrey', 'Nuevo Leon', 65630);

-- Entidad de Candidato ----------------------------------------------------
DROP TABLE IF EXISTS `candidato`;

CREATE TABLE `candidato` (
    `idCand` INT(11) NOT NULL AUTO_INCREMENT UNIQUE,
    `nombreCand` VARCHAR(30) NOT NULL,
    `telCand` VARCHAR(30) NOT NULL,
    `emailCand` VARCHAR(30) NOT NULL,
    `expectEconCand` INT(11) NOT NULL,
    `razonRechazo` VARCHAR(400),
    `direccion` INT(11) NOT NULL,
    PRIMARY KEY (`idCand`),
    FOREIGN KEY (`direccion`)
        REFERENCES `direccion` (`idDir`)
)  ENGINE=MYISAM DEFAULT CHARSET=LATIN1 AUTO_INCREMENT=1;

INSERT INTO `candidato` (`nombreCand`, `telCand`, `emailCand`, `expectEconCand`, `razonRechazo`, `direccion`)
	VALUES ('Luis Sanchez', '811211111', 'luiss@gmail.com', 7500, NULL, 2);
INSERT INTO `candidato` (`nombreCand`, `telCand`, `emailCand`, `expectEconCand`, `razonRechazo`, `direccion`)
	VALUES ('Rodolfo Cantu', '8112222222', 'rodolfoc@gmail.com', 8500, NULL, 1);
INSERT INTO `candidato` (`nombreCand`, `telCand`, `emailCand`, `expectEconCand`, `razonRechazo`, `direccion`)
	VALUES ('Juan Olvera', '8112333333', 'juanc@gmail.com', 7000, NULL, 4);
INSERT INTO `candidato` (`nombreCand`, `telCand`, `emailCand`, `expectEconCand`, `razonRechazo`, `direccion`) 
	VALUES ('Leonardo Gutierrez', '8112444444', 'leonardog@gmail.com', 8500, 'Decidio no trabajar con nosotros; Se fue a otra empresa', 3);
    
-- Atributo multivalor de Candidato ----------------------------------------------------
DROP TABLE IF EXISTS `habilidades`;

CREATE TABLE `habilidades` (
    `idHab` INT(11) NOT NULL AUTO_INCREMENT UNIQUE,
    `habilidad` VARCHAR(30) NOT NULL,
    `candId` INT(11) NOT NULL,
    PRIMARY KEY (`idHab`),
    FOREIGN KEY (`candId`)
        REFERENCES `candidato` (`idCand`)
)  ENGINE=MYISAM DEFAULT CHARSET=LATIN1 AUTO_INCREMENT=1;

INSERT INTO `habilidades` (`habilidad`, `candId`) 
	VALUES ('Java', 1);
INSERT INTO `habilidades` (`habilidad`, `candId`) 
	VALUES ('C++', 1);
INSERT INTO `habilidades` (`habilidad`, `candId`) 
	VALUES ('Unity', 2);
INSERT INTO `habilidades` (`habilidad`, `candId`) 
	VALUES ('JSP', 3);
INSERT INTO `habilidades` (`habilidad`, `candId`) 
	VALUES ('PHP', 3);

-- Entidad debil dependiente de Candidato ----------------------------------------------------
DROP TABLE IF EXISTS `compania`;

CREATE TABLE `compania` (
    `idComp` INT(11) NOT NULL AUTO_INCREMENT UNIQUE,
    `nombreComp` VARCHAR(30) NOT NULL,
    `status` VARCHAR(30) NOT NULL,
    `razonInteres` VARCHAR(300) NOT NULL,
    `candId` INT(11) NOT NULL,
    PRIMARY KEY (`idComp`),
    FOREIGN KEY (`candId`)
        REFERENCES `candidato` (`idCand`)
)  ENGINE=MYISAM DEFAULT CHARSET=LATIN1 AUTO_INCREMENT=1;

INSERT INTO `compania` (`nombreComp`, `status`, `razonInteres`, `candId`)
	VALUES ('Google', 'En curso', 'Habilidad en paradigma orientado a objetos', 1);
INSERT INTO `compania` (`nombreComp`, `status`, `razonInteres`, `candId`)
	VALUES ('Microsoft', 'Rechazado', 'Habilidad en gamification', 2);
INSERT INTO `compania` (`nombreComp`, `status`, `razonInteres`, `candId`)
	VALUES ('Twitter', 'Rechazado', 'Habilidad en web', 3);
INSERT INTO `compania` (`nombreComp`, `status`, `razonInteres`, `candId`)
	VALUES ('Nintendo', 'Rechazado', 'Habilidad en prodiccion de juegos', 2);
INSERT INTO `compania` (`nombreComp`, `status`, `razonInteres`, `candId`)
	VALUES ('Reddit', 'Contratado', 'Habilidad en web', 4);

-- Entidad debil dependiente de Candidato ----------------------------------------------------
DROP TABLE IF EXISTS `titulo`;

CREATE TABLE `titulo` (
    `idTitu` INT(11) NOT NULL AUTO_INCREMENT UNIQUE,
    `instituto` VARCHAR(30) NOT NULL,
    `titulacion` VARCHAR(30) NOT NULL,
    `fecha` DATE NOT NULL,
    `candId` INT(11) NOT NULL,
    PRIMARY KEY (`idTitu`),
    FOREIGN KEY (`candId`)
        REFERENCES `candidato` (`idCand`)
)  ENGINE=MYISAM DEFAULT CHARSET=LATIN1 AUTO_INCREMENT=1;

INSERT INTO `titulo` (`Instituto`, `titulacion`, `fecha`, `candId`)
	VALUES ('ITESM', 'Ingenieria en Ciencias Computacionales', '2015-11-28', 1);
INSERT INTO `titulo` (`Instituto`, `titulacion`, `fecha`, `candId`)
	VALUES ('ITESM', 'Ingenieria en Sistemas de Entretenimiento', '2015-11-28', 2);
INSERT INTO `titulo` (`Instituto`, `titulacion`, `fecha`, `candId`)
	VALUES ('ITESM', 'Ingenieria en Sistemas Interconectados', '2015-11-28', 3);
INSERT INTO `titulo` (`Instituto`, `titulacion`, `fecha`, `candId`)
	VALUES ('ITESM', 'Ingenieria en Sistemas de Comunicacion', '2015-11-28', 4);

-- Entidad debil dependiente de Candidato ----------------------------------------------------
DROP TABLE IF EXISTS `certificado`;

CREATE TABLE `certificado` (
    `idCert` INT(11) NOT NULL AUTO_INCREMENT UNIQUE,
    `organizacion` VARCHAR(30) NOT NULL,
    `certificacion` VARCHAR(30) NOT NULL,
    `fecha` DATE NOT NULL,
    `candId` INT(11) NOT NULL,
    PRIMARY KEY (`idCert`),
    FOREIGN KEY (`candId`)
        REFERENCES `candidato` (`idCand`)
)  ENGINE=MYISAM DEFAULT CHARSET=LATIN1 AUTO_INCREMENT=1;

INSERT INTO `certificado` (`organizacion`, `certificacion`, `fecha`, `candId`)
	VALUES ('SEI', 'OOP', '2015-11-02', 1);
INSERT INTO `certificado` (`organizacion`, `certificacion`, `fecha`, `candId`)
	VALUES ('UDEMY', 'Gamification', '2015-10-28', 2);
INSERT INTO `certificado` (`organizacion`, `certificacion`, `fecha`, `candId`)
	VALUES ('W3School', 'BackEnd', '2014-11-28', 3);
INSERT INTO `certificado` (`organizacion`, `certificacion`, `fecha`, `candId`)
	VALUES ('W3School', 'FrontEnd', '2014-11-28', 3);

-- Entidad debil dependiente de Candidato ----------------------------------------------------
DROP TABLE IF EXISTS `trabajo_Anterior`;

CREATE TABLE `trabajo_Anterior` (
    `idTrabAnt` INT(11) NOT NULL AUTO_INCREMENT UNIQUE,
    `empresaAnt` VARCHAR(30) NOT NULL,
    `puestoAnt` VARCHAR(30) NOT NULL,
    `fechaEntrada` DATE NOT NULL,
    `fechaSalida` DATE NOT NULL,
    `salarioAnt` INT(11) NOT NULL,
    `candId` INT(11) NOT NULL,
    PRIMARY KEY (`idTrabAnt`),
    FOREIGN KEY (`candId`)
        REFERENCES `candidato` (`idCand`)
)  ENGINE=MYISAM DEFAULT CHARSET=LATIN1 AUTO_INCREMENT=1;

INSERT INTO `trabajo_Anterior` (`empresaAnt`, `puestoAnt`, `fechaEntrada`, `fechaSalida`, `salarioAnt`, `candId`) 
	VALUES ('TOWA', 'SD Internt', '2015-05-10', '2015-08-01', 7000, 1);
INSERT INTO `trabajo_Anterior` (`empresaAnt`, `puestoAnt`, `fechaEntrada`, `fechaSalida`, `salarioAnt`, `candId`) 
	VALUES ('Beliveo', 'Web Internt', '2015-03-10', '2015-05-01', 5000, 1);
    
-- Entidad de Empleado ----------------------------------------------------
DROP TABLE IF EXISTS `empleado`;

CREATE TABLE `empleado` (
    `nomina` INT(11) NOT NULL AUTO_INCREMENT UNIQUE,
    `puesto` VARCHAR(30) NOT NULL,
    `departamento` VARCHAR(30) NOT NULL,
    `fechaEntrada` DATE NOT NULL,
    `salario` INT(11) NOT NULL,
    `diasVacaciones` INT(11) NOT NULL,
    `candId` INT(11) NOT NULL,
    `supervisor` INT(11),
    PRIMARY KEY (`nomina`),
    FOREIGN KEY (`candId`)
        REFERENCES `candidato` (`idCand`),
    FOREIGN KEY (`supervisor`)
        REFERENCES `empleado` (`nomina`)
)  ENGINE=MYISAM DEFAULT CHARSET=LATIN1 AUTO_INCREMENT=1;

INSERT INTO `empleado` (`puesto`, `departamento`, `fechaEntrada`, `salario`, `diasVacaciones`, `candId`, `supervisor`)
	VALUES ('Lider de desarrollo', 'SD', '2015-04-10', 8000, 5, 2, NULL);
INSERT INTO `empleado` (`puesto`, `departamento`, `fechaEntrada`, `salario`, `diasVacaciones`, `candId`, `supervisor`)
	VALUES ('Desarrollador', 'SD', '2015-04-11', 5000, 3, 3, 1);

-- Entidad debil dependiente de Empleado ----------------------------------------------------
DROP TABLE IF EXISTS `historial`;

CREATE TABLE `historial` (
    `idHist` INT(11) NOT NULL AUTO_INCREMENT UNIQUE,
    `puestoHist` VARCHAR(30) NOT NULL,
    `fechaHist` DATE NOT NULL,
    `salarioHist` INT(11) NOT NULL,
    `empId` INT(11) NOT NULL,
    PRIMARY KEY (`idHist`),
    FOREIGN KEY (`empId`)
        REFERENCES `empleado` (`nomina`)
)  ENGINE=MYISAM DEFAULT CHARSET=LATIN1 AUTO_INCREMENT=1;

-- Atributo compuesto de Entrevista ----------------------------------------------------
DROP TABLE IF EXISTS `feedback`;

CREATE TABLE `feedback` (
    `idFeed` INT(11) NOT NULL AUTO_INCREMENT UNIQUE,
    `aptitudFeed` VARCHAR(30) NOT NULL,
    `descripcionFeed` VARCHAR(300) NOT NULL,
    PRIMARY KEY (`idFeed`)
)  ENGINE=MYISAM DEFAULT CHARSET=LATIN1 AUTO_INCREMENT=1;

INSERT INTO `feedback` (`aptitudFeed`, `descripcionFeed`)
	VALUES ('buena', 'Muestra buen conocimiento en el area');
INSERT INTO `feedback` (`aptitudFeed`, `descripcionFeed`)
	VALUES ('buena', 'Tiene buena experiencia para el puesto');
INSERT INTO `feedback` (`aptitudFeed`, `descripcionFeed`)
	VALUES ('regular', 'No tiene mucha experiencia para el puesto pero puede aprender rapido');

-- Entidad de Entrevista ----------------------------------------------------
DROP TABLE IF EXISTS `entrevista`;

CREATE TABLE `entrevista` (
    `idEnt` INT(11) NOT NULL AUTO_INCREMENT UNIQUE,
    `plataforma` VARCHAR(30) NOT NULL,
    `fecha` DATE NOT NULL,
    `feedback` INT(11) NOT NULL,
    `entrevistado` INT(11) NOT NULL,
    `entrevistador` INT(11) NOT NULL,
    PRIMARY KEY (`idEnt`),
    FOREIGN KEY (`feedback`)
        REFERENCES `feedback` (`idFeed`),
    FOREIGN KEY (`entrevistado`)
        REFERENCES `candidato` (`idCand`),
    FOREIGN KEY (`entrevistador`)
        REFERENCES `empleado` (`nomina`)
)  ENGINE=MYISAM DEFAULT CHARSET=LATIN1 AUTO_INCREMENT=1;

INSERT INTO `entrevista` (`plataforma`, `fecha`, `feedback`, `entrevistado`, `entrevistador`)
	VALUES ('En Linea', '2015-01-11', 1, 3, 2);
    INSERT INTO `entrevista` (`plataforma`, `fecha`, `feedback`, `entrevistado`, `entrevistador`)
	VALUES ('En Persona', '2015-01-11', 2, 4, 2);
    INSERT INTO `entrevista` (`plataforma`, `fecha`, `feedback`, `entrevistado`, `entrevistador`)
	VALUES ('Por Telefono', '2015-01-11', 3, 1, 2);
