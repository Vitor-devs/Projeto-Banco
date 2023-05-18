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

-- Retornar o nome do diretor, nome do estúdio e ano de lançamento de todos os filmes de animação
SELECT D.NomeDiretor, E.NomeEstudio, F.AnoLancamento
FROM Filme F
JOIN Diretor D ON F.IdDiretor = D.IdDiretor
JOIN Estudio E ON F.IdEstudio = E.IdEstudio
WHERE F.Genero = 'Animação';
GO

-- Retornar o título, nome do estúdio, ano de lançamento e nome do dublador dos filmes do estúdio Pixar
SELECT F.Titulo, E.NomeEstudio, F.AnoLancamento, D.NomeDublador
FROM Filme F
JOIN Estudio E ON F.IdEstudio = E.IdEstudio
JOIN Dublador D ON F.IdFilme = D.IdFilme
WHERE E.NomeEstudio = 'Pixar Animation Studios';
GO

-- Retornar o título, nome do estúdio, nome do diretor e nacionalidade do diretor dos filmes de animação com duração superior a 100 minutos
SELECT F.Titulo, E.NomeEstudio, D.NomeDiretor, D.Nacionalidade
FROM Filme F
JOIN Estudio E ON F.IdEstudio = E.IdEstudio
JOIN Diretor D ON F.IdDiretor = D.IdDiretor
WHERE F.Genero = 'Animação' AND F.Duracao > 100;
GO

-- Retornar o título, ano de lançamento e nome do estúdio dos filmes que têm o dublador Steve Carell
SELECT F.Titulo, F.AnoLancamento, E.NomeEstudio
FROM Filme F
JOIN Dublador D ON F.IdFilme = D.IdFilme
JOIN Estudio E ON F.IdEstudio = E.IdEstudio
WHERE D.NomeDublador = 'Steve Carell';
GO

-- Retornar o nome do diretor e do estúdio de cada filme e a contagem de dubladores que trabalharam em cada um deles
SELECT F.Titulo, D.NomeDiretor AS NomeDiretor, E.NomeEstudio AS NomeEstudio, 
(SELECT COUNT(*) FROM Dublador WHERE IdFilme = F.IdFilme) AS NumDubladores
FROM Filme F
JOIN Diretor D ON F.IdDiretor = D.IdDiretor
JOIN Estudio E ON F.IdEstudio = E.IdEstudio;
GO
