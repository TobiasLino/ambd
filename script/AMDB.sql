--================================================================
-- 		TABLES
--================================================================
CREATE TABLE AMDB.JOGADOR (
	USERNAME 	VARCHAR(100) NOT NULL PRIMARY KEY,
	NOME 		VARCHAR(100),
	EMAIL		VARCHAR(100),
	CPF			CHAR(11) NOT NULL
);

CREATE TABLE AMDB.CONTATO (
	TELEFONE 	VARCHAR(30) NOT NULL PRIMARY KEY,
	JOGADOR		VARCHAR(100) NOT NULL,
	
	CONSTRAINT FK_CONTATO_JOGADOR FOREIGN KEY (JOGADOR) REFERENCES AMDB.JOGADOR(USERNAME)
);

CREATE TABLE AMDB.TIMES (
	NOME		VARCHAR(100) NOT NULL PRIMARY KEY,
	EMAIL 		VARCHAR(100),
	CAPITAO		VARCHAR(100),
	
	CONSTRAINT FK_TIME_CAPITAO FOREIGN KEY (CAPITAO) REFERENCES AMDB.JOGADOR(USERNAME)
);

CREATE TABLE AMDB.ELO (
	DESCRICAO 	VARCHAR(12) NOT NULL PRIMARY KEY
);

CREATE TABLE AMDB.TORNEIO (
	CODIGO		VARCHAR(12) NOT NULL PRIMARY KEY
);

CREATE TABLE AMDB.TIME_JOGADOR (
	JOGADOR		VARCHAR(100) NOT NULL,
	NOME_TIME	VARCHAR(100) NOT NULL,
	
	CONSTRAINT FK_TIME_JOGADOR FOREIGN KEY (JOGADOR) REFERENCES AMDB.JOGADOR(USERNAME),
	CONSTRAINT FK_TIME_NOME FOREIGN KEY (NOME_TIME) REFERENCES AMDB.TIMES(NOME)
);

CREATE TABLE AMDB.ELO_JOGADOR (
	JOGADOR		VARCHAR(100) NOT NULL,
	ELO 		VARCHAR(12) NOT NULL,
	
	CONSTRAINT FK_ELO_JOGADOR_NOME FOREIGN KEY (JOGADOR) REFERENCES AMDB.JOGADOR(USERNAME),
	CONSTRAINT FK_ELO_JOGADOR_ELO FOREIGN KEY (ELO) REFERENCES AMDB.ELO(DESCRICAO)
);

CREATE TABLE AMDB.ELO_TIME (
	NOME_TIME		VARCHAR(100) NOT NULL,
	ELO 		VARCHAR(12) NOT NULL,
	
	CONSTRAINT FK_ELO_TIME_NOME FOREIGN KEY (NOME_TIME) REFERENCES AMDB.TIMES(NOME),
	CONSTRAINT FK_ELO_TIME_ELO FOREIGN KEY (ELO) REFERENCES AMDB.ELO(DESCRICAO)
);

CREATE TABLE AMDB.ELO_TORNEIO (
	TORNEIO		VARCHAR(12) NOT NULL,
	ELO 		VARCHAR(12) NOT NULL,
	
	CONSTRAINT FK_ELO_TORNEIO_NOME FOREIGN KEY (TORNEIO) REFERENCES AMDB.TORNEIO(CODIGO),
	CONSTRAINT FK_ELO_TORNEIO_ELO FOREIGN KEY (ELO) REFERENCES AMDB.ELO(DESCRICAO)
);

CREATE TABLE AMDB.PARTIDA (
	PARTIDA 	DATE NOT NULL,
	VENCEDOR	VARCHAR(100),
	TORNEIO 	VARCHAR(12) NOT NULL,
	DESAFIANTE	VARCHAR(100) NOT NULL,
	DESAFIADO	VARCHAR(100) NOT NULL,
	
	CONSTRAINT FK_VENCEDOR FOREIGN KEY (VENCEDOR) REFERENCES AMDB.TIMES(NOME),
	CONSTRAINT FK_TORNEIO FOREIGN KEY (TORNEIO) REFERENCES AMDB.TORNEIO(CODIGO),
	CONSTRAINT FK_DESAFIANTE FOREIGN KEY (DESAFIANTE) REFERENCES AMDB.TIMES(NOME),
	CONSTRAINT FK_DESAFIADO FOREIGN KEY (DESAFIADO) REFERENCES AMDB.TIMES(NOME)
);
--================================================================
-- 		MOCKED DATA
--================================================================
INSERT INTO AMDB.JOGADOR (USERNAME, NOME, EMAIL, CPF) VALUES('tslino', 'Tobias lino', 'teste1@teste.com', '44899807873');
INSERT INTO AMDB.JOGADOR (USERNAME, NOME, EMAIL, CPF) VALUES('wereswally', 'Wallace CaePanu', 'teste2@teste.com', '44899807874');
INSERT INTO AMDB.JOGADOR (USERNAME, NOME, EMAIL, CPF) VALUES('jogador1', 'JOGADOR 1', 'teste3@teste.com', '44899807875');
INSERT INTO AMDB.JOGADOR (USERNAME, NOME, EMAIL, CPF) VALUES('jogador2', 'JOGADOR 2', 'teste4@teste.com', '44899807876');
INSERT INTO AMDB.JOGADOR (USERNAME, NOME, EMAIL, CPF) VALUES('jogador3', 'JOGADOR 3', 'teste5@teste.com', '44899807877');
INSERT INTO AMDB.JOGADOR (USERNAME, NOME, EMAIL, CPF) VALUES('jogador4', 'JOGADOR 4', 'teste6@teste.com', '44899807878');
INSERT INTO AMDB.JOGADOR (USERNAME, NOME, EMAIL, CPF) VALUES('jogador5', 'JOGADOR 5', 'teste7@teste.com', '44899807879');
INSERT INTO AMDB.JOGADOR (USERNAME, NOME, EMAIL, CPF) VALUES('jogador6', 'JOGADOR 6', 'teste8@teste.com', '44899807880');
INSERT INTO AMDB.JOGADOR (USERNAME, NOME, EMAIL, CPF) VALUES('jogador7', 'JOGADOR 7', 'teste9@teste.com', '44899807881');
INSERT INTO AMDB.JOGADOR (USERNAME, NOME, EMAIL, CPF) VALUES('jogador8', 'JOGADOR 8', 'teste10@teste.com', '44899807882');
INSERT INTO AMDB.JOGADOR (USERNAME, NOME, EMAIL, CPF) VALUES('jogador9', 'JOGADOR 9', 'teste11@teste.com', '44899807883');
INSERT INTO AMDB.JOGADOR (USERNAME, NOME, EMAIL, CPF) VALUES('jogador10', 'JOGADOR 10', 'teste12@teste.com', '44899807884');
INSERT INTO AMDB.JOGADOR (USERNAME, NOME, EMAIL, CPF) VALUES('jogador11', 'JOGADOR 11', 'teste13@teste.com', '44899807885');
INSERT INTO AMDB.JOGADOR (USERNAME, NOME, EMAIL, CPF) VALUES('jogador12', 'JOGADOR 12', 'teste14@teste.com', '44899807886');
INSERT INTO AMDB.JOGADOR (USERNAME, NOME, EMAIL, CPF) VALUES('capitao1', 'CAPIT�O 1', 'teste15@teste.com', '44899807887');
INSERT INTO AMDB.JOGADOR (USERNAME, NOME, EMAIL, CPF) VALUES('capitao2', 'CAPIT�O 2', 'teste16@teste.com', '44899807888');

INSERT INTO AMDB.CONTATO (TELEFONE, JOGADOR) VALUES ('1998899889', 'tslino');
INSERT INTO AMDB.CONTATO (TELEFONE, JOGADOR) VALUES ('1998799770', 'wereswally');

INSERT INTO AMDB.TIMES (NOME, EMAIL, CAPITAO) VALUES ('time_1', 'time_1@teste.com', 'tslino');
INSERT INTO AMDB.TIMES (NOME, EMAIL, CAPITAO) VALUES ('jantuscara', 'jantuscara@teste.com', 'wereswally');
INSERT INTO AMDB.TIMES (NOME, EMAIL, CAPITAO) VALUES ('time_2', 'time_2@teste.com', 'capitao1');

INSERT INTO AMDB.ELO (DESCRICAO) VALUES ('BRONZE');
INSERT INTO AMDB.ELO (DESCRICAO) VALUES ('PRATA');
INSERT INTO AMDB.ELO (DESCRICAO) VALUES ('OURO');
INSERT INTO AMDB.ELO (DESCRICAO) VALUES ('PLATINA');

INSERT INTO AMDB.TORNEIO (CODIGO) VALUES ('1010');
INSERT INTO AMDB.TORNEIO (CODIGO) VALUES ('1011');

INSERT INTO AMDB.TIME_JOGADOR (JOGADOR, NOME_TIME) VALUES ('tslino', 'time_1');
INSERT INTO AMDB.TIME_JOGADOR (JOGADOR, NOME_TIME) VALUES ('jogador6', 'time_1');
INSERT INTO AMDB.TIME_JOGADOR (JOGADOR, NOME_TIME) VALUES ('jogador7', 'time_1');
INSERT INTO AMDB.TIME_JOGADOR (JOGADOR, NOME_TIME) VALUES ('jogador8', 'time_1');
INSERT INTO AMDB.TIME_JOGADOR (JOGADOR, NOME_TIME) VALUES ('jogador9', 'time_1');
INSERT INTO AMDB.TIME_JOGADOR (JOGADOR, NOME_TIME) VALUES ('jogador5', 'time_2');
INSERT INTO AMDB.TIME_JOGADOR (JOGADOR, NOME_TIME) VALUES ('jogador10', 'time_2');
INSERT INTO AMDB.TIME_JOGADOR (JOGADOR, NOME_TIME) VALUES ('jogador11', 'time_2');
INSERT INTO AMDB.TIME_JOGADOR (JOGADOR, NOME_TIME) VALUES ('jogador12', 'time_2');
INSERT INTO AMDB.TIME_JOGADOR (JOGADOR, NOME_TIME) VALUES ('capitao1', 'time_2');
INSERT INTO AMDB.TIME_JOGADOR (JOGADOR, NOME_TIME) VALUES ('wereswally', 'jantuscara');
INSERT INTO AMDB.TIME_JOGADOR (JOGADOR, NOME_TIME) VALUES ('jogador1', 'jantuscara');
INSERT INTO AMDB.TIME_JOGADOR (JOGADOR, NOME_TIME) VALUES ('jogador2', 'jantuscara');
INSERT INTO AMDB.TIME_JOGADOR (JOGADOR, NOME_TIME) VALUES ('jogador3', 'jantuscara');
INSERT INTO AMDB.TIME_JOGADOR (JOGADOR, NOME_TIME) VALUES ('jogador4', 'jantuscara');

INSERT INTO AMDB.ELO_JOGADOR (ELO, JOGADOR) VALUES ('PLATINA', 'tslino');
INSERT INTO AMDB.ELO_JOGADOR (ELO, JOGADOR) VALUES ('PLATINA', 'wereswally');
INSERT INTO AMDB.ELO_JOGADOR (ELO, JOGADOR) VALUES ('PLATINA', 'jogador1');
INSERT INTO AMDB.ELO_JOGADOR (ELO, JOGADOR) VALUES ('PLATINA', 'jogador2');
INSERT INTO AMDB.ELO_JOGADOR (ELO, JOGADOR) VALUES ('PLATINA', 'jogador3');
INSERT INTO AMDB.ELO_JOGADOR (ELO, JOGADOR) VALUES ('PLATINA', 'jogador4');
INSERT INTO AMDB.ELO_JOGADOR (ELO, JOGADOR) VALUES ('PLATINA', 'jogador5');
INSERT INTO AMDB.ELO_JOGADOR (ELO, JOGADOR) VALUES ('PLATINA', 'jogador6');
INSERT INTO AMDB.ELO_JOGADOR (ELO, JOGADOR) VALUES ('PLATINA', 'jogador7');
INSERT INTO AMDB.ELO_JOGADOR (ELO, JOGADOR) VALUES ('PLATINA', 'jogador8');
INSERT INTO AMDB.ELO_JOGADOR (ELO, JOGADOR) VALUES ('PLATINA', 'jogador9');
INSERT INTO AMDB.ELO_JOGADOR (ELO, JOGADOR) VALUES ('PLATINA', 'jogador10');
INSERT INTO AMDB.ELO_JOGADOR (ELO, JOGADOR) VALUES ('PLATINA', 'jogador11');
INSERT INTO AMDB.ELO_JOGADOR (ELO, JOGADOR) VALUES ('PLATINA', 'jogador12');
INSERT INTO AMDB.ELO_JOGADOR (ELO, JOGADOR) VALUES ('PLATINA', 'capitao1');

INSERT INTO AMDB.ELO_TIME (ELO, NOME_TIME) VALUES ('PLATINA', 'time_1');
INSERT INTO AMDB.ELO_TIME (ELO, NOME_TIME) VALUES ('PLATINA', 'time_2');
INSERT INTO AMDB.ELO_TIME (ELO, NOME_TIME) VALUES ('PLATINA', 'jantuscara');

INSERT INTO AMDB.ELO_TORNEIO (ELO, TORNEIO) VALUES ('PLATINA', '1010');
INSERT INTO AMDB.ELO_TORNEIO (ELO, TORNEIO) VALUES ('PLATINA', '1011');

INSERT INTO AMDB.PARTIDA (PARTIDA, VENCEDOR, TORNEIO, DESAFIANTE, DESAFIADO) VALUES(TO_DATE(nvl('','05/12/2020 18:16:00'),'DD/MM/YYYY HH24:MI:SS'), 'time_2', '1010', 'time_1', 'time_2');
INSERT INTO AMDB.PARTIDA (PARTIDA, VENCEDOR, TORNEIO, DESAFIANTE, DESAFIADO) VALUES(TO_DATE(nvl('','05/12/2020 10:00:00'),'DD/MM/YYYY HH24:MI:SS'), 'jantuscara', '1010', 'jantuscara', 'time_2');
INSERT INTO AMDB.PARTIDA (PARTIDA, TORNEIO, DESAFIANTE, DESAFIADO) VALUES(TO_DATE(nvl('','06/12/2020 10:0:00'),'DD/MM/YYYY HH24:MI:SS'), '1011', 'time_1', 'jantuscara');
INSERT INTO AMDB.PARTIDA (PARTIDA, TORNEIO, DESAFIANTE, DESAFIADO) VALUES(TO_DATE(nvl('','06/12/2020 10:0:00'),'DD/MM/YYYY HH24:MI:SS'), '1010', 'time_1', 'jantuscara');
--================================================================
-- 		OPERATIONS
--================================================================
SELECT * FROM AMDB.JOGADOR;
SELECT * FROM AMDB.CONTATO;
SELECT * FROM AMDB.TIMES;
SELECT * FROM AMDB.ELO;
SELECT * FROM AMDB.TORNEIO;
SELECT * FROM TIME_JOGADOR;
SELECT * FROM ELO_JOGADOR;
SELECT * FROM ELO_TIME;
SELECT * FROM ELO_TORNEIO;
SELECT * FROM PARTIDA;

SELECT J.NOME FROM JOGADOR j INNER JOIN ELO_JOGADOR ej ON ej.JOGADOR = j.USERNAME;

UPDATE AMDB.PARTIDA SET VENCEDOR='jantuscara' WHERE PARTIDA.DESAFIADO = 'jantuscara' AND PARTIDA .DESAFIANTE = 'time_1' AND PARTIDA .TORNEIO = '1011';
UPDATE AMDB.TIMES SET CAPITAO = 'jogador1' WHERE NOME = 'time_1';
UPDATE AMDB.TIMES SET CAPITAO = 'jogador11' WHERE NOME = 'time_2';

DELETE FROM AMDB.PARTIDA WHERE TORNEIO = '1010' AND DESAFIANTE = 'time_1' AND DESAFIADO = 'jantuscara' AND (PARTIDA BETWEEN TO_DATE(nvl('','06/12/2020 10:00:00'),'DD/MM/YYYY HH24:MI:SS') AND TO_DATE(nvl('','06/12/2020 11:0:00'),'DD/MM/YYYY HH24:MI:SS'));

SELECT * FROM JOGADOR J WHERE USERNAME NOT IN (SELECT EJ.JOGADOR FROM ELO_JOGADOR EJ);

DELETE FROM AMDB.JOGADOR WHERE USERNAME IN (SELECT J.USERNAME FROM JOGADOR J WHERE USERNAME NOT IN (SELECT EJ.JOGADOR FROM ELO_JOGADOR EJ));

