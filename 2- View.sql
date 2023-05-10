#retorna informações sobre os filmes, diretores e estúdios
CREATE VIEW InformacoesFilmes AS
SELECT F.Titulo, F.AnoLancamento, F.Genero, F.Duracao, D.NomeDiretor AS NomeDiretor, E.NomeEstudio AS NomeEstudio
FROM Filme F
JOIN Diretor D ON F.IdDiretor = D.IdDiretor
JOIN Estudio E ON F.IdEstudio = E.IdEstudio;

SELECT * FROM InformacoesFilmes;


