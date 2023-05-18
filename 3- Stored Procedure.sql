#recebe como parâmetro o nome de um gênero de filme e lista todos os filmes do banco de dados que pertencem a esse gênero
USE BancoFilmes;
GO

CREATE PROCEDURE obter_filmes_por_genero
    @nome_genero VARCHAR(50)
AS
BEGIN
    SELECT Titulo, AnoLancamento, Genero, Duracao
    FROM Filme
    WHERE Genero = @nome_genero;
END;
GO

EXEC obter_filmes_por_genero @nome_genero = 'Animação';
