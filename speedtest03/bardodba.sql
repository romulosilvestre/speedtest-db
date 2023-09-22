/*Criar um banco de dados*/
CREATE DATABASE bardodba;

/*Usar o banco de dados*/
USE bardodba;

/*Criar a tabela garçom*/

CREATE TABLE garcom (
    id INT PRIMARY KEY auto_increment,
    nome VARCHAR(50)
);
/*Não execute esse código agora: DROP TABLE mesa;*/   
/*Inserimos 3 garçons*/
INSERT INTO garcom(nome)VALUES('João');
INSERT INTO garcom(nome)VALUES('Pedro');
INSERT INTO garcom(nome)VALUES('Miguel');

/*Mostrar os garçons*/
SELECT * FROM garcom;

/*Criar a mesa*/
CREATE TABLE mesa (
    id INT PRIMARY KEY auto_increment,
    localizacao NCHAR(2)
);

/*Cinco fileiras: A,B,C,D,E*/
/*Em cada fileira existe 9 mesas*/

/*INSERT da coluna A*/
INSERT INTO mesa(localizacao)VALUES('A1');
INSERT INTO mesa(localizacao)VALUES('A2');
INSERT INTO mesa(localizacao)VALUES('A3');
INSERT INTO mesa(localizacao)VALUES('A4');
INSERT INTO mesa(localizacao)VALUES('A5');
INSERT INTO mesa(localizacao)VALUES('A6');
INSERT INTO mesa(localizacao)VALUES('A7');
INSERT INTO mesa(localizacao)VALUES('A8');
INSERT INTO mesa(localizacao)VALUES('A9');

/*Inserir na coluna B*/

DELIMITER //

CREATE PROCEDURE inserir_valores_na_coluna_B()
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE i < 10 DO
        INSERT INTO mesa (localizacao) VALUES (CONCAT('B', i));
        SET i = i + 1;
    END WHILE;
END;
//

DELIMITER ;

CALL inserir_valores_na_coluna_B();


/*Inserindo na coluna E*/
INSERT INTO mesa (localizacao) VALUES
    ('E1'),
    ('E2'),
    ('E3'),
    ('E4'),
    ('E5'),
    ('E6'),
    ('E7'),
    ('E8'),
    ('E9');

SELECT * FROM mesa;
/*Deletar uma linha da tabela*/
DELETE FROM mesa WHERE id=10;

/*Listar todas as mesas*/
SELECT * FROM mesa;

/*Não execute agora esse código: TRUNCATE TABLE mesa*/
CREATE TABLE comanda (
    id INT PRIMARY KEY auto_increment,
    valor DECIMAL(5,2),    
    fechada TINYINT(1),
    estrelas INT,
    fk_garcom_id INT,
    fk_mesa_id INT
);
SELECT * FROM comanda;

/*ALTER TABLE - altera a tabela*/
/*CONSTRAINT - limitações (regras)*/
/*Adicionar uma CONSTRAINT: FOREING KEY (chave estrangeira)*/
/*alter - alterar*/
/*table - tabela*/
/*comanda - nome da tabela*/
/*add constraint - adicionar regra*/
/*fk_comanda_2 - é o nome da constraint*/
/*FOREING KEY - chave estrangeira*/
/*fk_garcom_id - campo da tabela comanda*/
/*REFERENCES garcom - referenciando a tabela garcom*/
/*ON DELETE CASCADE - deletar em cascata*/
/*o campo garcom(id) - o id é da tabela garcom*/

ALTER TABLE comanda ADD CONSTRAINT FK_comanda_2
    FOREIGN KEY (fk_garcom_id)
    REFERENCES garcom (id)
    ON DELETE CASCADE;

/*ALTER TABLE - altera a tabela*/
/*CONSTRAINT - limitações (regras)*/
/*Adicionar uma CONSTRAINT: FOREING KEY (chave estrangeira)*/
/*alter - alterar*/
/*table - tabela*/
/*comanda - nome da tabela*/
/*add constraint - adicionar regra*/
/*fk_comanda_2 - é o nome da constraint*/
/*FOREING KEY - chave estrangeira*/
/*fk_mesa_id - campo da tabela comanda*/
/*REFERENCES mesa - referenciando a tabela garcom*/
/*ON DELETE CASCADE - deletar em cascata*/
ALTER TABLE comanda ADD CONSTRAINT FK_comanda_3
    FOREIGN KEY (fk_mesa_id)
    REFERENCES mesa (id)
    ON DELETE CASCADE;
    INSERT INTO comanda(valor,fechada,estrelas,fk_garcom_id,fk_mesa_id)
                 VALUES(999.99,false,2,2,5);
	INSERT INTO comanda(valor,fechada,estrelas,fk_garcom_id,fk_mesa_id)
                 VALUES(600.96,true,5,2,6);
	SELECT * FROM comanda;
    
SELECT * FROM comanda; 
SELECT * FROM garcom;
SELECT * FROM mesa;   





    
    
