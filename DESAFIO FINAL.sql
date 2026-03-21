CREATE DATABASE velozcar;
USE velozcar;


CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    cpf VARCHAR(14) UNIQUE,
    data_nascimento DATE,
    telefone VARCHAR(20),
    email VARCHAR(100),
    endereco VARCHAR(100),
    data_cadastro DATE
);

CREATE TABLE funcionario (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    cpf VARCHAR(14) UNIQUE,
    cargo VARCHAR(50),
    salario DECIMAL(10,2),
    telefone VARCHAR(20),
    email VARCHAR(100),
    data_admissao DATE
);

CREATE TABLE veiculo (
    id_veiculo INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(10) UNIQUE,
    modelo VARCHAR(50),
    marca VARCHAR(50),
    cor VARCHAR(30),
    ano_fabricacao INT,
    valor_diaria DECIMAL(10,2),
    status VARCHAR(20)
);

CREATE TABLE aluguel (
    id_aluguel INT AUTO_INCREMENT PRIMARY KEY,
    data_inicio DATE,
    data_fim DATE,
    valor_total DECIMAL(10,2),
    multa VARCHAR(20),
    observacoes VARCHAR(20),
    id_cliente INT,
    id_funcionario INT,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_funcionario)
);

CREATE TABLE item_aluguel (
    id_item INT AUTO_INCREMENT PRIMARY KEY,
    id_aluguel INT,
    id_veiculo INT,
    quantidade_dias INT,
    status VARCHAR(20),
    valor_diario DECIMAL(10,2),
    desconto VARCHAR(20),
    subtotal DECIMAL(10,2),
    FOREIGN KEY (id_aluguel) REFERENCES aluguel(id_aluguel),
    FOREIGN KEY (id_veiculo) REFERENCES veiculo(id_veiculo)
);

CREATE TABLE pagamento (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    valor DECIMAL(10,2),
    data_pagamento DATE,
    metodo VARCHAR(20),
    juros VARCHAR(20),
    desconto VARCHAR(20),
    status VARCHAR(20),
    id_aluguel INT,
    FOREIGN KEY (id_aluguel) REFERENCES aluguel(id_aluguel)
);

CREATE TABLE manutencao (
    id_manutencao INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(100),
    data DATE,
    custo DECIMAL(10,2),
    garantia VARCHAR(20),
    tipo VARCHAR(20),
    id_veiculo INT,
    id_funcionario INT,
    FOREIGN KEY (id_veiculo) REFERENCES veiculo(id_veiculo),
    FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_funcionario)
);

INSERT INTO cliente VALUES
(1,'Joao','111','1990-01-01','9991','joao@email','Rua A','2026-01-01'),
(2,'Maria','222','1995-02-02','9992','maria@email','Rua B','2026-01-02'),
(3,'Pedro','333','2000-03-03','9993','pedro@email','Rua C','2026-01-03'),
(4,'Ana','444','1998-04-04','9994','ana@email','Rua D','2026-01-04'),
(5,'Lucas','555','1997-05-05','9995','lucas@email','Rua E','2026-01-05'),
(6,'Julia','666','1996-06-06','9996','julia@email','Rua F','2026-01-06'),
(7,'Bruno','777','1994-07-07','9997','bruno@email','Rua G','2026-01-07'),
(8,'Carla','888','1993-08-08','9998','carla@email','Rua H','2026-01-08'),
(9,'Rafael','999','1992-09-09','9999','rafael@email','Rua I','2026-01-09'),
(10,'Fernanda','101','1991-10-10','9910','fernanda@email','Rua J','2026-01-10'),
(11,'Paulo','102','1990-11-11','9911','paulo@email','Rua K','2026-01-11'),
(12,'Patricia','103','1989-12-12','9912','patricia@email','Rua L','2026-01-12'),
(13,'Daniel','104','1988-01-13','9913','daniel@email','Rua M','2026-01-13'),
(14,'Marcos','105','1987-02-14','9914','marcos@email','Rua N','2026-01-14'),
(15,'Beatriz','106','1999-03-15','9915','beatriz@email','Rua O','2026-01-15');

INSERT INTO funcionario VALUES
(1,'Carlos','201','Atendente',2000,'8001','carlos@email','2025-01-01'),
(2,'Ana','202','Gerente',3000,'8002','ana@email','2024-01-01'),
(3,'Luis','203','Atendente',2000,'8003','luis@email','2025-02-01'),
(4,'Marcia','204','Financeiro',2500,'8004','marcia@email','2023-01-01'),
(5,'Jose','205','Atendente',2000,'8005','jose@email','2025-03-01'),
(6,'Clara','206','RH',2800,'8006','clara@email','2022-01-01'),
(7,'Paulo','207','Atendente',2000,'8007','paulo@email','2025-04-01'),
(8,'Sandra','208','Gerente',3200,'8008','sandra@email','2023-02-01'),
(9,'Bruno','209','Atendente',2000,'8009','bruno@email','2025-05-01'),
(10,'Lucas','210','TI',3500,'8010','lucas@email','2021-01-01'),
(11,'Julia','211','Atendente',2000,'8011','julia@email','2025-06-01'),
(12,'Pedro','212','Financeiro',2600,'8012','pedro@email','2023-03-01'),
(13,'Fernanda','213','RH',2700,'8013','fernanda@email','2022-02-01'),
(14,'Ricardo','214','Atendente',2000,'8014','ricardo@email','2025-07-01'),
(15,'Patricia','215','Gerente',3300,'8015','patricia@email','2023-04-01');

INSERT INTO veiculo VALUES
(1,'AAA1111','Civic','Honda','Preto',2020,150,'disponivel'),
(2,'BBB2222','Corolla','Toyota','Branco',2021,160,'disponivel'),
(3,'CCC3333','Onix','Chevrolet','Prata',2019,100,'disponivel'),
(4,'DDD4444','HB20','Hyundai','Vermelho',2022,120,'disponivel'),
(5,'EEE5555','Gol','VW','Azul',2018,90,'disponivel'),
(6,'FFF6666','Ka','Ford','Branco',2017,80,'disponivel'),
(7,'GGG7777','Cruze','Chevrolet','Preto',2020,140,'disponivel'),
(8,'HHH8888','Argo','Fiat','Cinza',2021,110,'disponivel'),
(9,'III9999','Compass','Jeep','Preto',2022,200,'disponivel'),
(10,'JJJ0000','Renegade','Jeep','Branco',2021,180,'disponivel'),
(11,'KKK1112','Tracker','Chevrolet','Azul',2020,130,'disponivel'),
(12,'LLL2223','Kwid','Renault','Branco',2019,70,'disponivel'),
(13,'MMM3334','Sandero','Renault','Prata',2018,85,'disponivel'),
(14,'NNN4445','Fusion','Ford','Preto',2017,150,'disponivel'),
(15,'OOO5556','Celta','Chevrolet','Vermelho',2016,60,'disponivel');

INSERT INTO aluguel VALUES
(1,'2026-02-01','2026-02-05',600,'finalizado',1,1),
(2,'2026-02-02','2026-02-06',640,'finalizado',2,2),
(3,'2026-02-03','2026-02-07',400,'ativo',3,3),
(4,'2026-02-04','2026-02-08',480,'ativo',4,4),
(5,'2026-02-05','2026-02-09',360,'finalizado',5,5),
(6,'2026-02-06','2026-02-10',320,'ativo',6,6),
(7,'2026-02-07','2026-02-11',560,'finalizado',7,7),
(8,'2026-02-08','2026-02-12',440,'ativo',8,8),
(9,'2026-02-09','2026-02-13',800,'finalizado',9,9),
(10,'2026-02-10','2026-02-14',720,'ativo',10,10),
(11,'2026-02-11','2026-02-15',520,'finalizado',11,11),
(12,'2026-02-12','2026-02-16',260,'ativo',12,12),
(13,'2026-02-13','2026-02-17',340,'finalizado',13,13),
(14,'2026-02-14','2026-02-18',600,'ativo',14,14),
(15,'2026-02-15','2026-02-19',240,'finalizado',15,15);

INSERT INTO item_aluguel VALUES
(1,1,1,4,600),
(2,2,2,4,640),
(3,3,3,4,400),
(4,4,4,4,480),
(5,5,5,4,360),
(6,6,6,4,320),
(7,7,7,4,560),
(8,8,8,4,440),
(9,9,9,4,800),
(10,10,10,4,720),
(11,11,11,4,520),
(12,12,12,4,260),
(13,13,13,4,340),
(14,14,14,4,600),
(15,15,15,4,240);

INSERT INTO pagamento VALUES
(1,600,'2026-02-01','pix','concluido',1),
(2,640,'2026-02-02','cartao','concluido',2),
(3,400,'2026-02-03','pix','pendente',3),
(4,480,'2026-02-04','boleto','pendente',4),
(5,360,'2026-02-05','pix','concluido',5),
(6,320,'2026-02-06','cartao','pendente',6),
(7,560,'2026-02-07','pix','concluido',7),
(8,440,'2026-02-08','boleto','pendente',8),
(9,800,'2026-02-09','pix','concluido',9),
(10,720,'2026-02-10','cartao','pendente',10),
(11,520,'2026-02-11','pix','concluido',11),
(12,260,'2026-02-12','boleto','pendente',12),
(13,340,'2026-02-13','pix','concluido',13),
(14,600,'2026-02-14','cartao','pendente',14),
(15,240,'2026-02-15','pix','concluido',15);

INSERT INTO manutencao VALUES
(1,'oleo','2026-02-01',200,1,1),
(2,'freio','2026-02-02',300,2,2),
(3,'pneu','2026-02-03',400,3,3),
(4,'motor','2026-02-04',500,4,4),
(5,'oleo','2026-02-05',200,5,5),
(6,'freio','2026-02-06',300,6,6),
(7,'pneu','2026-02-07',400,7,7),
(8,'motor','2026-02-08',500,8,8),
(9,'oleo','2026-02-09',200,9,9),
(10,'freio','2026-02-10',300,10,10),
(11,'pneu','2026-02-11',400,11,11),
(12,'motor','2026-02-12',500,12,12),
(13,'oleo','2026-02-13',200,13,13),
(14,'freio','2026-02-14',300,14,14),
(15,'pneu','2026-02-15',400,15,15);

UPDATE veiculo SET status = 'alugado' WHERE id_veiculo = 1;
UPDATE pagamento SET status = 'concluido' WHERE id_pagamento = 1;

SELECT * FROM cliente;
SELECT * FROM veiculo;

SELECT COUNT(*) FROM cliente;
SELECT AVG(valor_diaria) FROM veiculo;

SELECT cliente.nome, aluguel.valor_total
FROM cliente
JOIN aluguel ON cliente.id_cliente = aluguel.id_cliente;

SELECT veiculo.modelo, item_aluguel.quantidade_dias
FROM veiculo
JOIN item_aluguel ON veiculo.id_veiculo = item_aluguel.id_veiculo;

SELECT aluguel.id_aluguel, pagamento.valor
FROM aluguel
LEFT JOIN pagamento ON aluguel.id_aluguel = pagamento.id_aluguel;