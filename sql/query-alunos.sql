-- arquivo: escola_alunos.sql

SET @OLD_SQL_MODE = @@sql_mode;
SET sql_mode = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION';

CREATE DATABASE IF NOT EXISTS escola CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE escola;

DROP PROCEDURE IF EXISTS cadastrar_aluno;
DROP FUNCTION IF EXISTS cpf_valido;
DROP TABLE IF EXISTS alunos;

CREATE TABLE IF NOT EXISTS alunos (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  nome_completo VARCHAR(200) NOT NULL,
  cpf CHAR(11) NOT NULL,
  matricula VARCHAR(50) NOT NULL,
  curso VARCHAR(100) NOT NULL,
  turma VARCHAR(50),
  data_nascimento DATE NOT NULL,
  criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY ux_alunos_cpf (cpf)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DELIMITER $$
CREATE FUNCTION cpf_valido(p_cpf TEXT) RETURNS TINYINT
DETERMINISTIC
BEGIN
  DECLARE s CHAR(11);
  DECLARE i INT;
  DECLARE soma INT;
  DECLARE resto INT;
  DECLARE dig1 INT;
  DECLARE dig2 INT;

  SET s = REGEXP_REPLACE(COALESCE(p_cpf, ''), '[^0-9]', '');
  IF CHAR_LENGTH(s) <> 11 THEN
    RETURN 0;
  END IF;

  IF s REGEXP '^(0{11}|1{11}|2{11}|3{11}|4{11}|5{11}|6{11}|7{11}|8{11}|9{11})$' THEN
    RETURN 0;
  END IF;

  SET soma = 0;
  SET i = 1;
  WHILE i <= 9 DO
    SET soma = soma + ( (10 - i) * CAST(SUBSTRING(s, i, 1) AS UNSIGNED) );
    SET i = i + 1;
  END WHILE;
  SET resto = (soma * 10) % 11;
  IF resto = 10 THEN SET resto = 0; END IF;
  SET dig1 = resto;

  SET soma = 0;
  SET i = 1;
  WHILE i <= 10 DO
    SET soma = soma + ( (11 - i) * CAST(SUBSTRING(s, i, 1) AS UNSIGNED) );
    SET i = i + 1;
  END WHILE;
  SET resto = (soma * 10) % 11;
  IF resto = 10 THEN SET resto = 0; END IF;
  SET dig2 = resto;

  IF dig1 = CAST(SUBSTRING(s, 10, 1) AS UNSIGNED) AND dig2 = CAST(SUBSTRING(s, 11, 1) AS UNSIGNED) THEN
    RETURN 1;
  ELSE
    RETURN 0;
  END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE cadastrar_aluno(
  IN p_nome_completo TEXT,
  IN p_cpf TEXT,
  IN p_matricula TEXT,
  IN p_curso TEXT,
  IN p_turma TEXT,
  IN p_data_nascimento DATE,
  OUT p_status VARCHAR(20)
)
BEGIN
  proc_body: BEGIN
    DECLARE s_cpf CHAR(11);


    IF p_nome_completo IS NULL OR TRIM(p_nome_completo) = '' OR
       p_cpf IS NULL OR TRIM(p_cpf) = '' OR
       p_matricula IS NULL OR TRIM(p_matricula) = '' OR
       p_curso IS NULL OR TRIM(p_curso) = '' OR
       p_data_nascimento IS NULL THEN
      SET p_status = 'MISSING_DATA';
      LEAVE proc_body;
    END IF;

    
    SET s_cpf = REGEXP_REPLACE(p_cpf, '[^0-9]', '');
    IF CHAR_LENGTH(s_cpf) <> 11 OR cpf_valido(s_cpf) = 0 THEN
      SET p_status = 'INVALID_CPF';
      LEAVE proc_body;
    END IF;

   
    IF EXISTS (SELECT 1 FROM alunos WHERE cpf = s_cpf) THEN
      SET p_status = 'ALREADY_EXISTS';
      LEAVE proc_body;
    END IF;

    INSERT INTO alunos (nome_completo, cpf, matricula, curso, turma, data_nascimento)
    VALUES (p_nome_completo, s_cpf, p_matricula, p_curso, p_turma, p_data_nascimento);

    SET p_status = 'SUCCESS';
  END proc_body;
EXCEPTION
  WHEN SQLEXCEPTION THEN
    SET p_status = 'ERROR';
END$$
DELIMITER ;

