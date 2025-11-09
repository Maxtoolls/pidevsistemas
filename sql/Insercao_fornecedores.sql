-- Exemplo de inserção de um novo fornecedor

INSERT INTO Fornecedores (
    nome_fantasia,
    endereco,
    telefone,
    email,
    cnpj,
    inscricao_estadual,
    razao_social,
    tipo_servico
) VALUES (
    'LogiTech Soluções',
    'Rua da Tecnologia, 456, Bloco B, Sala 10, São Paulo - SP',
    '(11) 91234-5678',
    'comercial@logitechsolucoes.com',
    '98.765.432/0001-10',
    '111.222.333.444',
    'LogiTech Soluções em Logística S.A.',
    'Desenvolvimento de Software de Roteirização'
);

-- Para inserir os documentos, você primeiro precisa obter o ID do fornecedor.

INSERT INTO Documentos (
    fornecedor_id,
    nome_documento,
    tipo_documento,
    url_anexo
) VALUES
(
    'e1c5a3d0-b2f6-4c8e-a679-54de1a2b3c4d',
    'contrato_social_2024.pdf',
    'Contrato Social',
    's3://bucket-docs/logitech/contrato_social_2024.pdf'
),
(
    'e1c5a3d0-b2f6-4c8e-a679-54de1a2b3c4d',
    'alvara_funcionamento.pdf',
    'Alvará',
    's3://bucket-docs/logitech/alvara_funcionamento.pdf'
);
