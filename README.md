# Modelagem de Banco de Dados para a X Personal Estudio

## Grupo
 - Guilherme Lima de Souza (RGM - 47622814)
 - Guilherme Miranda Sena (RGM - 47401672)
 - Guilherme Vilela Frassão (RGM - 47911522)
 - Nathan de Oliveira Tavares (RGM - 47916966)
 - Kaue Dogani Moreira (RGM - 47312998) 

---

## Introdução

A organização e o controle adequado das informações são importantes para o funcionamento de uma academia, principalmente quando existem diversos frequentadores, funcionários, planos, matrículas, avaliações físicas e fichas de treino.

A X Personal Estudio, localizada em São Paulo - SP, atua no segmento de atividades físicas, com foco na prática de musculação. A academia possui aproximadamente 15 funcionários e oferece planos destinados aos frequentadores.

Atualmente, parte das informações relacionadas aos frequentadores e aos seus treinos é registrada por meio de fichas físicas em papel. Esse tipo de controle pode dificultar a organização, atualização, consulta e manutenção dos dados.

Diante desse cenário, o presente projeto tem como objetivo realizar a modelagem conceitual de um sistema de gerenciamento de informações para a X Personal Estudio. O modelo busca representar os principais dados e processos da organização, considerando frequentadores, funcionários, matrículas, planos, fichas de treino e avaliações físicas.

O projeto está delimitado à etapa de levantamento e organização dos requisitos e à elaboração do Modelo Entidade-Relacionamento (DER), não contemplando, nesta etapa, a implementação do banco de dados ou o desenvolvimento completo do sistema.

---

## Desenvolvimento

### Caracterização da Organização

Para o desenvolvimento deste projeto, escolhemos a academia de musculação **X Personal EEstudio**. A academia é de pequeno porte e atende principalmente ao público do bairro, contando com aproximadamente **15 funcionários**, entre instrutores, recepcionistas e equipe de limpeza, além de cerca de **200 frequentadores inscritos**.

A principal problemática identificada é a **ausência de um sistema específico para o gerenciamento das informações**, dificultando a organização e o controle dos dados da academia.

A instituição foi escolhida pela facilidade de comunicação com os envolvidos e pela **possibilidade de expansão do projeto**, além de apresentar relações entre diferentes informações, tornando-a um bom caso para o desenvolvimento de um banco de dados.

## 1. Caracterização da Organização

---

### Processos de Negócio
- **Nome e natureza da organização:** X Personal Studio — academia de musculação, com fins lucrativos, situada em São Paulo - SP.
- **Contexto e porte:** organização de pequeno porte, com aproximadamente 15 funcionários (entre instrutores, recepcionistas e equipe de limpeza) e cerca de 200 frequentadores inscritos. O volume de atividades inclui matrículas, renovações de plano, atendimentos diários de treino e avaliações físicas periódicas.
- **Problemas e necessidades identificados:** a principal problemática é a **ausência de um sistema específico para o gerenciamento das informações**. Parte dos dados de frequentadores e de seus treinos ainda é registrada em fichas físicas de papel, dificultando a organização, atualização, consulta e manutenção dessas informações.
- **Justificativa da escolha:** a organização foi escolhida pela facilidade de comunicação com os envolvidos e pelo acesso direto do grupo ao local, além de apresentar relações claras entre diferentes tipos de informação (frequentadores, planos, matrículas, treinos e avaliações), o que a torna um bom caso para a modelagem de um banco de dados nesta etapa do curso.
- **Evidências da organização:**

  ![comprovação — fachada](./dicio_dados/imgs/fachada.jpeg)
  ![comprovação — interior 1](./dicio_dados/imgs/Dentro.jpeg(3).jpeg)
  ![comprovação — interior 2](./dicio_dados/imgs/dentro2.jpeg)

---

### SGBD e Collation

- **SGBD:** MySQL 8.0 (versão prevista, a confirmar).
- **Banco de dados:** `db_gym_list`
- **Character Set:** `utf8mb4` (previsto).
- **Collation:** `utf8mb4_0900_ai_ci` (prevista).

O banco de dados é identificado pelo nome `db_gym_list`. A definição do conjunto de caracteres e da collation deverá ser aplicada na configuração do banco, garantindo consistência no armazenamento, na comparação e na ordenação de textos.

---

### Requisitos Funcionais

1. *Cadastrar frequentadores*

   * O sistema deve permitir cadastrar o ID, nome, CPF e informações de pagamento do frequentador.

2. *Cadastrar matrículas*

   * O sistema deve permitir registrar a matrícula de um frequentador, incluindo data de início, data final e status.

3. *Cadastrar planos*

   * O sistema deve permitir cadastrar planos e seus respectivos nomes ou descrições.

4. *Relacionar frequentadores aos planos*

   * O sistema deve permitir associar uma matrícula a um plano contratado.

5. *Cadastrar fichas de treino*

   * O sistema deve permitir criar fichas de treino contendo data de criação, data de revisão e objetivo.

6. *Relacionar fichas de treino aos frequentadores*

   * O sistema deve permitir associar uma ficha de treino a um frequentador.

7. *Cadastrar funcionários*

   * O sistema deve permitir cadastrar funcionários com nome, CPF, cargo, especialidade e senha.

8. *Relacionar funcionários às fichas de treino*

   * O sistema deve permitir identificar o funcionário responsável pela elaboração da ficha de treino.

9. *Cadastrar avaliações físicas*

   * O sistema deve permitir registrar avaliações físicas com data, peso, altura, percentual de gordura e observações médicas.

10. *Manter histórico de avaliações*

* O sistema deve permitir acompanhar as avaliações físicas realizadas ao longo do tempo.

11. *Controlar situação da matrícula*

* O sistema deve permitir consultar e atualizar o status da matrícula.

12. *Controlar informações de pagamento*

* O sistema deve permitir registrar e consultar a situação do pagamento do aluno.

---

### Requisitos Não Funcionais

1. *Segurança*

   * As senhas dos funcionários devem ser protegidas e acessíveis somente por usuários autorizados.

2. *Integridade dos dados*

   * Cada frequentador, funcionário, matrícula, plano, ficha de treino e avaliação deve possuir um identificador único.

3. *Identificação*

   * O CPF deve ser utilizado para identificar o frequentador e o funcionário.

4. *Confiabilidade*

   * As informações cadastradas devem ser armazenadas de forma consistente para evitar perda ou alteração indevida dos dados.

5. *Usabilidade*

   * O sistema deve permitir que os usuários realizem cadastros e consultas de maneira organizada e compreensível.

6. *Privacidade*

   * Informações pessoais e observações médicas devem ser acessíveis somente aos usuários autorizados.

7. *Manutenibilidade*

   * O sistema deve permitir a atualização das informações de matrícula, ficha de treino, avaliação física e demais registros.

8. *Rastreabilidade*

   * As datas de criação, revisão, início, encerramento e avaliação devem ser armazenadas para permitir o acompanhamento dos registros.
- **Restrições organizacionais:**
  - O sistema deve preservar a privacidade das informações dos frequentadores e funcionários; os dados devem ser acessados somente por pessoas autorizadas pela organização.
  - Informações utilizadas como exemplos na documentação do projeto devem ser fictícias — não devem ser usados dados reais de frequentadores ou funcionários, mesmo que observados durante a pesquisa de campo.
  - Observações médicas registradas nas avaliações físicas são consideradas dado sensível e exigem controle de acesso mais restrito.

O sistema deve considerar a necessidade de preservar a privacidade das informações dos frequentadores e funcionários. Os dados devem ser acessados somente por pessoas autorizadas pela organização.

Além disso, informações utilizadas como exemplos na documentação do projeto devem ser fictícias, não sendo utilizados dados reais de frequentadores ou funcionários.

### Dicionário de Dados Conceitual (Preliminar)
Para acessar o Diagrama Entidade-Relacionamento, acesse:
[Dicionário de dados](./dicio_dados/dicionario.md)

---

### Modelagem Conceitual (Entidades, Atributos, Relacionamentos)

- **Entidades reconhecidas:**

**Frequentador:** representa a pessoa que utiliza os serviços oferecidos pela X Personal Estudio. É a entidade central do modelo, estando relacionada às matrículas, fichas de treino e avaliações físicas.

Para acessar o Dicionário de Dados completo (HTML), acesse:
[Dicionário de Dados](./dicio_dados/dicionario.html)

O dicionário contempla, para cada entidade (Funcionário, Frequentador, Matrícula, Plano, Ficha de Treino e Avaliação Física), seus atributos, descrições e regras de negócio associadas, seguindo o modelo de tabela padronizado (Atributo | Descrição | Regra de negócio).

---

## 6. Modelagem Conceitual (Entidades, Atributos, Relacionamentos)

- **Entidades reconhecidas:**

  - **Frequentador:** representa a pessoa que utiliza os serviços oferecidos pela X Personal Studio. É a entidade central do modelo, relacionada às matrículas, fichas de treino e avaliações físicas.
  - **Matrícula:** representa o vínculo do frequentador com a academia, registrando data de início, data final e status.
  - **Plano:** representa os planos oferecidos pela academia aos seus frequentadores.
  - **Ficha de Treino:** representa o registro utilizado para organizar as informações do treino do frequentador, incluindo objetivo e datas de criação/revisão.
  - **Funcionário:** representa os profissionais da organização responsáveis por determinadas ações relacionadas aos frequentadores (ex.: condução de avaliações físicas).
  - **Avaliação Física:** representa os registros obtidos durante o acompanhamento físico do frequentador, incluindo medidas corporais e observações médicas.

- **Atributos e classificações:** cada entidade possui um identificador único (`id`) como chave primária, além de atributos que representam suas características específicas (ex.: `nome`, `cpf`, `data_inicio`, `peso`, `objetivo`). Os detalhes completos estão no [Dicionário de Dados](./dicio_dados/dicionario.html).

- **Relacionamentos pertinentes:**
  - **recebe** conecta Frequentador e Ficha de Treino: um frequentador pode receber nenhuma ou várias fichas de treino ao longo do tempo; toda ficha pertence a exatamente um frequentador.
  - **possui** conecta Frequentador e Matrícula: um frequentador possui uma ou mais matrículas (histórico de renovações); toda matrícula pertence a exatamente um frequentador.
  - **compõe** conecta Matrícula e Plano: um plano pode compor nenhuma ou várias matrículas; toda matrícula está associada a exatamente um plano.
  - **possui** conecta Frequentador e Avaliação Física: um frequentador pode possuir nenhuma ou várias avaliações físicas; toda avaliação física pertence a exatamente um frequentador.
  - **avalia** conecta Funcionário e Avaliação Física: um funcionário pode realizar nenhuma ou várias avaliações físicas; toda avaliação física é conduzida por exatamente um funcionário.

- **Restrições e políticas organizacionais aplicadas ao modelo:** o modelo garante que registros como matrículas, avaliações e fichas de treino não existam sem associação a um frequentador (evitando registros órfãos), e considera a necessidade de controle de acesso e proteção dos dados pessoais e médicos armazenados no sistema.

---

## 7. Diagrama Entidade-Relacionamento (DER)

Para acessar o Diagrama Entidade-Relacionamento, acesse:
[DER](./diagramas/der_corrigido.png)

---

### Diagrama Entidade-Relacionamento (DER)

Para acessar o Diagrama Entidade-Relacionamento, acesse:
[DER](diagramas/conceitual_1.1.png)

---

## 8. Justificativa Técnica

A modelagem foi desenvolvida considerando os principais processos e informações identificados na X Personal Estudio.

A entidade **Frequentador** foi definida como uma das principais entidades do modelo por representar as pessoas que utilizam os serviços da academia. A partir dela são estabelecidos relacionamentos com matrícula, ficha de treino e avaliação física.

A entidade **Matrícula** foi separada da entidade Frequentador para representar o vínculo do aluno com a academia e armazenar informações específicas desse processo (data de início, data final e status), permitindo manter um histórico de renovações sem sobrescrever dados anteriores.

A entidade **Plano** foi criada para representar os diferentes planos oferecidos pela organização. Essa separação evita a duplicação de informações do plano em cada matrícula e permite que planos sejam cadastrados, alterados ou descontinuados de forma independente.

A entidade **Ficha de Treino** representa uma informação específica do acompanhamento do frequentador. Seus atributos permitem registrar o objetivo, a data de criação e a data de revisão da ficha.

A entidade **Avaliação Física** foi criada para organizar os dados relacionados ao acompanhamento físico dos frequentadores, permitindo registrar peso, altura, percentual de gordura, observações médicas e data da avaliação. Optou-se por vincular cada avaliação a **exatamente um** frequentador e a **exatamente um** funcionário responsável (cardinalidade 1:N em ambos os lados, e não N:M), pois uma avaliação física é, por natureza, um evento individual conduzido por um único profissional em um único aluno — essa escolha evita ambiguidades de autoria e de titularidade do registro.

A entidade **Funcionário** representa os profissionais envolvidos na organização e permite relacionar o responsável à realização das avaliações físicas.

A utilização de entidades separadas (em vez de agrupar tudo em Frequentador) reduz a repetição de informações e permite que o modelo seja ampliado futuramente — por exemplo, com o detalhamento de pagamentos, exercícios associados às fichas de treino, ou controle de frequência/acesso — sem a necessidade de alterar completamente sua estrutura conceitual.

As cardinalidades foram definidas de acordo com os vínculos reais observados na organização, buscando garantir que as informações permaneçam relacionadas de maneira coerente entre frequentadores, matrículas, planos, fichas de treino, funcionários e avaliações físicas, e evitando relacionamentos muitos-para-muitos que não correspondem à realidade do negócio.

---

---

### Uso de Inteligência Artificial

Durante a elaboração do projeto, foi utilizada a ferramenta **ChatGPT** como apoio à organização e revisão da documentação do trabalho. Posteriormente, o grupo também utilizou o **Claude (Anthropic)** para revisar a consistência entre o README, o Dicionário de Dados e o Diagrama Entidade-Relacionamento, e para corrigir divergências encontradas entre esses três artefatos.

| Item | O que registrar |
|------|------------------|
| **Ferramenta e etapa** | ChatGPT, utilizado durante a organização e elaboração do README.md, estruturação dos requisitos, regras de negócio e revisão textual. |
| **Motivação** | Utilizar a ferramenta como apoio para organizar as informações levantadas pelo grupo e estruturar a documentação de acordo com o modelo de entrega proposto. |
| **Prompt(s) utilizados** | "Chat me ajuda a montar o README do GitHub"; "monta o texto completo por favor com as suas sugestões". |
| **Resposta recebida** | A ferramenta auxiliou na organização das informações fornecidas pelo grupo, sugerindo uma estrutura para caracterização da organização, processos, requisitos funcionais e não funcionais, regras de negócio, dicionário de dados e justificativa técnica. |
| **Fontes consultadas e verificadas** | As informações específicas sobre a X Personal Estudio foram fornecidas pelo grupo a partir do levantamento realizado na organização. As sugestões geradas pela IA devem ser conferidas pelo grupo antes da versão final. |
| **Trechos rejeitados ou corrigidos** | Informações não confirmadas pela organização não devem ser apresentadas como fatos. O grupo deve revisar e substituir ou remover qualquer sugestão que não corresponda aos processos reais observados. |
| **Justificativa da escolha final** | As sugestões consideradas compatíveis com a organização e com o DER foram adaptadas e utilizadas na documentação. As decisões finais permanecem sob responsabilidade do grupo. |
| **Reflexão crítica** | A IA foi utilizada como ferramenta de apoio e não como fonte principal das informações da organização. Suas sugestões podem conter generalizações ou informações que não correspondam à realidade observada. Por isso, os requisitos, processos e regras de negócio devem ser validados pelo grupo com base na pesquisa de campo. |

---

### Versão
Versão: 0.1.0
Status: Em desenvolviment0
