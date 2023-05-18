USE BancoFilmes;
GO

CREATE TRIGGER aumentar_duracao_filme
ON Filme
BEFORE INSERT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (SELECT * FROM inserted WHERE Genero = 'Animação')
    BEGIN
        UPDATE Filme
        SET Duracao = Duracao + 30
        FROM Filme
        INNER JOIN inserted ON Filme.IdFilme = inserted.IdFilme
        WHERE Filme.Genero = 'Animação';
    END
END;
GO
