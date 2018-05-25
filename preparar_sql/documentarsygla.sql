CREATE DATABASE syglacolombia;

USE syglacolombia;

-- tablas de la base de dataos para sygla --

-- tabla usuario
CREATE TABLE usuarios (
id_usuario INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR(70) NOT NULL,
documento_usuario VARCHAR(13) NOT NULL,
codigo VARCHAR(6) NOT NULL,
estado varchar(6) NOT NULL DEFAULT 'activo',
CONSTRAINT up_documento UNIQUE (documento_usuario),
CONSTRAINT pk_usuario PRIMARY KEY (id_usuario)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- tabla vehiculo
CREATE TABLE vehiculos (
id_vehiculo INT NOT NULL AUTO_INCREMENT,
placa VARCHAR(7) NOT NULL,
marca VARCHAR(20) NOT NULL,
modelo VARCHAR(4) NOT NULL,
CONSTRAINT up_placa UNIQUE (placa),
CONSTRAINT pk_vehiculo PRIMARY KEY (id_vehiculo)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE conductores (
id_conductor INT NOT NULL AUTO_INCREMENT, 
nombre VARCHAR(70) NOT NULL,
documento_conductor VARCHAR(13) NOT NULL,
CONSTRAINT up_documento_condu UNIQUE (documento_conductor),
CONSTRAINT pk_conductor PRIMARY KEY (id_conductor)
)ENGINE=iNNOdb DEFAULT CHARSET=utf8;



CREATE TABLE preguntas (
id_pregunta INT NOT NULL AUTO_INCREMENT,
pregunta VARCHAR(200) NOT NULL,
fecha_pregunta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
CONSTRAINT pk_pregunta PRIMARY KEY(id_pregunta)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE observaciones (
id_observacion INT NOT NULL AUTO_INCREMENT,
observacion VARCHAR(80),
fecha_observacion DATETIME NOT NULL,
fecha_up TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
id_observacion_vehiculo INT NOT NULL,
CONSTRAINT pk_observacion PRIMARY KEY (id_observacion),
CONSTRAINT fk_observacion_vehiculo FOREIGN KEY (id_observacion_vehiculo)
REFERENCES vehiculos (id_vehiculo)
ON DELETE RESTRICT ON UPDATE RESTRICT
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE servicios (
id_servicio INT NOT NULL AUTO_INCREMENT,
ingreso VARCHAR(10) NOT NULL,
fecha_servicio DATETIME NOT NULL,
fecha_up TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
id_servicio_vehiculo INT NOT NULL,
CONSTRAINT pk_servicio PRIMARY KEY (id_servicio),
CONSTRAINT fk_servicio_vehiculo FOREIGN KEY (id_servicio_vehiculo)
REFERENCES vehiculos (id_vehiculo)
ON DELETE RESTRICT ON UPDATE RESTRICT
)ENGINE=InnoDB DEFAULT CHARSET=utf8; 


CREATE TABLE conducen (
id_conduce INT NOT NULL AUTO_INCREMENT,
id_conduce_vehiculo INT NOT NULL,
id_conduce_conductor INT NOT NULL,
fecha_conduce DATETIME NOT NULL,
CONSTRAINT pk_conducen PRIMARY KEY (id_conduce),
CONSTRAINT fk_conduce_vehiculo FOREIGN KEY(id_conduce_vehiculo)
REFERENCES vehiculos (id_vehiculo)
ON DELETE RESTRICT ON UPDATE RESTRICT,
CONSTRAINT fk_conduce_conductor FOREIGN KEY (id_conduce_conductor)
REFERENCES conductores (id_conductor)
ON DELETE RESTRICT ON UPDATE RESTRICT
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE cuestionarios (
id_cuestionario INT NOT NULL AUTO_INCREMENT,
fecha_cuestionario DATETIME NOT NULL,
fecha_up TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
estado_cuestionario TINYINT(1) NOT NULL DEFAULT 1,
id_cuestionario_vehiculo INT NOT NULL,
id_cuestionario_usuario INT NOT NULL,
CONSTRAINT pk_cuestionarios PRIMARY KEY (id_cuestionario),
CONSTRAINT fk_cuestionario_vehiculo FOREIGN KEY (id_cuestionario_vehiculo)
REFERENCES vehiculos (id_vehiculo)
ON DELETE RESTRICT ON UPDATE RESTRICT,
CONSTRAINT fk_cuestionario_usuario FOREIGN KEY (id_cuestionario_usuario)
REFERENCES usuarios (id_usuario)
ON DELETE RESTRICT ON UPDATE RESTRICT
)ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE respuestas (
id_respuesta INT NOT NULL AUTO_INCREMENT,
id_respuesta_cuestionario INT NOT NULL,
id_respuesta_pregunta INT NOT NULL,
respuesta_1 VARCHAR(10) NOT NULL,
respuesta_2 VARCHAR(80),
CONSTRAINT pk_respuestas PRIMARY KEY (id_respuesta),
CONSTRAINT fk_respuesta_cuestionario FOREIGN KEY (id_respuesta_cuestionario)
REFERENCES cuestionarios (id_cuestionario)
ON DELETE RESTRICT ON UPDATE RESTRICT,
CONSTRAINT fk_respuesta_pregunta FOREIGN KEY (id_respuesta_pregunta)
REFERENCES preguntas (id_pregunta)
ON DELETE RESTRICT ON UPDATE RESTRICT
)ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- ======================================================
--  Autor:			Alexander Menjura.
--  Fecha:			23-05-2018.
--  Descripcion :	Procedimiento para guardar datos
--  				de formulario para vehiculos con
--   				cuestionario pruabas simples sin
--  				try ni catch.
-- ======================================================

DELIMITER $$

CREATE PROCEDURE cuestionario_vehiculos ( IN
	_fehcad DATETIME,
	_inspec VARCHAR(6),
	_conduc VARCHAR(70),
	_docume VARCHAR(13),
	_placa  VARCHAR(7),
	_marca  VARCHAR(20),
	_modelo VARCHAR(20),
	_servic VARCHAR(10),
	_resp1  VARCHAR(10),
	_obse1	VARCHAR(80),
	_resp2	VARCHAR(10),
	_obse2	VARCHAR(80),
	_resp3 	VARCHAR(10),
	_obse3	VARCHAR(80),
	_resp4 	VARCHAR(10),
	_obse4	VARCHAR(80),
	_resp5	VARCHAR(10),
	_obse5	VARCHAR(80),
	_resp6 	VARCHAR(10),
	_obse6	VARCHAR(80),
	_resp7 	VARCHAR(10),
	_obse7	VARCHAR(80),
	_resp8 	VARCHAR(10),
	_obse8	VARCHAR(80),
	_resp9 	VARCHAR(10),
	_obse9	VARCHAR(80),
	_resp10	VARCHAR(10),
	_obse10	VARCHAR(80),
	_resp11	VARCHAR(10),
	_obse11 VARCHAR(80),
	_resp12 VARCHAR(10),
	_obse12	VARCHAR(80),
	_resp13	VARCHAR(10),
	_obse13	VARCHAR(80),
	_resp14	VARCHAR(10),
	_obse14	VARCHAR(80),
	_resp15	VARCHAR(10),
	_obse15	VARCHAR(80),
	_resp16	VARCHAR(10),
	_obse16	VARCHAR(80),
	_resp17	VARCHAR(10),
	_obse17	VARCHAR(80),
	_resp18	VARCHAR(10),
	_obse18	VARCHAR(80),
	_obsege VARCHAR(80),
	OUT _msg VARCHAR(50)
)
BEGIN
	DECLARE id_consultor VARCHAR(6);
	SET id_consultor = (SELECT id_usuario FROM usuarios WHERE codigo = _inspec);
	

END$$
	