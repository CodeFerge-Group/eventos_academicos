create table Evento ( 
id_Evento int primary key auto_increment,
nome varchar (100) not null,
moderador varchar (100) not null,
datainicio date CHECK (datainicio < datafim),
datafim date CHECK ( datafim > datainicio),
localevento varchar (100) not null DEFAULT 'Angola' CHECK (LENGTH(localevento) >= 5),
capacidade int,
precoinscricao decimal (10,2) DEFAULT 0.00 CHECK (precoinscricao >= 0));
 
 
create table Participante ( 
id_participante int primary key auto_increment,
nome varchar (100) not null,
datanasc date,
email varchar (100) not null UNIQUE,
telefone varchar(20) default '+244 ' unique CHECK (telefone LIKE '+244 %' AND LENGTH(telefone) = 14),
genero enum ('M', 'F'),
instituicao varchar (100),
curso varchar (100));


create table orador ( 
id_orador int primary key auto_increment,
nome varchar (100) not null,
datanasc date,
genero enum ('M', 'F'),
telefone varchar(20) default '+244 ' unique CHECK (telefone LIKE '+244 %' AND LENGTH(telefone) = 14),
email varchar (100) not null UNIQUE,
endereco varchar (100),
especialidade varchar (100),
bio varchar (5000) not null);


create table sessao ( 
id_sessao int primary key auto_increment,
descricao varchar (100) not null,
datahora datetime,
sala varchar (100),
id_Evento int,
foreign key(id_Evento) references Evento (id_Evento));


create table inscricao ( 
id_inscricao int primary key auto_increment,
datainscricao date,
tipo_inscricao ENUM('Gratuita', 'Paga') NOT NULL,
status_pagamento ENUM('Pendente', 'Confirmado', 'Cancelado', 'Isento') DEFAULT 'Pendente', 
valor_pago DECIMAL(10,2) DEFAULT 0.00 CHECK (valor_pago >= 0),
comprovativo varchar(200) ,
id_Evento int,
id_participante int,
FOREIGN KEY (id_evento) REFERENCES Evento(id_Evento),
FOREIGN KEY (id_participante) REFERENCES Participante(id_participante));

CREATE TABLE sessao_orador (
    id_sessao INT,
    id_orador INT,
    PRIMARY KEY (id_sessao, id_orador),
    FOREIGN KEY (id_sessao) REFERENCES sessao(id_sessao) ON DELETE CASCADE,
    FOREIGN KEY (id_orador) REFERENCES orador(id_orador)ON DELETE CASCADE

);



DELIMITER //

CREATE TRIGGER validar_data_nascimento
BEFORE INSERT ON Participante
FOR EACH ROW
BEGIN
    IF NEW.datanasc >= CURDATE() THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Data de nascimento invalida! Nao pode ser no futuro.';
    END IF;
END; //

DELIMITER ;
