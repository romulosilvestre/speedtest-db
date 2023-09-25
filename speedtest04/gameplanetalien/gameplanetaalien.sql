CREATE DATABASE planetaalien;
USE planetaalien;
CREATE TABLE usuario(     
     id int primary key auto_increment,
     nome varchar(70) NULL,
     apelido varchar(70) NOT NULL,
     email varchar(80) NOT NULL,
     senha nchar(8) NOT NULL
);

show tables;


USE bardodba;
drop table usuario;


describe usuario;
INSERT INTO usuario(nome,apelido,email,senha)
             VALUES('Tatiene','Taty','tatiene@gmail.com','12345678');
             
             
	SELECT * FROM usuario;
    
    SELECT apelido FROM usuario;
    SELECT apelido,senha FROM usuario;
    SELECT id,apelido FROM usuario;
    
    DELETE FROM usuario;
    DELETE FROM usuario WHERE id=2;
    
    UPDATE usuario SET apelido = 'Taty' WHERE id = 1;
    