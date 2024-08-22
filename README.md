# Análise da Violência nas Escolas Brasileiras em 2021

## Descrição do Projeto

Utilizando como banco de dados a Violência nas Escolas em 2021, gerado pelo Anuário Brasileiro de Segurança Pública, desenvolvi este projeto para treinar minhas habilidades em SQL e como parte do meu portfólio de Data Science, com o objetivo de analisar os padrões de violência nas escolas brasileiras utilizando a base de dados do Anuário Brasileiro de Segurança e o banco de dados de violência nas escolas do ano de 2021.

## Objetivos

- **Entender a distribuição geográfica dos casos de violência nas escolas.**
- **Identificar os temas e tipos de violência mais reportados.**
- **Explorar a correlação entre os estados e os diferentes tipos de violência.**

## Ferramentas Utilizadas

- **PostgreSQL:** Para análises principais.

## Exemplos de Consultas

```sql
-- Tipos de Violência Mais Comuns
SELECT tema, SUM(quantidade_escola) AS total_escolas
FROM testes.crime_escolas
WHERE item NOT IN ('Nunca', 'Não', 'Sem resposta', 'Sem Resposta')
GROUP BY tema
ORDER BY total_escolas DESC;

-- Top 5 Temas de Violência com Mais Incidências 
SELECT tema, SUM(quantidade_escola) AS total_escolas
FROM testes.crime_escolas
WHERE item NOT IN ('Nunca', 'Não', 'Sem resposta', 'Sem Resposta')
GROUP BY tema
ORDER BY total_escolas DESC
LIMIT 5;

## Análises e Resultados

Durante a análise, foi possível identificar que um total de 1.199.490 escolas participaram da pesquisa sobre violência escolar em 2021, abrangendo todos os 26 estados brasileiros e o Distrito Federal. A maior concentração dessas escolas foi registrada nos estados de São Paulo, Minas Gerais e Bahia.

Os temas abordados na pesquisa variaram desde questões relacionadas à segurança na entrada e saída das escolas até incidentes mais graves, como roubo, furto, tráfico de drogas e assédio sexual. Entre os temas mais frequentemente associados à violência nas escolas, destacam-se:

1. **Condições de segurança na entrada e saída da escola**
2. **Muros e/ou grades que isolam a escola do ambiente externo**
3. **Bullying (ameaças ou ofensas verbais)**
4. **Depredação do patrimônio escolar (vandalismo)**
5. **Roubo ou furto**

Além disso, os cinco estados que lideraram em número de ocorrências de violência foram: **São Paulo, Minas Gerais, Bahia, Paraná** e **Rio de Janeiro**.
