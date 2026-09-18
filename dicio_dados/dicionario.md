### Dicionário de Dados
## Caso: Sistema de Gestão de uma Academia *("BlueFit")*
---
## 1. Modelo conceitual

Este modelo representa uma academia (organização voltada à prática de atividades físicas) na qual cada pessoa que frequenta o espaço (**frequentador**) possui uma ou mais **matrículas**, vinculadas a um **plano** contratado. Um frequentador pode receber **fichas de treino** elaboradas para orientar seus exercícios, e pode passar por **avaliações físicas** conduzidas por um **funcionário** (instrutor/educador físico) da equipe.

| Entidade | Relaciona-se com | Cardinalidade |
|---|---|---|
| FICHA_DE_TREINO | FREQUENTADOR | 1:1 → N — toda ficha de treino é recebida por exatamente um frequentador; um frequentador pode receber nenhuma ou várias fichas de treino ao longo do tempo |
| FREQUENTADOR | MATRICULA | 1:N — um frequentador possui de uma a várias matrículas (histórico de renovações); toda matrícula pertence a exatamente um frequentador |
| MATRICULA | PLANO | N:1 — toda matrícula está associada a exatamente um plano; um plano pode compor nenhuma ou várias matrículas |
| FUNCIONARIO | AVALIACAO_FISICA | 1:N — um funcionário realiza nenhuma ou várias avaliações físicas; toda avaliação física é realizada por exatamente um funcionário |
| FREQUENTADOR | AVALIACAO_FISICA | N:M *(conforme desenhado no DER — ver observação no item 6)* — um frequentador pode possuir nenhuma ou várias avaliações físicas, e a relação foi modelada permitindo que uma avaliação se associe a mais de um frequentador |

**FICHA_DE_TREINO** é o documento que orienta os exercícios de um frequentador, com objetivo definido e passível de revisão periódica.
**FREQUENTADOR** é a pessoa física cadastrada que utiliza os serviços da academia.
**FUNCIONARIO** é a pessoa física que trabalha na academia (recepção, instrutoria, gestão etc.).
**MATRICULA** é o vínculo contratual, com vigência definida, entre o frequentador e um plano da academia.
**PLANO** é a oferta comercial (mensalidade, modalidade de acesso) que pode compor uma ou várias matrículas.
**AVALIACAO_FISICA** é o registro periódico de medidas corporais e observações realizado por um funcionário.
---
## 2. Fluxo de dados (visão simplificada)
Frequentador procura a academia → cadastro em **FREQUENTADOR** → contratação de um **PLANO**, com abertura de **MATRICULA** vinculando frequentador e plano → a critério da equipe, é elaborada uma **FICHA_DE_TREINO** para o frequentador → periodicamente, um **FUNCIONARIO** conduz uma **AVALIACAO_FISICA** do frequentador, registrando peso, altura e demais medidas → o histórico de matrículas, fichas e avaliações compõe o acompanhamento do frequentador ao longo do tempo.
---
## 3. Convenções do dicionário

**Notação formal (símbolos usados neste dicionário):**

| Símbolo | Significado |
|---|---|
| `=` | é composto de |
| `+` | e (conecta elementos obrigatórios) |
| `( )` | opcional |
| `{ }`, `n{ }m` | iteração, com limite mínimo n e máximo m |
| `[ \| ]` | escolha obrigatória entre alternativas |
| `/ /` | rótulo de um grupo repetitivo |
| `@` | identificador (chave primária) |
| `* *` | comentário, fora da estrutura formal |

**Prefixos:** `NM_` nome, `DT_` data, `ID_` identificador (não sofre operação matemática), `CD_` código de domínio, `QT_` quantidade, `TP_` tipo (categorização), `IN_` indicador booleano, `DS_` descrição/texto livre.

---

## 4. Estrutura formal por entidade

```
FICHA_DE_TREINO   = @ID_FICHA_TREINO + ID_FREQUENTADOR + DT_CRIACAO + (DT_REVISAO) + TP_OBJETIVO
FREQUENTADOR      = @ID_FREQUENTADOR + NM_FREQUENTADOR + ID_CPF + IN_PAGAMENTO_EM_DIA
MATRICULA         = @ID_MATRICULA + ID_FREQUENTADOR + ID_PLANO + DT_INICIO + (DT_FINAL) + TP_STATUS
PLANO             = @ID_PLANO + NM_PLANO
FUNCIONARIO       = @ID_FUNCIONARIO + NM_FUNCIONARIO + ID_CPF + TP_CARGO + (DS_ESPECIALIDADE) + DS_SENHA_HASH
AVALIACAO_FISICA  = @ID_AVALIACAO + ID_FUNCIONARIO + DT_AVALIACAO + QT_PESO + QT_ALTURA + QT_PERCENTUAL_GORDURA + (DS_OBSERVACOES_MEDICAS)
```

---

## 5. Dicionário de Dados Conceitual (Preliminar)

Para cada entidade identificada, liste:

### FICHA_DE_TREINO

| Atributo | Descrição | Regra de negócio associada |
|----------|-----------|------------------------------|
| ID_FICHA_TREINO | Identificador único da ficha de treino | Chave primária; gerada automaticamente pelo sistema |
| ID_FREQUENTADOR | Referência ao frequentador que recebe a ficha | Obrigatório; toda ficha pertence a exatamente um frequentador |
| DT_CRIACAO | Data em que a ficha foi elaborada | Obrigatório; marca o início da vigência do plano de treino |
| DT_REVISAO | Data da última atualização da ficha | Opcional; pode não existir se a ficha ainda não foi revisada |
| TP_OBJETIVO | Finalidade do treino | Obrigatório; valores possíveis: hipertrofia, emagrecimento, condicionamento físico, reabilitação, outro |

### FREQUENTADOR

| Atributo | Descrição | Regra de negócio associada |
|----------|-----------|------------------------------|
| ID_FREQUENTADOR | Identificador único do frequentador | Chave primária; gerado automaticamente pelo sistema |
| NM_FREQUENTADOR | Nome completo do frequentador | Obrigatório; identifica a pessoa nos atendimentos, fichas e avaliações |
| ID_CPF | Documento de identificação civil do frequentador | Obrigatório e único; evita cadastro duplicado da mesma pessoa |
| IN_PAGAMENTO_EM_DIA | Indica se o pagamento do frequentador está em dia | Obrigatório; valores possíveis: sim/não; o acesso a serviços (ex.: emissão de nova ficha de treino) pode ser condicionado a este indicador |

### MATRICULA

| Atributo | Descrição | Regra de negócio associada |
|----------|-----------|------------------------------|
| ID_MATRICULA | Identificador único da matrícula | Chave primária; gerado automaticamente pelo sistema |
| ID_FREQUENTADOR | Referência ao frequentador titular da matrícula | Obrigatório; toda matrícula pertence a exatamente um frequentador |
| ID_PLANO | Referência ao plano contratado | Obrigatório; uma matrícula só pode ser aberta se o plano estiver ativo/disponível |
| DT_INICIO | Data de início de vigência da matrícula | Obrigatório |
| DT_FINAL | Data de encerramento previsto da matrícula | Opcional; ausente enquanto a matrícula estiver em vigor por prazo indeterminado |
| TP_STATUS | Situação atual da matrícula | Obrigatório; valores possíveis: Ativa, Suspensa, Cancelada, Concluída; deve mudar para "Concluída" automaticamente quando DT_FINAL for atingida |

### PLANO

| Atributo | Descrição | Regra de negócio associada |
|----------|-----------|------------------------------|
| ID_PLANO | Identificador único do plano | Chave primária; gerado automaticamente pelo sistema |
| NM_PLANO | Nome comercial do plano | Obrigatório; nomes de plano devem ser únicos para evitar ambiguidade na contratação |

### FUNCIONARIO

| Atributo | Descrição | Regra de negócio associada |
|----------|-----------|------------------------------|
| ID_FUNCIONARIO | Identificador único do funcionário | Chave primária; gerado automaticamente pelo sistema |
| NM_FUNCIONARIO | Nome completo do funcionário | Obrigatório |
| ID_CPF | Documento de identificação civil do funcionário | Obrigatório e único; evita cadastro duplicado da mesma pessoa |
| TP_CARGO | Função exercida pelo funcionário | Obrigatório; valores possíveis: instrutor, recepcionista, gerente etc.; apenas cargos habilitados (ex.: instrutor/educador físico) podem registrar uma avaliação física |
| DS_ESPECIALIDADE | Especialidade declarada pelo funcionário | Opcional; ausente quando o cargo não exige especialização (ex.: recepção) |
| DS_SENHA_HASH | Credencial de acesso do funcionário ao sistema | Obrigatório; deve ser armazenada apenas na forma criptografada (hash), nunca em texto puro |

### AVALIACAO_FISICA

| Atributo | Descrição | Regra de negócio associada |
|----------|-----------|------------------------------|
| ID_AVALIACAO | Identificador único da avaliação física | Chave primária; gerado automaticamente pelo sistema |
| ID_FUNCIONARIO | Referência ao funcionário responsável pela avaliação | Obrigatório; toda avaliação é conduzida por exatamente um funcionário |
| DT_AVALIACAO | Data em que a avaliação física foi realizada | Obrigatório; base para calcular a evolução do frequentador entre avaliações |
| QT_PESO | Peso corporal aferido, em quilogramas | Obrigatório |
| QT_ALTURA | Altura aferida, em metros | Obrigatório; usada em conjunto com o peso para cálculo do IMC |
| QT_PERCENTUAL_GORDURA | Percentual de gordura corporal estimado na avaliação | Obrigatório |
| DS_OBSERVACOES_MEDICAS | Observações relevantes registradas pelo avaliador | Opcional; ausente quando não há nada a registrar |