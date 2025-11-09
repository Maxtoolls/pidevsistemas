-- ===============================================
-- INSERÇÕES -- Pessoa
-- ===============================================
INSERT INTO Pessoa (nome, endereco, telefone, email)
VALUES ('Alex Aires', 'Rua das Flores, 123', '51999999999', 'ex_aires@hotmail.com');


-- ===============================================
-- INSERÇÕES -- Pessoa Física
-- ===============================================
INSERT INTO PessoaFisica (id, cpf, data_nascimento)
VALUES (LAST_INSERT_ID(), '12345678901', '1990-05-10');

-- ===============================================
-- CONSULTA
-- ===============================================

-- Listar todas as pessoas físicas com CPF
SELECT p.id, p.nome, pf.cpf, pf.data_nascimento
FROM Pessoa p
JOIN PessoaFisica pf ON p.id = pf.id;

-- ===============================================
-- ATUALIZAÇÕES E REMOÇÕES
-- ===============================================

-- Atualizar telefone de uma pessoa
UPDATE Pessoa SET telefone = '51944443333' WHERE id = 1;

-- Excluir aluno (e suas referências)
DELETE FROM PessoaFisica WHERE id = 4;
DELETE FROM Pessoa WHERE id = 4;
