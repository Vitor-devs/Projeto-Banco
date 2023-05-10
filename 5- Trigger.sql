USE BancoFilmes;

DELIMITER //

CREATE TRIGGER aumentar_duracao_filme
BEFORE INSERT ON Filme
FOR EACH ROW
BEGIN
    IF NEW.Genero = 'Animação' THEN
        SET NEW.Duracao = NEW.Duracao + 30;
    END IF;
END //

DELIMITER ;
