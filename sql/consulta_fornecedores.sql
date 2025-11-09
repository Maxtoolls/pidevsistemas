-- 1. Consultar todos os fornecedores (dados principais)
SELECT
    id,
    razao_social,
    nome_fantasia,
    cnpj,
    email,
    status_aprovacao
FROM
    Fornecedores;

-- 2. Consultar um fornecedor específico pelo CNPJ
SELECT *
FROM Fornecedores
WHERE cnpj = '98.765.432/0001-10';

-- 3. Consultar todos os fornecedores pendentes de aprovação
SELECT
    razao_social,
    cnpj,
    tipo_servico,
    email
FROM
    Fornecedores
WHERE
    status_aprovacao = 'Pendente';

-- 4. Consultar um fornecedor e TODOS os seus documentos (usando JOIN)
SELECT
    f.razao_social,
    f.cnpj,
    f.status_aprovacao,
    d.nome_documento,
    d.tipo_documento,
    d.url_anexo,
    d.data_upload
FROM
    Fornecedores AS f
LEFT JOIN
    Documentos AS d ON f.id = d.fornecedor_id
WHERE
    f.cnpj = '98.765.432/0001-10';
