-- ===============================================
-- INSERÇÕES E CONSULTAS PARA O MÓDULO PROFESSOR
-- Herança: Pessoa -> PessoaFisica -> Professor
-- ===============================================

-- -----------------------------------------------
-- 1. INSERÇÃO DE PROFESSOR (3 PASSOS)
-- *Valores de Matrícula, Titulação e Departamento alinhados ao protótipo e tabelas.*
-- -----------------------------------------------

-- 1.1. INSERT na Pessoa (Dados Comuns)
INSERT INTO Pessoa (nome, endereco, telefone, email)
VALUES ('Prof. Thiago Alves', 'Av. Paulista, 0001 - Bela Vista', '119552514011', 'thiago.alves@professor.com');

-- 1.2. INSERT na PessoaFisica (CPF e Data de Nascimento - Coluna: data_nascimento)
INSERT INTO PessoaFisica (id, cpf, data_nascimento)
VALUES (LAST_INSERT_ID(), '35333039841', '1988-09-23');

-- 1.3. INSERT no Professor (Alinhado aos campos do Protótipo: matricula_funcional, titulacao, departamento)
INSERT INTO Professor (id, departamento, titulacao, matricula_funcional)
VALUES (LAST_INSERT_ID(), 'Desenvolvimento de Sistemas', 'Mestrado', 'PRF-2025-001');

-- -----------------------------------------------
-- 2. CONSULTAS (SELECTS)
-- -----------------------------------------------

-- 2.1. Listar dados completos do Professor (usando os nomes exatos das colunas: matricula_funcional, titulacao, departamento)
SELECT
    p.nome AS NomeProfessor,
    pf.cpf,
    pr.matricula_funcional,
    pr.departamento,
    pr.titulacao
FROM
    Professor pr
JOIN
    PessoaFisica pf ON pr.id = pf.id
JOIN
    Pessoa p ON pf.id = p.id;

-- -----------------------------------------------
-- 3. VALIDAÇÕES DE FLUXOS ALTERNATIVOS (Simulação de Erros)
-- *Cobrindo a lógica dos Quadros 8 e 9 (Matrícula já Cadastrada e Dados Ausentes)*
-- -----------------------------------------------

-- 3.1. Simulação de checagem para erro "Matrícula já Cadastrada" (Quadro 8)
SELECT
    matricula_funcional
FROM
    Professor
WHERE
    matricula_funcional = 'PRF-2025-001'; -- Se existir, o sistema impede o INSERT e exibe o erro.

-- 3.2. Simulação de checagem para erro "CPF já Cadastrado" (Vindo da inclusão de Pessoa Física)
SELECT
    cpf
FROM
    PessoaFisica
WHERE
    cpf = '35333039841'; -- Se existir, o sistema impede a inserção de uma nova PF.