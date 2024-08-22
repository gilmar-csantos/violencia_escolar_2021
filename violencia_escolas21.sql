-- Contagem de escolas que responderam as perguntas por estado, independente da resposta.
SELECT sigla_uf, SUM(quantidade_escola) AS total_escolas
FROM testes.crime_escolas
GROUP BY sigla_uf
ORDER BY total_escolas DESC;

--  Tipos de Violência Mais Comuns
SELECT tema, SUM(quantidade_escola) AS total_escolas
FROM testes.crime_escolas
WHERE item NOT IN ('Nunca', 'Não', 'Sem resposta', 'Sem Resposta')
GROUP BY tema
ORDER BY total_escolas DESC;

-- Comparação entre Tema e Item
SELECT tema, item, SUM(quantidade_escola) AS total_escolas
FROM testes.crime_escolas
WHERE item NOT IN ('Nunca', 'Não', 'Sem resposta', 'Sem Resposta')
GROUP BY tema, item
ORDER BY tema, total_escolas DESC;

-- Casos de Violência por Estado e Tema 
SELECT sigla_uf, tema, SUM(quantidade_escola) AS total_escolas
FROM testes.crime_escolas
WHERE item NOT IN ('Nunca', 'Não', 'Sem resposta', 'Sem Resposta')
GROUP BY sigla_uf, tema
ORDER BY sigla_uf, total_escolas DESC;

-- Top 5 Temas de Violência com Mais Incidências 
SELECT tema, SUM(quantidade_escola) AS total_escolas
FROM testes.crime_escolas
WHERE item NOT IN ('Nunca', 'Não', 'Sem resposta', 'Sem Resposta')
GROUP BY tema
ORDER BY total_escolas DESC
LIMIT 5;


