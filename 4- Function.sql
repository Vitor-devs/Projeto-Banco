USE BancoFilmes;

DELIMITER //

CREATE FUNCTION obter_duracao_media_filmes_genero(nome_genero VARCHAR(50))
RETURNS DECIMAL(5,2)
BEGIN
    DECLARE duracao_media DECIMAL(5,2);
    
    SELECT AVG(Duracao) INTO duracao_media
    FROM Filme
    WHERE Genero = nome_genero;
    
    RETURN duracao_media;
END //

DELIMITER ;

SELECT obter_duracao_media_filmes_genero('Animação') AS DuracaoMediaAcao;
