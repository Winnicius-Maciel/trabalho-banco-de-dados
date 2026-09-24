# Projeto: Banco de Dados para Farmácia de Manipulação

## Objetivo Geral
Criar uma estrutura relacional para gerenciar o fluxo de prescrições médicas, conectando os dados dos pacientes aos médicos, e controlando as ordens de manipulação, fórmulas, matérias-primas e seus respectivos lotes.

## Público-Alvo
Farmacêuticos, técnicos de laboratório e atendentes que precisam rastrear a origem da receita até o controle de qualidade do lote utilizado.

## Modelo de Dados (Diagrama ER)

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
        int id_formula PK
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
```mermaid
erDiagram
    PACIENTE ||--o{ PROGRAMA_FIDELIDADE : possui
    NIVEL_FIDELIDADE ||--o{ PROGRAMA_FIDELIDADE : classifica
    PACIENTE ||--o{ PACIENTE_CONQUISTA : desbloqueia
    CONQUISTAS ||--o{ PACIENTE_CONQUISTA : concede

    PACIENTE {
        int id_paciente PK
        string nome
        string cpf
    }

    PROGRAMA_FIDELIDADE {
        int id_fidelidade PK
        int id_paciente FK
        int pontos_totais
        int id_nivel FK
    }

    NIVEL_FIDELIDADE {
        int id_nivel PK
        string nome_nivel
        int pontos_minimos
    }

    CONQUISTAS {
        int id_conquista PK
        string titulo
        string descricao
    }
