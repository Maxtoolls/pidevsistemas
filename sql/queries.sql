-- ===============================================
-- INSERÇÕES DE EXEMPLO
-- ===============================================

-- Pessoa Física
INSERT INTO Pessoa (nome, endereco, telefone, email)
VALUES ('João da Silva', 'Rua das Flores, 123', '51999999999', 'joao@email.com');
INSERT INTO PessoaFisica (id, cpf, data_nascimento)
VALUES (LAST_INSERT_ID(), '12345678901', '1990-05-10');

-- Pessoa Jurídica
INSERT INTO Pessoa (nome, endereco, telefone, email)
VALUES ('Empresa ABC Ltda', 'Av. Central, 999', '5133334444', 'contato@abc.com');
INSERT INTO PessoaJuridica (id, cnpj, razao_social)
VALUES (LAST_INSERT_ID(), '12345678000199', 'ABC Comércio de Materiais');

-- Professor
INSERT INTO Pessoa (nome, endereco, telefone, email)
VALUES ('Maria Oliveira', 'Rua das Palmeiras, 77', '51912345678', 'maria@univ.com');
INSERT INTO PessoaFisica (id, cpf, data_nascimento)
VALUES (LAST_INSERT_ID(), '32165498700', '1985-04-12');
INSERT INTO Professor (id, departamento, titulacao, matricula_funcional)
VALUES (LAST_INSERT_ID(), 'Computação', 'Mestrado', 'PROF001');

-- Aluno
INSERT INTO Pessoa (nome, endereco, telefone, email)
VALUES ('Carlos Souza', 'Rua A, 45', '51987654321', 'carlos@aluno.com');
INSERT INTO PessoaFisica (id, cpf, data_nascimento)
VALUES (LAST_INSERT_ID(), '11122233344', '2002-09-01');
INSERT INTO Aluno (id, curso, ano_ingresso, modalidade)
VALUES (LAST_INSERT_ID(), 'ADS', 2025, 'Presencial');

-- Fornecedor
INSERT INTO Pessoa (nome, endereco, telefone, email)
VALUES ('Tech Solutions', 'Av. Inovação, 101', '51988887777', 'contato@techsolutions.com');
INSERT INTO PessoaJuridica (id, cnpj, razao_social)
VALUES (LAST_INSERT_ID(), '98765432000177', 'Tech Solutions Ltda');
INSERT INTO Fornecedor (id, tipo_servico, status)
VALUES (LAST_INSERT_ID(), 'Serviços de TI', 'Pendente');

-- ===============================================
-- CONSULTAS
-- ===============================================

-- Listar todas as pessoas físicas com CPF
SELECT p.id, p.nome, pf.cpf, pf.data_nascimento
FROM Pessoa p
JOIN PessoaFisica pf ON p.id = pf.id;

-- Listar professores com departamento e titulação
SELECT p.nome, pr.departamento, pr.titulacao
FROM Pessoa p
JOIN PessoaFisica pf ON p.id = pf.id
JOIN Professor pr ON pf.id = pr.id;

-- Listar alunos por curso
SELECT p.nome, a.curso, a.ano_ingresso
FROM Pessoa p
JOIN PessoaFisica pf ON p.id = pf.id
JOIN Aluno a ON pf.id = a.id;

-- Listar fornecedores pendentes
SELECT p.nome, pj.razao_social, f.tipo_servico, f.status
FROM Pessoa p
JOIN PessoaJuridica pj ON p.id = pj.id
JOIN Fornecedor f ON pj.id = f.id
WHERE f.status = 'Pendente';

-- ===============================================
-- ATUALIZAÇÕES E REMOÇÕES
-- ===============================================

-- Atualizar telefone de uma pessoa
UPDATE Pessoa SET telefone = '51944443333' WHERE id = 1;

-- Marcar fornecedor como aprovado
UPDATE Fornecedor SET status = 'Aprovado' WHERE id = 5;

-- Excluir aluno (e suas referências)
DELETE FROM Aluno WHERE id = 4;
DELETE FROM PessoaFisica WHERE id = 4;
DELETE FROM Pessoa WHERE id = 4;
