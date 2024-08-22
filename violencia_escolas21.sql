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

-- Top 5 Temas de Violências com Mais Incidências 
SELECT tema, SUM(quantidade_escola) AS total_escolas
FROM testes.crime_escolas
WHERE item NOT IN ('Nunca', 'Não', 'Sem resposta', 'Sem Resposta')
GROUP BY tema
ORDER BY total_escolas DESC
LIMIT 5;

-- Maior Tema de Violências em Cada Estado
WITH temas_por_estado AS (
    SELECT
        sigla_uf,
        tema,
        SUM(quantidade_escola) AS total_escolas
    FROM
        testes.crime_escolas
    WHERE
        item NOT IN ('Nunca', 'Não', 'Sem resposta', 'Sem Resposta')
    GROUP BY
        sigla_uf, tema
)

SELECT
    sigla_uf,
    tema,
    total_escolas
FROM
    temas_por_estado
WHERE
    (sigla_uf, total_escolas) IN (
        SELECT
            sigla_uf,
            MAX(total_escolas)
        FROM
            temas_por_estado
        GROUP BY
            sigla_uf
    )
ORDER BY
    sigla_uf;

-- Os 5 Estados que Mais Lideraram o Número de Violências em 2021
SELECT
    sigla_uf,
    SUM(quantidade_escola) AS total_violencias
FROM
    testes.crime_escolas
WHERE
    item NOT IN ('Nunca', 'Não', 'Sem resposta', 'Sem Resposta')
GROUP BY
    sigla_uf
ORDER BY
    total_violencias DESC
LIMIT 5;


