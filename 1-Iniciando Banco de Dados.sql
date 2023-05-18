CREATE DATABASE BancoFilmes;
GO

USE BancoFilmes;
GO

CREATE TABLE Genero (
    IdGenero INT PRIMARY KEY IDENTITY(1,1),
    NomeGenero VARCHAR(50) NOT NULL
);
GO

CREATE TABLE Estudio (
    IdEstudio INT PRIMARY KEY IDENTITY(1,1),
    NomeEstudio VARCHAR(100) NOT NULL,
    Pais VARCHAR(50) NOT NULL
);
GO

CREATE TABLE Diretor (
    IdDiretor INT PRIMARY KEY IDENTITY(1,1),
    NomeDiretor VARCHAR(100) NOT NULL,
    Nacionalidade VARCHAR(50) NOT NULL
);
GO

CREATE TABLE Filme (
    IdFilme INT PRIMARY KEY IDENTITY(1,1),
    Titulo VARCHAR(100) NOT NULL,
    AnoLancamento INT NOT NULL,
    Genero VARCHAR(50) NOT NULL,
    Duracao INT NOT NULL,
    IdDiretor INT NOT NULL,
    IdEstudio INT NOT NULL,
    FOREIGN KEY (IdDiretor) REFERENCES Diretor(IdDiretor),
    FOREIGN KEY (IdEstudio) REFERENCES Estudio(IdEstudio)
);
GO

CREATE TABLE Dublador (
    IdDublador INT PRIMARY KEY IDENTITY(1,1),
    NomeDublador VARCHAR(100) NOT NULL,
    IdFilme INT NOT NULL,
    FOREIGN KEY (IdFilme) REFERENCES Filme(IdFilme)
);
GO

INSERT INTO Estudio (NomeEstudio, Pais)
VALUES ('Pixar Animation Studios', 'Estados Unidos'),
       ('Studio Ghibli', 'Japão'),
       ('DreamWorks Animation', 'Estados Unidos'),
       ('Walt Disney Animation Studios', 'Estados Unidos'),
       ('Illumination Entertainment', 'Estados Unidos');
GO

INSERT INTO Diretor (NomeDiretor, Nacionalidade)
VALUES ('John Lasseter', 'Estados Unidos'),
       ('Hayao Miyazaki', 'Japão'),
       ('Chris Sanders', 'Estados Unidos'),
       ('Rich Moore', 'Estados Unidos'),
       ('Pierre Coffin', 'França');
GO

INSERT INTO Genero (NomeGenero)
VALUES ('Animação'),
       ('Comédia'),
       ('Aventura'),
       ('Fantasia'),
       ('Ação');
GO

INSERT INTO Filme (Titulo, AnoLancamento, Genero, Duracao, IdDiretor, IdEstudio)
VALUES ('Toy Story', 1995, 'Animação', 81, 1, 1),
       ('A Viagem de Chihiro', 2001, 'Animação', 125, 2, 2),
       ('Como Treinar o Seu Dragão', 2010, 'Animação', 98, 3, 3),
       ('Detona Ralph', 2012, 'Animação', 101, 4, 1),
       ('Meu Malvado Favorito', 2010, 'Animação', 95, 5, 5);
GO

INSERT INTO Dublador (NomeDublador, IdFilme)
VALUES ('Tom Hanks', 1),
       ('Daveigh Chase', 2),
       ('Jay Baruchel', 3),
       ('John C. Reilly', 4),
       ('Steve Carell', 5);
GO

-- Retornar o nome do diretor, nome do estúdio
