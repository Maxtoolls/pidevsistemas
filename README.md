# pidevsistemas
# Projeto: Modelo de Gestão de Cadastros

Este projeto documenta o design de um modelo de dados (via UML) e a implementação parcial de um banco de dados (via SQL) para um sistema de gestão. O sistema é projetado para gerenciar o cadastro de diferentes tipos de entidades: **Alunos**, **Professores** e **Fornecedores**.

## 1. Modelo de Dados (Diagrama UML)

O design do sistema é baseado no diagrama de classes UML fornecido, que estabelece uma hierarquia de herança clara.


### 🏛️ Arquitetura do Diagrama

A estrutura principal é dividida em pessoas físicas e jurídicas, ambas herdando de uma classe base `Pessoa`.

* **`Pessoa` (Classe Base):** Contém atributos comuns a todas as entidades, como `id`, `nome`, `endereco`, `telefone` e `email`.
* **`PessoaFisica`:** Herda de `Pessoa` e adiciona atributos específicos de indivíduos, como `cpf` e `dataNascimento`.
    * **`Professor`:** Herda de `PessoaFisica`.
    * **`Aluno`:** Herda de `PessoaFisica`.
* **`PessoaJuridica`:** Herda de `Pessoa` e adiciona atributos de empresas, como `cnpj`, `inscricaoEstadual` e `razaoSocial`.
    * **`Fornecedor`:** Herda de `PessoaJuridica`.

### 🧩 Interface `IPessoaCadastro`

A interface `IPessoaCadastro` sugere a necessidade de métodos de validação (`validarCPF()`, `validarCNPJ()`), que são implementados pelas classes finais (`Professor`, `Aluno`, `Fornecedor`).

---

## 2. Implementação do Banco de Dados (SQL)

Os scripts SQL fornecidos implementam todo o escopo do projeto (Cadastro de fornecedores, Alunos, Professores, Pessoa Física e Jurídica) e queries pertinentes para inserções e consultas.



## 3. 🤖 Prototipagem 

Toda a funcionalidade do sistema foi prototipada para simular toda a funcionalidade de cada tela, suas tratativas de erro e de sucesso.

Protótipos disponíveis no [Miro](https://miro.com/welcomeonboard/OVNON01MS3NIU2daY2dNZkQvSElwUjU2OUJsamhacWhRZTEyQWduVXRVYWdNa3V1RGhOdjVkcVZxZGhkdEdUZDdDOVE1QnhpTnVEMnVmcW5EcjRiTzQ2dGgrV0NZSG5FUks5VkRpZnRQZy9vWm1kT3dWNm42dEovYXJNRUpKMTZBd044SHFHaVlWYWk0d3NxeHNmeG9BPT0hdjE=?share_link_id=842368126642)
