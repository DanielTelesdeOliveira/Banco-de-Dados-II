# PostgreSQL - Tecnologias Avançadas

Repositório contendo atividades práticas desenvolvidas na disciplina **Banco de Dados II (SQL RDBMS)**, explorando recursos avançados do PostgreSQL para armazenamento, recuperação e análise de dados.

O projeto aborda quatro grandes áreas:

* JSONB e dados semiestruturados;
* Full-Text Search (FTS);
* Retrieval-Augmented Generation (RAG) com pgvector;
* Dados geoespaciais com PostGIS.

---

## Integrantes

* [Daniel Teles de Oliveira](https://github.com/DanielTelesdeOliveira)
* [João Victor Torres Soares](https://github.com/JTSoares)
* [Pedro Gabriel Takenobu Serafim](https://github.com/pedrogts)
* [Rubens Rodrigues Maranesi](https://github.com/Rubziguin)

---

# Sumário

* [Objetivos](#objetivos)
* [Tecnologias Utilizadas](#tecnologias-utilizadas)
* [Atividade 1 - JSONB e Dados Semiestruturados](#atividade-1---jsonb-e-dados-semiestruturados)
* [Atividade 2 - Full-Text Search](#atividade-2---full-text-search)
* [Atividade 3 - Retrieval-Augmented Generation (RAG)](#atividade-3---retrieval-augmented-generation-rag)
* [Atividade 4 - PostGIS e Dados Geoespaciais](#atividade-4---postgis-e-dados-geoespaciais)
* [Configuração do Ambiente](#configuração-do-ambiente)
* [Resultados Obtidos](#resultados-obtidos)
* [Conclusão](#conclusão)

---

# Objetivos

O objetivo deste trabalho é explorar funcionalidades avançadas do PostgreSQL que vão além do modelo relacional tradicional, demonstrando sua aplicação em cenários modernos de gerenciamento de dados.

Ao final das atividades, espera-se compreender:

* Manipulação de documentos JSON;
* Recuperação de informações por busca textual;
* Busca semântica baseada em embeddings;
* Processamento e consulta de dados geográficos.

---

# Tecnologias Utilizadas

| Tecnologia            | Finalidade                            |
| --------------------- | ------------------------------------- |
| PostgreSQL            | Sistema Gerenciador de Banco de Dados |
| Neon Database         | Hospedagem do banco PostgreSQL        |
| Python                | Desenvolvimento dos scripts           |
| Google Colab          | Ambiente de execução                  |
| pgvector              | Armazenamento e consulta vetorial     |
| PostGIS               | Processamento geoespacial             |
| JSONB                 | Armazenamento de documentos JSON      |
| Full-Text Search      | Busca textual                         |
| Sentence Transformers | Geração de embeddings                 |
| Pandas                | Manipulação de dados                  |
| Psycopg2              | Conexão com PostgreSQL                |

---

# Atividade 1 - JSONB e Dados Semiestruturados

## Descrição

O PostgreSQL possui suporte nativo ao tipo de dado JSONB, permitindo armazenar documentos JSON de forma eficiente e indexável.

Nesta atividade foram realizadas operações de armazenamento e consulta sobre dados semiestruturados.

## Conceitos Trabalhados

* Criação de colunas JSONB;
* Inserção de documentos JSON;
* Operadores `->`, `->>` e `#>>`;
* Consulta de objetos aninhados;
* Filtragem por atributos internos;
* Operador de contenção (`@>`);
* Indexação de documentos JSONB.

## Objetivo

Demonstrar como o PostgreSQL pode atuar como um banco híbrido, combinando características relacionais e orientadas a documentos.

---

# Atividade 2 - Full-Text Search

## Descrição

Implementação de mecanismos de recuperação textual utilizando os recursos nativos do PostgreSQL.

Foram utilizados textos literários para construção de uma base de documentos pesquisáveis.

## Livros Utilizados

* Dom Casmurro
* Quincas Borba
* Alice's Adventures in Wonderland

## Conceitos Trabalhados

* `to_tsvector()`
* `to_tsquery()`
* `plainto_tsquery()`
* Ranking de relevância
* Busca por palavras-chave
* Índices GIN
* Análise de desempenho

## Objetivo

Avaliar a eficiência da busca textual do PostgreSQL em comparação com consultas tradicionais utilizando operadores `LIKE` e `ILIKE`.

---

# Atividade 3 - Retrieval-Augmented Generation (RAG)

## Descrição

Implementação de um sistema de recuperação semântica utilizando embeddings vetoriais armazenados diretamente no PostgreSQL através da extensão pgvector.

## Fluxo da Solução

### 1. Coleta dos documentos

Os livros são carregados e preparados para processamento.

### 2. Chunking

Os textos são divididos em blocos menores para facilitar a recuperação semântica.

### 3. Geração dos Embeddings

Utilização do modelo:

```python
all-MiniLM-L6-v2
```

### 4. Armazenamento Vetorial

Os embeddings são armazenados em colunas do tipo:

```sql
VECTOR(384)
```

### 5. Recuperação Semântica

Consultas realizadas utilizando diferentes métricas:

* Cosine Similarity
* Euclidean Distance (L2)
* Inner Product

## Objetivo

Demonstrar a construção de um sistema RAG utilizando apenas PostgreSQL como banco de dados para armazenamento e recuperação vetorial.

---

# Atividade 4 - PostGIS e Dados Geoespaciais

## Descrição

Utilização da extensão PostGIS para armazenamento e consulta de informações geográficas.

## Geometrias Trabalhadas

### Point

Representação de cidades e pontos turísticos.

### LineString

Representação de rotas entre cidades.

### Polygon

Representação de regiões geográficas.

## Conceitos Trabalhados

* Habilitação da extensão PostGIS;
* Sistema de referência espacial (SRID 4326);
* Criação de geometrias;
* Consultas espaciais;
* Cálculo de distâncias;
* Interseções espaciais;
* Índices geográficos.

## Objetivo

Demonstrar o uso do PostgreSQL como plataforma para aplicações geoespaciais.

---

# Configuração do Ambiente

## Instalação das Dependências

```bash
pip install pandas
pip install psycopg2-binary
pip install sentence-transformers
pip install pgvector
```

## Variáveis de Ambiente

Crie um arquivo `.env`:

```env
DBURL=postgresql://usuario:senha@host/database
```

## Conexão com o Banco

```python
import psycopg2
from dotenv import load_dotenv
import os

load_dotenv()

conn = psycopg2.connect(os.getenv("DBURL"))
```

---

# Resultados Obtidos

As atividades permitiram explorar diferentes capacidades do PostgreSQL:

- Armazenamento de documentos JSON com JSONB.

- Busca textual eficiente através de Full-Text Search.

- Recuperação semântica utilizando embeddings e pgvector.

- Manipulação e análise de dados geográficos com PostGIS.

- Criação e utilização de índices especializados para otimização de consultas.

---

# Conclusão

O PostgreSQL demonstra ser uma plataforma extremamente versátil, capaz de atender diferentes necessidades de armazenamento e recuperação de dados sem a necessidade de múltiplas tecnologias externas.

A integração entre recursos relacionais, busca textual, vetorial e geoespacial torna o PostgreSQL uma solução robusta para aplicações modernas de dados.


