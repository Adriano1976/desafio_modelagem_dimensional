# Apresentação do Desafio de Modelagem Dimensional

## Objetivo

O principal objetivo deste desafio era criar um modelo de dados em formato de Star Schema focado na análise de dados de professores na imagem como referência.

![image](https://github.com/user-attachments/assets/786700e9-5a0e-43aa-979d-5a0167ec116d)

## Descrição do Trabalho

O desafio envolvia a montagem de um esquema em estrela onde a **`tabela fato`** reflete diversas informações sobre os professores, os cursos ministrados e o departamento ao qual cada professor. Além disso, foi necessário criar **`tabelas de dimensão`** que detalham os cursos, as disciplinas oferecidas, os departamentos e as datas relacionadas aos cursos. 

## Estrutura de Tabelas Criadas

* **`Dim_Departamento`**: Contém informações sobre os departamentos, incluindo um identificador único, nome do departamento e localização.
* **`Dim_Data`**: Armazena as datas relevantes para a análise, como a data de oferta dos cursos e disciplinas, além de informações sobre ano, mês e tipo de oferta.
* **`Dim_Curso`**: Relaciona cada curso ao seu respectivo departamento, incluindo um identificador único, nome do curso, nível e duração.
* **`Dim_Professor`**: Detalha informações sobre os professores, incluindo um identificador único, nome, título, departamento e anos de experiência.
* **`Fato_Atividades_Professor`**: Tabela fato que relaciona professores com cursos e departamentos, contendo métricas como o número de aulas ministradas, carga horária total e data de oferta.
  
## Relacionamentos Estabelecidos

Cada tabela de dimensão está relacionada à tabela fato Professores através de chaves estrangeiras correspondentes.
Os cursos são relacionados às disciplinas através da tabela CursoDisciplina.

## Diagrama Dimensional - Star Schema

### Tabela Fato

A tabela fato contém as métricas e medidas que serão analisadas. Para o contexto de professores, a tabela fato pode ser estruturada da seguinte forma:

**Tabela**: `Fato_Atividades_Professor`

| Nome do Campo                     | Tipo de Dado        |
|-----------------------------------|---------------------|
| ID_Fato                           | Inteiro (PK)       |
| ID_Professor                      | Inteiro (FK)       |
| ID_Curso                          | Inteiro (FK)       |
| ID_Departamento                   | Inteiro (FK)       |
| Numero_Aulas_Ministradas          | Inteiro             |
| Carga_Horaria_Total               | Decimal             |
| Data_Oferta                       | Data                |

### Tabelas Dimensão

As tabelas dimensão fornecem detalhes adicionais que enriquecem a análise. As tabelas dimensão sugeridas são:

#### Dimensão Professor

**Tabela**: `Dim_Professor`

| Nome do Campo                     | Tipo de Dado        |
|-----------------------------------|---------------------|
| ID_Professor                      | Inteiro (PK)       |
| Nome_Professor                    | Texto               |
| Titulo                            | Texto               |
| Departamento                      | Texto               |
| Anos_Experiencia                  | Inteiro             |

#### Dimensão Curso

**Tabela**: `Dim_Curso`

| Nome do Campo                     | Tipo de Dado        |
|-----------------------------------|---------------------|
| ID_Curso                          | Inteiro (PK)       |
| Nome_Curso                        | Texto               |
| Nivel_Curso                       | Texto               |
| Duracao_Curso                     | Texto               |

#### Dimensão Departamento

**Tabela**: `Dim_Departamento`

| Nome do Campo                     | Tipo de Dado        |
|-----------------------------------|---------------------|
| ID_Departamento                   | Inteiro (PK)       |
| Nome_Departamento                 | Texto               |
| Localizacao                       | Texto               |

#### Dimensão Data

**Tabela**: `Dim_Data`

| Nome do Campo                     | Tipo de Dado        |
|-----------------------------------|---------------------|
| Data                              | Data (PK)          |
| Ano                               | Inteiro             |
| Mes                               | Inteiro             |
| Dia_Semana                       | Texto               |
| Trimestre                         | Inteiro             |
| Tipo_Oferta                       | Texto               |

### Considerações Finais

- **Relações**: A tabela fato deve estar relacionada a cada uma das tabelas dimensão através de chaves estrangeiras (FK), permitindo a análise de dados em diferentes contextos.
- **Granularidade**: A granularidade da tabela de data pode ser ajustada conforme necessário, permitindo análises em níveis diários, mensais ou anuais.
- **Análise Temporal**: A inclusão da tabela de data permite a exploração de tendências ao longo do tempo, como a frequência de aulas ministradas ou a carga horária total ao longo dos semestres.

Esse modelo em estrela proporcionará uma base sólida para a análise de dados dos professores, facilitando a geração de relatórios e insights significativos.
