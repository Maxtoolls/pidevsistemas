# 🏢 Cadastro de Pessoa Jurídica  
**Autor:** Derek Coutinho da Silva  
**Projeto Integrador II – Desenvolvimento Estruturado de Sistemas**  
**Curso: Tecnologia em Análise e Desenvolvimento de Sistemas – SENAC 2025**

---

### 🧑‍💼 Ator Principal
Funcionário da Secretaria

---

### ⚙️ Pré-condição
O funcionário precisa estar autenticado no sistema para realizar o cadastro.

---

### 🎯 Pós-condição
Após o cadastro, os dados gerais de uma **Pessoa** e os dados específicos de uma **Pessoa Jurídica** ficam registrados na base de dados.

---

### 🔄 Cenário Principal
1. O sistema solicita os **dados comuns à classe Pessoa** (Nome do Contato, Endereço e Contato).  
2. O sistema solicita os **dados específicos da Pessoa Jurídica** (CNPJ e Razão Social).  
3. O funcionário preenche todos os campos obrigatórios.  
4. O sistema executa o método `validarCNPJ()`.  
5. Se o CNPJ for válido, o sistema prossegue.  
6. O sistema salva as informações da nova Pessoa Jurídica no banco de dados.

---

### ⚠️ Cenários Alternativos
- **A1 – CNPJ inválido:**  
  No passo 4, o método `validarCNPJ()` retorna erro.  
  O sistema mostra a mensagem:  
  > “CNPJ inválido. Verifique e tente novamente.”

- **A2 – CNPJ já cadastrado:**  
  O sistema detecta que o CNPJ já existe no banco de dados e exibe:  
  > “CNPJ já cadastrado no sistema.”

---

### 💾 Estrutura de Dados (exemplo)
| Campo | Tipo | Obrigatório | Descrição |
|-------|------|--------------|------------|
| id_pessoa | INT | ✅ | Identificador único |
| nome_contato | VARCHAR(100) | ✅ | Nome do responsável pela empresa |
| endereco | VARCHAR(255) | ✅ | Endereço completo |
| telefone | VARCHAR(20) | ✅ | Telefone de contato |
| email | VARCHAR(100) | ✅ | E-mail comercial |
| cnpj | CHAR(14) | ✅ | Número do CNPJ |
| razao_social | VARCHAR(150) | ✅ | Nome empresarial registrado |

---

### 🧩 Exemplo SQL
**Arquivo:** `sql/create_tables.sql`

```sql
CREATE TABLE pessoa_juridica (
    id_pessoa INT PRIMARY KEY AUTO_INCREMENT,
    nome_contato VARCHAR(100) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100),
    cnpj CHAR(14) UNIQUE NOT NULL,
    razao_social VARCHAR(150) NOT NULL
);


Observações

O sistema deve garantir a unicidade do CNPJ.

O método validarCNPJ() deve seguir as regras oficiais de validação.

O cadastro só é salvo se todos os campos obrigatórios forem preenchidos corretamente.

O funcionário deve ter permissão de acesso para realizar cadastros de pessoas jurídicas.

Em caso de erro, o sistema deve manter os dados já digitados para evitar retrabalho.
 
 Este caso de uso faz parte do projeto integrador desenvolvido pelos alunos do curso de ADS (SENAC).

O objetivo é simular o funcionamento de um cadastro de Pessoa Jurídica dentro de um sistema acadêmico.

O sistema deve validar o CNPJ e garantir que não existam duplicidades.

Caso ocorra erro, o sistema deve manter os dados preenchidos para facilitar a correção.

Todos os cadastros devem ser realizados por um usuário com permissão autenticada.