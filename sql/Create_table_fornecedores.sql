-- Criar a extensão para gerar UUIDs
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- 1. Criar um tipo ENUM para o status de aprovação
-- (Baseado no atributo statusAprovacao: StatusFornecedor)
CREATE TYPE status_fornecedor AS ENUM (
    'Pendente',
    'Aprovado',
    'Rejeitado'
);

-- 2. Tabela principal de Fornecedores
-- Esta tabela combina os atributos de Pessoa, PessoaJuridica e Fornecedor
CREATE TABLE Fornecedores (
    -- Atributos da classe Pessoa
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(), -- 'id: UUID'
    nome_fantasia VARCHAR(255),                     -- 'nome: String' (interpretado como Nome Fantasia)
    endereco TEXT,                                  -- 'endereco: String'
    telefone VARCHAR(20),                           -- 'telefone: String'
    email VARCHAR(255) UNIQUE,                      -- 'email: String'

    -- Atributos da classe PessoaJuridica
    cnpj VARCHAR(18) NOT NULL UNIQUE,               -- 'cnpj: String' (18 chars para 'XX.XXX.XXX/XXXX-XX')
    inscricao_estadual VARCHAR(20),                 -- 'inscricaoEstadual: String'
    razao_social VARCHAR(255) NOT NULL,             -- 'razaoSocial: String'

    -- Atributos da classe Fornecedor
    tipo_servico VARCHAR(100),                      -- 'tipoServico: String'
    status_aprovacao status_fornecedor NOT NULL DEFAULT 'Pendente' -- 'statusAprovacao: StatusFornecedor'
);

-- 3. Tabela de Documentos
-- Para representar a lista 'documentosAnexados: List<Documento>'
CREATE TABLE Documentos (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    fornecedor_id UUID NOT NULL,
    nome_documento VARCHAR(255) NOT NULL,
    tipo_documento VARCHAR(50), -- Ex: Contrato Social, Alvará
    url_anexo TEXT NOT NULL,      -- Caminho/URL do arquivo
    data_upload TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,

    -- Chave estrangeira ligando o documento ao fornecedor
    CONSTRAINT fk_fornecedor
        FOREIGN KEY (fornecedor_id)
        REFERENCES Fornecedores(id)
        ON DELETE CASCADE -- Se o fornecedor for excluído, seus documentos também serão.
);

-- Criar índices para otimizar consultas comuns
CREATE INDEX idx_fornecedores_cnpj ON Fornecedores(cnpj);
CREATE INDEX idx_documentos_fornecedor_id ON Documentos(fornecedor_id);
