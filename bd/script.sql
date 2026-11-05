CREATE DATABASE IF NOT EXISTS db_gym_list
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_0900_ai_ci;
USE db_gym_list;

CREATE TABLE frequentador (
    id_frequentador INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(120) NOT NULL,
    cpf CHAR(11) NOT NULL UNIQUE,
    contato VARCHAR(120) NOT NULL,
    data_nascimento DATE NOT NULL,
    foto VARCHAR(500),
    ativo BOOLEAN NOT NULL DEFAULT TRUE,
    CONSTRAINT ck_frequentador_cpf
            CHECK (cpf REGEXP '^[0-9]{11}$')
) ENGINE=InnoDB;

CREATE TABLE plano (
    id_plano INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    duracao_meses INT NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    ativo BOOLEAN NOT NULL DEFAULT TRUE,
    CONSTRAINT ck_plano_duracao
            CHECK (duracao_meses > 0),
    CONSTRAINT ck_plano_valor
            CHECK (valor > 0)
) ENGINE=InnoDB;

CREATE TABLE funcionario (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(120) NOT NULL,
    cpf CHAR(11) NOT NULL UNIQUE,
    cargo VARCHAR(60) NOT NULL,
    especialidade VARCHAR(120),
    senha_hash VARCHAR(255) NOT NULL,
    CONSTRAINT ck_funcionario_cpf
            CHECK (cpf REGEXP '^[0-9]{11}$')
) ENGINE=InnoDB;

CREATE TABLE exercicio (
    id_exercicio INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(120) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE matricula (
    id_matricula INT AUTO_INCREMENT PRIMARY KEY,
    id_frequentador INT NOT NULL,
    id_plano INT NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,
    status ENUM('ativa','vencida','trancada','cancelada') NOT NULL,
-- UNIQUE permite multiplos NULL, mas somente um id por frequentador ativo (RN03).
    id_ativo INT GENERATED ALWAYS AS (CASE WHEN status='ativa' THEN id_frequentador ELSE NULL END) STORED,
    UNIQUE KEY uq_matricula_ativa (id_ativo),
    CONSTRAINT fk_matricula_frequentador
            FOREIGN KEY (id_frequentador)
            REFERENCES frequentador(id_frequentador)
            ON DELETE RESTRICT,
    CONSTRAINT fk_matricula_plano
            FOREIGN KEY (id_plano)
            REFERENCES plano(id_plano)
            ON DELETE RESTRICT,
    CONSTRAINT ck_matricula_datas
            CHECK (data_fim >= data_inicio)
) ENGINE=InnoDB;

CREATE TABLE pagamento (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    id_matricula INT NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    data_vencimento DATE NOT NULL,
    data_pagamento DATE NULL,
    forma_pagamento VARCHAR(60) NULL,
    status ENUM('pendente','pago','atrasado') NOT NULL,
    CONSTRAINT fk_pagamento_matricula
            FOREIGN KEY (id_matricula)
            REFERENCES matricula(id_matricula)
            ON DELETE RESTRICT,
    CONSTRAINT ck_pagamento_valor
            CHECK (valor > 0),
    CONSTRAINT ck_pagamento_pago
            CHECK (status <> 'pago' OR data_pagamento IS NOT NULL)
) ENGINE=InnoDB;

CREATE TABLE ficha_treino (
    id_ficha INT AUTO_INCREMENT PRIMARY KEY,
    id_frequentador INT NOT NULL,
    id_funcionario INT NOT NULL,
    objetivo VARCHAR(255) NOT NULL,
    data_criacao DATE NOT NULL,
    data_revisao DATE NULL,
    CONSTRAINT fk_ficha_frequentador
            FOREIGN KEY (id_frequentador)
            REFERENCES frequentador(id_frequentador)
            ON DELETE RESTRICT,
    CONSTRAINT fk_ficha_funcionario
            FOREIGN KEY (id_funcionario)
            REFERENCES funcionario(id_funcionario)
            ON DELETE RESTRICT,
    CONSTRAINT ck_ficha_datas
            CHECK (data_revisao IS NULL OR data_revisao >= data_criacao)
) ENGINE=InnoDB;

CREATE TABLE ficha_exercicio (
    id_ficha INT NOT NULL,
    id_exercicio INT NOT NULL,
    series INT NOT NULL,
    repeticoes INT NOT NULL,
    carga DECIMAL(8,2) NULL,
    ordem INT NOT NULL,
    PRIMARY KEY (id_ficha, id_exercicio),
    UNIQUE KEY uq_ficha_ordem (id_ficha, ordem),
    CONSTRAINT fk_fe_ficha
            FOREIGN KEY (id_ficha)
            REFERENCES ficha_treino(id_ficha)
            ON DELETE RESTRICT,
    CONSTRAINT fk_fe_exercicio
            FOREIGN KEY (id_exercicio)
            REFERENCES exercicio(id_exercicio)
            ON DELETE RESTRICT,
    CONSTRAINT ck_fe_series
            CHECK (series > 0),
    CONSTRAINT ck_fe_repeticoes
            CHECK (repeticoes > 0),
    CONSTRAINT ck_fe_carga
            CHECK (carga IS NULL OR carga >= 0),
    CONSTRAINT ck_fe_ordem
            CHECK (ordem > 0)
) ENGINE=InnoDB;

CREATE TABLE avaliacao_fisica (
    id_avaliacao INT AUTO_INCREMENT PRIMARY KEY,
    id_frequentador INT NOT NULL,
    id_funcionario INT NOT NULL,
    data_avaliacao DATE NOT NULL,
    peso DECIMAL(6,2) NOT NULL,
    altura DECIMAL(4,2) NOT NULL,
    percentual_gordura DECIMAL(5,2) NOT NULL,
    observacoes_medicas TEXT NULL,
    CONSTRAINT fk_avaliacao_frequentador
            FOREIGN KEY (id_frequentador)
            REFERENCES frequentador(id_frequentador)
            ON DELETE RESTRICT,
    CONSTRAINT fk_avaliacao_funcionario
            FOREIGN KEY (id_funcionario)
            REFERENCES funcionario(id_funcionario)
            ON DELETE RESTRICT,
    CONSTRAINT ck_avaliacao_peso
            CHECK (peso > 0),
    CONSTRAINT ck_avaliacao_altura
            CHECK (altura > 0),
    CONSTRAINT ck_avaliacao_gordura
            CHECK (percentual_gordura BETWEEN 0 AND 100)
) ENGINE=InnoDB;

-- RN12: apenas cargo instrutor elabora ficha. O README usa cargo de instrutor.
DELIMITER $$
CREATE TRIGGER bi_ficha_instrutor
BEFORE INSERT
ON ficha_treino
FOR EACH ROW
BEGIN
    IF NOT EXISTS (
            SELECT 1
            FROM funcionario
            WHERE id_funcionario = NEW.id_funcionario
              AND cargo = 'instrutor'
        ) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='RN12: ficha exige funcionario com cargo instrutor';
    END IF;
END$$
CREATE TRIGGER bu_ficha_instrutor
BEFORE UPDATE
ON ficha_treino
FOR EACH ROW
BEGIN
    IF NOT EXISTS (
            SELECT 1
            FROM funcionario
            WHERE id_funcionario = NEW.id_funcionario
              AND cargo = 'instrutor'
        ) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='RN12: ficha exige funcionario com cargo instrutor';
    END IF;
END$$
-- RN16: historico imutavel de avaliacoes.
CREATE TRIGGER bu_avaliacao_historico
BEFORE UPDATE
ON avaliacao_fisica
FOR EACH ROW
BEGIN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='RN16: registre nova avaliacao em vez de alterar historico';
END$$
CREATE TRIGGER bd_avaliacao_historico
BEFORE DELETE
ON avaliacao_fisica
FOR EACH ROW
BEGIN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='RN16: historico de avaliacoes nao pode ser excluido';
END$$
-- RN11: impedir exclusao de plano utilizado (tambem protegido pela FK).
-- RN18: exclusao de frequentador com historico impedida por FKs; inativar via UPDATE.
DELIMITER ;

-- CONSULTAS COM JOIN (RF05, RF12)
-- J01: historico de matriculas e planos
SELECT
    f.id_frequentador,
    f.nome,
    p.nome AS plano,
    m.data_inicio,
    m.data_fim,
    m.status
FROM frequentador f
JOIN matricula m ON m.id_frequentador=f.id_frequentador
JOIN plano p ON p.id_plano=m.id_plano;
-- J02: fichas e exercicios
SELECT
    f.nome AS frequentador,
    ft.id_ficha,
    e.nome AS exercicio,
    fe.series,
    fe.repeticoes,
    fe.carga,
    fe.ordem
FROM ficha_treino ft
JOIN frequentador f ON f.id_frequentador=ft.id_frequentador
JOIN ficha_exercicio fe ON fe.id_ficha=ft.id_ficha
JOIN exercicio e ON e.id_exercicio=fe.id_exercicio;

-- OPERACOES UPDATE / DELETE: exemplos parametrizados, nao executados sem registros.
-- UPDATE frequentador SET ativo=FALSE WHERE id_frequentador=?; -- RN18
-- UPDATE matricula SET status='cancelada' WHERE id_matricula=?;
-- DELETE FROM exercicio WHERE id_exercicio=?; -- apenas se nao referenciado

-- GERENCIAIS
-- G01: Quais frequentadores possuem cobrancas em atraso? Atende: RF05, RN09.
SELECT
    f.id_frequentador,
    f.nome,
    pg.id_pagamento,
    pg.data_vencimento,
    pg.valor
FROM pagamento pg
JOIN matricula m ON m.id_matricula=pg.id_matricula
JOIN frequentador f ON f.id_frequentador=m.id_frequentador
WHERE pg.status='atrasado'
    OR (pg.status='pendente'
    AND pg.data_vencimento<CURDATE());
-- G02: Quais matriculas vencem nos proximos 30 dias? Atende: RF05.
-- 30 dias e parametro de consulta demonstrativo, nao prazo estabelecido pela academia.
SELECT
    f.nome,
    m.id_matricula,
    m.data_fim,
    p.nome AS plano
FROM matricula m
JOIN frequentador f ON f.id_frequentador=m.id_frequentador
JOIN plano p ON p.id_plano=m.id_plano
WHERE m.status='ativa'
    AND m.data_fim BETWEEN CURDATE()
    AND DATE_ADD(CURDATE(),INTERVAL 30 DAY);
-- G03: Qual o valor recebido por mes? Atende: controle financeiro RF04.
SELECT
    DATE_FORMAT(data_pagamento, '%Y-%m') AS mes,
    COUNT(*) AS pagamentos,
    SUM(valor) AS total_recebido
FROM pagamento
WHERE status='pago' AND data_pagamento IS NOT NULL
GROUP BY DATE_FORMAT(data_pagamento,'%Y-%m')
ORDER BY mes;
-- G04: Quantas avaliacoes foram realizadas por mes? Atende: RF11/RF12.
SELECT
    DATE_FORMAT(data_avaliacao, '%Y-%m') AS mes,
    COUNT(*) AS total_avaliacoes
FROM avaliacao_fisica
GROUP BY DATE_FORMAT(data_avaliacao,'%Y-%m')
ORDER BY mes;
-- G05: Quantas fichas foram criadas por mes? Atende: RF09/RF12.
SELECT
    DATE_FORMAT(data_criacao, '%Y-%m') AS mes,
    COUNT(*) AS total_fichas
FROM ficha_treino
GROUP BY DATE_FORMAT(data_criacao,'%Y-%m')
ORDER BY mes;

-- AUDITORIA
-- A01: Existe matricula ativa com data final passada? Verifica: RN06.
SELECT
    id_matricula,
    id_frequentador,
    data_fim FROM matricula
WHERE status='ativa' AND data_fim<CURDATE();
-- A02: Existe pagamento pendente vencido? Verifica: RN09.
SELECT
    id_pagamento,
    id_matricula,
    data_vencimento FROM pagamento
WHERE status='pendente' AND data_vencimento<CURDATE();
-- A03: Existe ficha sem exercicios? Verifica: RN14.
SELECT
    ft.id_ficha FROM ficha_treino ft
LEFT JOIN ficha_exercicio fe ON fe.id_ficha=ft.id_ficha
GROUP BY ft.id_ficha
HAVING COUNT(fe.id_exercicio)=0;
-- A04: Existe pagamento marcado como pago sem data? Verifica: RN08.
SELECT
    id_pagamento FROM pagamento
WHERE status='pago' AND data_pagamento IS NULL;
-- A05: Existe ficha atribuida a funcionario nao instrutor? Verifica: RN12.
SELECT
    ft.id_ficha,
    fu.cargo FROM ficha_treino ft
JOIN funcionario fu ON fu.id_funcionario=ft.id_funcionario
WHERE fu.cargo<>'instrutor';
