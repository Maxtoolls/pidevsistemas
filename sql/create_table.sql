-- ===============================================
-- CRIAÇÃO DAS TABELAS DO SISTEMA DE CADASTRO
-- ===============================================

CREATE DATABASE IF NOT EXISTS sistema_cadastros;
USE sistema_cadastros;

-- ======================
-- TABELA BASE: PESSOA
-- ======================
CREATE TABLE Pessoa (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(150),
    telefone VARCHAR(20),
    email VARCHAR(100)
);

-- ======================
-- PESSOA FÍSICA
-- ======================
CREATE TABLE PessoaFisica (
    id INT PRIMARY KEY,
    cpf CHAR(11) UNIQUE NOT NULL,
    data_nascimento DATE,
    FOREIGN KEY (id) REFERENCES Pessoa(id)
);

-- ======================
-- PESSOA JURÍDICA
-- ======================
CREATE TABLE PessoaJuridica (
    id INT PRIMARY KEY,
    cnpj CHAR(14) UNIQUE NOT NULL,
    razao_social VARCHAR(100) NOT NULL,
    FOREIGN KEY (id) REFERENCES Pessoa(id)
);

-- ======================
-- PROFESSOR (herda de PessoaFisica)
-- ======================
CREATE TABLE Professor (
    id INT PRIMARY KEY,
    departamento VARCHAR(100),
    titulacao ENUM('Graduação', 'Mestrado', 'Doutorado'),
    matricula_funcional VARCHAR(20) UNIQUE NOT NULL,
    FOREIGN KEY (id) REFERENCES PessoaFisica(id)
);

-- ======================
-- ALUNO (herda de PessoaFisica)
-- ======================
CREATE TABLE Aluno (
    id INT PRIMARY KEY,
    curso VARCHAR(100) NOT NULL,
    ano_ingresso YEAR,
    modalidade ENUM('Presencial', 'Online'),
    FOREIGN KEY (id) REFERENCES PessoaFisica(id)
);

-- ======================
-- FORNECEDOR (herda de PessoaJuridica)
-- ======================
CREATE TABLE Fornecedor (
    id INT PRIMARY KEY,
    tipo_servico VARCHAR(100),
    status ENUM('Pendente', 'Aprovado') DEFAULT 'Pendente',
    FOREIGN KEY (id) REFERENCES PessoaJuridica(id)
);
