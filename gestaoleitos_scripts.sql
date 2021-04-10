show databases;
use mydb;
show tables;
/*drop database mydb;*/
SELECT * FROM enfermaria;
SELECT * FROM paciente;
SELECT * FROM hospital;
SELECT * FROM leito;


SELECT letnome, enfnome, hosrazaosocial FROM leito, enfermaria, hospital;

INSERT INTO hospital (hoscodigo,hoscnpj, hosrazaosocial, hosendereco) values
	(0,'08.431.778/0001-67','HOSPITAL MEMORIAL DE ARENDELLE', 'fiorde real 123'); 
    
INSERT INTO enfermaria (enfcodigo, enfsigla, enfnome, enfhoscodigo) value
	(1,'ADM01','Admissao 01 geral',0),
    (2,'ADM02','Admissao 02 COVID',0),
    (3,'ENF01','Enfermaria 01',0),
    (4,'CCR01','Centro Cirurgico 01 geral',0);
INSERT INTO leito (letcodigo, letnumero, letnome, letipo, letobservacao, letenfcodigo) values
	(1,'LT001', ' leito 01 admissao 01','OBSERVAÇÃO','Apenas para observação do Paciente',1),
    (2,'LT002', ' leito 02 admissao 01','OBSERVAÇÃO','Apenas para observação do Paciente',1),
    (3,'LT003', ' leito 03 admissao 01','OBSERVAÇÃO','Apenas para observação do Paciente',1),
    (4,'LT004', ' leito 04 admissao 01','OBSERVAÇÃO','Apenas para observação do Paciente',1),
    (5,'LT005', ' leito 05 admissao 01','OBSERVAÇÃO','Apenas para observação do Paciente',1),
    (6,'LT006', ' leito 06 admissao 02','OBSERVAÇÃO','Apenas para observação do Paciente',2),
	(7,'LT007', ' leito 07 admissao 02','OBSERVAÇÃO','Apenas para observação do Paciente',2),
    (8,'LT008', ' leito 08 admissao 02','OBSERVAÇÃO','Apenas para observação do Paciente',2),
    (9,'LT009', ' leito 09 admissao 02','OBSERVAÇÃO','Apenas para observação do Paciente',2),
    (10,'LT010', ' leito 10 ENFERMARIA 01','ENFERMARIA','PACIENTE INTERNADO',3),
    (11,'LT011', ' leito 11 Centro Cirurgico','SALA CIRURGICA','','4');