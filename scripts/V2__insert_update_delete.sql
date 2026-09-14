-- 1. INSERINDO DADOS (DML - INSERT)

-- Inserindo paciente
INSERT INTO paciente (
    cpf,
    nascimento,
    telefone,
    endereco,
    alergias
) VALUES (
    '111.111.111-11',
    '1990-05-15',
    '99999-1111',
    'Rua A, 123',
    'Dipirona'
);


-- Inserindo médico
INSERT INTO medico (
    id_medico,
    nome,
    crm,
    especialidade,
    telefone,
    cpf_paciente
) VALUES (
    1,
    'Dr. Roberto',
    'CRM-1234',
    'Dermatologista',
    '99999-2222',
    '111.111.111-11'
);


-- Inserindo ordem
INSERT INTO ordem (
    id_ordem,
    receita,
    entrega,
    forma,
    producao,
    id_medico
) VALUES (
    1,
    'Receita Derma',
    '2023-11-20',
    'Creme',
    'Laboratorio 1',
    1
);


-- Inserindo fórmula
INSERT INTO formula (
    id_formula,
    receita,
    uso,
    imagem,
    id_ordem
) VALUES (
    1,
    'Receita Derma',
    'Uso Tópico Noturno',
    'img_creme.jpg',
    1
);


-- Inserindo matéria-prima
INSERT INTO materia_prima (
    id_materia_prima,
    nome_cientifico,
    nome_comercial,
    quantidade,
    composicao,
    id_formula
) VALUES (
    1,
    'Acidum salicylicum',
    'Ácido Salicílico',
    50.50,
    'Puro',
    1
);


-- Inserindo lotes da matéria-prima
INSERT INTO lote (
    id_lote,
    fabricacao,
    validade,
    quantidade,
    id_materia_prima
) VALUES
(
    1,
    '2023-10-01',
    '2025-10-01',
    500.00,
    1
),
(
    2,
    '2023-10-05',
    '2025-10-05',
    200.00,
    1
);


-- 2. ATUALIZANDO DADOS (DML - UPDATE)

-- Atualizando a quantidade disponível da matéria-prima
UPDATE materia_prima
SET quantidade = 45.00
WHERE id_materia_prima = 1;


-- 3. DELETANDO DADOS (DML - DELETE)

-- Excluindo o lote utilizado apenas para teste
DELETE FROM lote
WHERE id_lote = 2
  AND id_materia_prima = 1;
