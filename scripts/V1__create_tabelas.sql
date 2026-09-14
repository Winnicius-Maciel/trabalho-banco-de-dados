CREATE TABLE IF NOT EXISTS paciente (
    cpf VARCHAR(14) PRIMARY KEY,
    nascimento DATE,
    telefone VARCHAR(15),
    endereco VARCHAR(100),
    alergias VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS medico (
    id_medico INT PRIMARY KEY,
    nome VARCHAR(100),
    crm VARCHAR(20) UNIQUE,
    especialidade VARCHAR(50),
    telefone VARCHAR(15)
);

CREATE TABLE IF NOT EXISTS ordem (
    id_ordem INT PRIMARY KEY,
    receita VARCHAR(100),
    entrega DATE,
    forma VARCHAR(50),
    producao VARCHAR(50),
    id_medico INT,
    FOREIGN KEY (id_medico) REFERENCES medico(id_medico)
);

CREATE TABLE IF NOT EXISTS formula (
    id_formula INT PRIMARY KEY,
    receita VARCHAR(100),
    uso VARCHAR(100),
    imagem VARCHAR(100),
    id_ordem INT,
    FOREIGN KEY (id_ordem) REFERENCES ordem(id_ordem)
);

CREATE TABLE IF NOT EXISTS materia_prima (
    id_materia_prima INT PRIMARY KEY,
    nome_quimico VARCHAR(100),
    nome_comercial VARCHAR(100),
    quantidade DECIMAL(10,2),
    composicao VARCHAR(100),
    id_formula INT,
    FOREIGN KEY (id_formula) REFERENCES formula(id_formula)
);

CREATE TABLE IF NOT EXISTS lote (
    id_lote INT PRIMARY KEY,
    fabricacao DATE,
    validade DATE,
    quantidade DECIMAL(10,2),
    id_materia_prima INT,
    FOREIGN KEY (id_materia_prima) REFERENCES materia_prima(id_materia_prima)
);
