-- Tabela de Níveis de Fidelidade
CREATE TABLE nivel_fidelidade (
    id_nivel SERIAL PRIMARY KEY,
    nome_nivel VARCHAR(50) NOT NULL,
    pontos_minimos INT NOT NULL,
    beneficio_descricao TEXT
);

-- Tabela de Fidelidade do Paciente
CREATE TABLE programa_fidelidade (
    id_fidelidade SERIAL PRIMARY KEY,
    id_paciente INT REFERENCES paciente(id_paciente) ON DELETE CASCADE,
    pontos_totais INT DEFAULT 0,
    id_nivel INT REFERENCES nivel_fidelidade(id_nivel) DEFAULT 1,
    atualizado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de Conquistas / Badges
CREATE TABLE conquistas (
    id_conquista SERIAL PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    descricao TEXT,
    icone_url VARCHAR(255)
);

-- Tabela Associativa: Paciente x Conquistas
CREATE TABLE paciente_conquista (
    id_paciente INT REFERENCES paciente(id_paciente) ON DELETE CASCADE,
    id_conquista INT REFERENCES conquistas(id_conquista) ON DELETE CASCADE,
    data_conquista TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id_paciente, id_conquista)
);
