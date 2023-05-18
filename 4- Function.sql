USE BancoFilmes;
GO

CREATE FUNCTION obter_duracao_media_filmes_genero
    (@nome_genero VARCHAR(50))
RETURNS DECIMAL(5,2)
AS
BEGIN
    DECLARE @duracao_media DECIMAL(5,2);

    SELECT @duracao_media = AVG(Duracao)
    FROM Filme
    WHERE Genero = @nome_genero;

    RETURN @duracao_media;
END;
GO

SELECT dbo.obter_duracao_media_filmes_genero('Animação') AS DuracaoMediaAnimacao;
