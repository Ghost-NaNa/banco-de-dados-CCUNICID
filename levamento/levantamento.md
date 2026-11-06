# Levantamento — X Personal Studio

Texto organizado pelo grupo a partir das duas visitas presenciais à academia. O resumo está no [README](../README.md#relato-da-entrevista).

## 1. Organização

- **Nome:** X Personal Studio (academia de musculação, com fins lucrativos)
- **Endereço:** R. Refinaria Mataripe, 577 - Vila Antonieta, São Paulo - SP, 03477-010
- **Contato:** (11) 97730-5571
- **Porte:** 3 funcionários e cerca de 200 frequentadores inscritos, a maioria moradora do bairro
- **Entrevistado:** "Wolverine", dono da academia (apelido adotado a pedido dele, que não quis ser identificado)

## 2. Visitas

| Visita | Data | Local | Participantes do grupo |
|---|---|---|---|
| 1ª | 11/09/2026 | Na academia | Nathan de Oliveira Tavares, Guilherme Miranda Sena e Guilherme Silva |
| 2ª | 02/10/2026 | Na academia | Guilherme Miranda Sena |

## 3. O que foi respondido pelo entrevistado

**1ª visita**

- O dono autorizou o uso do espaço e as perguntas aos funcionários.
- A academia é totalmente focada em musculação e tem 3 instrutores especialistas.

**2ª visita**

- **Matrícula:** feita com base no CPF, mais nome completo, data de nascimento e foto do interessado. O cadastro fica em um sistema de terceiros.
- **Planos:** existe um plano próprio de inscrição, com duas modalidades de pagamento: mensal e anual.
- **Ficha de treino:** os exercícios são separados conforme o objetivo do frequentador (por exemplo, ganhar massa ou emagrecer). A ficha é feita em papel.
- **Funções:** todos os funcionários têm as mesmas funções e responsabilidades, mesmo em níveis hierárquicos diferentes.
- **Queixa do dono:** "fico perdido quando as fichas acumulam demais".

## 4. O que foi observado no local

- O espaço físico é pequeno, o que dificulta guardar fichas em papel.
- Os funcionários, incluindo o dono, parecem atuar também como personal trainers.
- As fichas de treino são feitas e guardadas em papel.

## 5. Decisões de modelagem para os pontos não detalhados

Alguns pontos não foram detalhados nas entrevistas. Em vez de deixá-los em aberto, o grupo tomou as decisões abaixo, que o modelo e o script SQL implementam.

| Ponto | Decisão do grupo | Regra ou requisito |
|---|---|---|
| Formas de pagamento, cobrança e renovação | Cada pagamento registra valor, vencimento, data de pagamento, forma e status. A renovação cria uma nova matrícula, e a anterior fica como histórico. | RF04, RN03, RN06, RN08 |
| Avaliação física | Processo típico de academia de musculação, incluído no modelo. Cada avaliação gera um novo registro e forma o histórico de evolução. | RF11, RN15, RN16, RN17 |
| Periodicidade de revisão das fichas | O banco guarda as datas de criação e de revisão. O prazo é parâmetro da consulta G08, e não regra fixa. | RF09, RN13 |
| Atraso de pagamento | O pagamento pendente com vencimento passado é tratado como atrasado. Não há bloqueio de acesso, pois não há catraca. | RN09, RNF07 |
| Quem vê observações médicas | Como todos os funcionários são instrutores com as mesmas funções, todos podem consultá-las, além do administrador. | RN19, RNF06 |
| Trancamento de matrícula | Incluído como um dos status possíveis da matrícula. | RN05, RF06 |
| Venda de produtos, estoque e controle de acesso | Fora do escopo, pois não foram citados como necessidade pela organização. | RNF07 |
