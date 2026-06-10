# Banco de Dados II

Repositório contendo projetos, atividades práticas e estudos desenvolvidos durante a disciplina de **Banco de Dados II**, abordando desde modelagem relacional até recursos avançados do PostgreSQL.

## Integrantes

* [Daniel Teles de Oliveira](https://github.com/DanielTelesdeOliveira)
* [João Victor Torres Soares](https://github.com/JTSoares)
* [Pedro Gabriel Takenobu Serafim](https://github.com/pedrogts)
* [Rubens Rodrigues Maranesi](https://github.com/Rubziguin)


---

# Sumário

* [Visão Geral](#visão-geral)
* [Projeto 1 - E-commerce](#projeto-1---e-commerce)
* [Projeto 2 - Stored Procedures](#projeto-2---stored-procedures)
* [Projeto 3 - PostgreSQL Tecnologias Avançadas](#projeto-3---postgresql-tecnologias-avançadas)
* [Tecnologias Utilizadas](#tecnologias-utilizadas)
* [Como Executar os Projetos](#como-executar-os-projetos)
* [Objetivos de Aprendizagem](#objetivos-de-aprendizagem)

---

# Visão Geral

Este repositório reúne atividades desenvolvidas na disciplina de Banco de Dados II, explorando conceitos fundamentais e avançados de bancos de dados relacionais.

Os projetos abrangem:

* Modelagem conceitual, lógica e física de bancos de dados;
* Desenvolvimento de scripts SQL;
* Stored Procedures;
* Manipulação de dados semiestruturados com JSONB;
* Full-Text Search (FTS);
* Retrieval-Augmented Generation (RAG) com pgvector;
* Dados geoespaciais utilizando PostGIS.

---


# Projeto 1 - E-commerce

Projeto acadêmico de modelagem completa de um sistema de comércio eletrônico.

## Conteúdo

* Modelo Conceitual
* Modelo Lógico
* Modelo Físico
* Diagrama de Fluxo de Dados (DFD)
* Modelo Entidade-Relacionamento (MER)
* Scripts SQL de criação e carga do banco

## Principais Entidades

* Clientes
* Produtos
* Pedidos
* Pagamentos
* Categorias

---

# Projeto 2 - Stored Procedures

Atividade voltada para o desenvolvimento e utilização de procedimentos armazenados em banco de dados.

## Tópicos Abordados

* Stored Procedures
* Controle de Fluxo
* Manipulação de Dados
* Automação de Operações
* Reutilização de Regras de Negócio

---

# Projeto 3 - PostgreSQL Tecnologias Avançadas

Conjunto de atividades práticas explorando funcionalidades avançadas do PostgreSQL.

## Atividade 1 - JSONB

Manipulação de dados semiestruturados utilizando o tipo JSONB.

### Conceitos

* Armazenamento de documentos JSON
* Operadores JSONB
* Consultas em estruturas aninhadas
* Indexação de documentos

---

## Atividade 2 - Full-Text Search (FTS)

Implementação de mecanismos de busca textual nativos do PostgreSQL.

### Conceitos

* to_tsvector()
* to_tsquery()
* plainto_tsquery()
* Ranking de relevância
* Índices GIN

### Base Utilizada

* Dom Casmurro
* Quincas Borba
* Alice's Adventures in Wonderland

---

## Atividade 3 - Retrieval-Augmented Generation (RAG)

Sistema de recuperação semântica utilizando embeddings armazenados diretamente no PostgreSQL.

### Fluxo

1. Coleta dos documentos
2. Chunking dos textos
3. Geração de embeddings
4. Armazenamento vetorial
5. Recuperação semântica

### Tecnologias

* PostgreSQL
* pgvector
* Sentence Transformers
* Python

### Métricas Avaliadas

* Cosine Similarity
* Distância Euclidiana (L2)
* Inner Product

---

## Atividade 4 - PostGIS

Utilização do PostgreSQL para armazenamento e processamento de dados geográficos.

### Conceitos

* Point
* LineString
* Polygon
* Consultas espaciais
* Cálculo de distâncias
* Índices geográficos

---

# Tecnologias Utilizadas

| Tecnologia            | Finalidade                      |
| --------------------- | ------------------------------- |
| PostgreSQL            | Banco de dados relacional       |
| MySQL                 | Modelagem do projeto E-commerce |
| Python                | Desenvolvimento dos notebooks   |
| Google Colab          | Ambiente de execução            |
| JSONB                 | Dados semiestruturados          |
| Full-Text Search      | Busca textual                   |
| pgvector              | Busca vetorial                  |
| PostGIS               | Dados geoespaciais              |
| Pandas                | Manipulação de dados            |
| Psycopg2              | Conexão com PostgreSQL          |
| Sentence Transformers | Geração de embeddings           |

---

# Como Executar os Projetos

## E-commerce

Executar os scripts SQL na seguinte ordem:

```sql
SOURCE criacao_BD_Ecommerce_DanielTeles_JoaoVictor.sql;
SOURCE dump_BD_Ecommerce_DanielTeles_JoaoVictor.sql;
```

## PostgreSQL Avançado

Instalar dependências:

```bash
pip install pandas
pip install psycopg2-binary
pip install sentence-transformers
pip install pgvector
```

Configurar o arquivo `.env`:

```env
DBURL=postgresql://usuario:senha@host/database
```

---

# Objetivos de Aprendizagem

Este repositório demonstra a aplicação prática de:

* Modelagem de bancos de dados;
* Projeto de sistemas relacionais;
* Desenvolvimento SQL avançado;
* Processamento de dados semiestruturados;
* Recuperação de informação textual;
* Busca semântica baseada em embeddings;
* Processamento geoespacial;
* Otimização e indexação de consultas.

---


