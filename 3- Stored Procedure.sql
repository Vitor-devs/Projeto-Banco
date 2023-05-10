#recebe como parâmetro o nome de um gênero de filme e lista todos os filmes do banco de dados que pertencem a esse gênero
USE BancoFilmes;

DELIMITER //

CREATE PROCEDURE obter_filmes_por_genero(IN nome_genero VARCHAR(50))
BEGIN
    SELECT Titulo, AnoLancamento, Genero, Duracao
    FROM Filme
    WHERE Genero = nome_genero;
END //

DELIMITER ;

CALL obter_filmes_por_genero('Animação');

