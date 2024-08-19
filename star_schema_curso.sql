-- Criação da tabela Fato
CREATE TABLE Fato_Atividades_Professor (
    ID_Fato INT PRIMARY KEY AUTO_INCREMENT,
    ID_Professor INT,
    ID_Curso INT,
    ID_Departamento INT,
    Numero_Aulas_Ministradas INT,
    Carga_Horaria_Total DECIMAL(5, 2),
    Data_Oferta DATE,
    FOREIGN KEY (ID_Professor) REFERENCES Dim_Professor(ID_Professor),
    FOREIGN KEY (ID_Curso) REFERENCES Dim_Curso(ID_Curso),
    FOREIGN KEY (ID_Departamento) REFERENCES Dim_Departamento(ID_Departamento)
);

-- Criação da tabela Dimensão Professor
CREATE TABLE Dim_Professor (
    ID_Professor INT PRIMARY KEY AUTO_INCREMENT,
    Nome_Professor VARCHAR(100),
    Titulo VARCHAR(50),
    Departamento VARCHAR(100),
    Anos_Experiencia INT
);

-- Criação da tabela Dimensão Curso
CREATE TABLE Dim_Curso (
    ID_Curso INT PRIMARY KEY AUTO_INCREMENT,
    Nome_Curso VARCHAR(100),
    Nivel_Curso VARCHAR(50),
    Duracao_Curso VARCHAR(50)
);

-- Criação da tabela Dimensão Departamento
CREATE TABLE Dim_Departamento (
    ID_Departamento INT PRIMARY KEY AUTO_INCREMENT,
    Nome_Departamento VARCHAR(100),
    Localizacao VARCHAR(100)
);

-- Criação da tabela Dimensão Data
CREATE TABLE Dim_Data (
    Data DATE PRIMARY KEY,
    Ano INT,
    Mes INT,
    Dia_Semana VARCHAR(10),
    Trimestre INT,
    Tipo_Oferta VARCHAR(50)
);