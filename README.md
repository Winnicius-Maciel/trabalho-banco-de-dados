```mermaid
erDiagram
    PACIENTE ||--o{ MEDICO : "consulta"
    MEDICO ||--o{ ORDEM : "prescreve"
    ORDEM ||--o{ FORMULA : "utiliza"
    FORMULA ||--o{ MATERIA_PRIMA : "utiliza"
    MATERIA_PRIMA ||--o{ LOTE : "possui"

    PACIENTE {
        varchar cpf PK
        date nascimento
        varchar telefone
        varchar endereco
        varchar alergias
    }

    MEDICO {
        int id_medico PK
        varchar nome
        varchar crm UK
        varchar especialidade
        varchar telefone
    }

    ORDEM {
        int id_ordem PK
        varchar receita
        date entrega
        varchar forma
        varchar producao
    }

    FORMULA {
        id_formula int PK
        varchar receita
        varchar uso
        varchar imagem
    }

    MATERIA_PRIMA {
        int id_materia_prima PK
        varchar nome_quimico
        varchar nome_comercial
        decimal quantidade
        varchar composicao
    }

    LOTE {
        int id_lote PK
        date fabricacao
        date validade
        decimal quantidade
    }
