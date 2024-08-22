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
-- Exemplo de uma consulta
SELECT sigla_uf, SUM(quantidade_escola) AS total_escolas
FROM violencia_escolar_2021
WHERE item NOT IN ('Nunca', 'Não', 'Sem resposta', 'Sem Resposta')
GROUP BY sigla_uf
ORDER BY total_escolas DESC;
