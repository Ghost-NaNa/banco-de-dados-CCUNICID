# Modelagem de Banco de Dados para a X Personal Studio

## Introdução

A organização e o controle adequado das informações são importantes para o funcionamento de uma academia, principalmente quando existem diversos frequentadores, funcionários, planos, matrículas, avaliações físicas e fichas de treino.

A X Personal Studio, localizada em São Paulo - SP, atua no segmento de atividades físicas, com foco na prática de musculação. A academia possui aproximadamente 15 funcionários e oferece planos destinados aos frequentadores.

Atualmente, parte das informações relacionadas aos frequentadores e aos seus treinos é registrada por meio de fichas físicas em papel. Esse tipo de controle pode dificultar a organização, atualização, consulta e manutenção dos dados.

Diante desse cenário, o presente projeto tem como objetivo realizar a modelagem conceitual de um sistema de gerenciamento de informações para a X Personal Studio. O modelo busca representar os principais dados e processos da organização, considerando frequentadores, funcionários, matrículas, planos, fichas de treino e avaliações físicas.

O projeto está delimitado à etapa de levantamento e organização dos requisitos e à elaboração do Modelo Entidade-Relacionamento (DER), não contemplando, nesta etapa, a implementação do banco de dados ou o desenvolvimento completo do sistema.

## Desenvolvimento

### Caracterização da Organização

Para o desenvolvimento deste projeto, escolhemos a academia de musculação **X Personal Estudio**. A academia é de pequeno porte e atende principalmente ao público do bairro, contando com aproximadamente **15 funcionários**, entre instrutores, recepcionistas e equipe de limpeza, além de cerca de **200 frequentadores inscritos**.

A principal problemática identificada é a **ausência de um sistema específico para o gerenciamento das informações**, dificultando a organização e o controle dos dados da academia.

A instituição foi escolhida pela facilidade de comunicação com os envolvidos e pela **possibilidade de expansão do projeto**, além de apresentar relações entre diferentes informações, tornando-a um bom caso para o desenvolvimento de um banco de dados.

Como evidências da organização e do acesso do grupo, serão apresentados:
![comprovacao](./dicio_dados/imgs/dentro1.jpeg)
![comprovacao](./dicio_dados/imgs/dentro2.jpeg)
![comprovacao](./dicio_dados/imgs/fachada.jpeg)

### Processos de Negócio

**Principais processos mapeados:** o sistema contempla o cadastro e gerenciamento de frequentadores (alunos), funcionários, planos e matrículas, além do controle de pagamentos e acessos/frequência. Também são realizados processos relacionados ao acompanhamento físico e ao treinamento dos alunos, como o registro e gerenciamento de avaliações físicas e a criação, consulta, alteração e exclusão de fichas de treino pelos instrutores. O atendente pode consultar informações de planos, matrículas, pagamentos e frequência, enquanto o instrutor gerencia as fichas de treino e avaliações físicas. Já o aluno pode consultar seu plano, matrícula, ficha de treino e avaliação física.

## Requisitos Funcionais

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

## Requisitos Não Funcionais

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

O sistema deve considerar a necessidade de preservar a privacidade das informações dos frequentadores e funcionários. Os dados devem ser acessados somente por pessoas autorizadas pela organização.

Além disso, informações utilizadas como exemplos na documentação do projeto devem ser fictícias, não sendo utilizados dados reais de frequentadores ou funcionários.

### Dicionário de Dados Conceitual (Preliminar)
Para acessar o Diagrama Entidade-Relacionamento, acesse:
[Dicionário de dados](./dicio_dados/dicionario.md)

### Modelagem Conceitual (Entidades, Atributos, Relacionamentos)

- **Entidades reconhecidas:**

**Frequentador:** representa a pessoa que utiliza os serviços oferecidos pela X Personal Studio. É a entidade central do modelo, estando relacionada às matrículas, fichas de treino e avaliações físicas.

**Matrícula:** representa o vínculo do frequentador com a academia, registrando informações como data de início, data final e status.

**Plano:** representa os planos oferecidos pela academia aos seus frequentadores.

**Ficha de Treino:** representa o registro utilizado para organizar as informações relacionadas ao treino do frequentador, incluindo seu objetivo e datas de criação e revisão.

**Funcionário:** representa os profissionais envolvidos nas atividades da organização e responsáveis por determinadas ações relacionadas aos frequentadores.

**Avaliação Física:** representa os registros obtidos durante o acompanhamento físico do frequentador, incluindo medidas e observações.

- **Atributos e classificações:**

Cada entidade possui atributos responsáveis por representar suas principais informações. Os identificadores `id` e `id_plano` permitem diferenciar os registros, enquanto os demais atributos representam características específicas de cada entidade.

- **Relacionamentos pertinentes:**

O relacionamento **recebe** conecta Ficha de Treino e Frequentador, representando que uma ficha de treino pertence a um frequentador.

O relacionamento **possui** conecta Frequentador e Matrícula, representando o vínculo do frequentador com sua matrícula.

O relacionamento **compõe** conecta Matrícula e Plano, representando o plano associado à matrícula.

O relacionamento **possui** entre Frequentador e Avaliação Física representa os registros de avaliações realizados para cada frequentador.

O relacionamento **avalia** conecta Funcionário e Avaliação Física, representando o funcionário responsável pela realização da avaliação.

- **Restrições e políticas organizacionais aplicadas ao modelo:**

O modelo considera que os registros devem manter seus vínculos entre as entidades, evitando que informações como matrículas, avaliações e fichas de treino sejam armazenadas sem associação a um frequentador.

Também são consideradas as necessidades de controle de acesso e proteção dos dados pessoais armazenados no sistema.

### Diagrama Entidade-Relacionamento (DER)

Para acessar o Diagrama Entidade-Relacionamento, acesse:
[DER](./diagramas/Conceitual_1.png)

### Justificativa Técnica

A modelagem foi desenvolvida considerando os principais processos e informações identificados na X Personal Studio.

A entidade **Frequentador** foi definida como uma das principais entidades do modelo por representar as pessoas que utilizam os serviços da academia. A partir dela são estabelecidos relacionamentos com matrícula, ficha de treino e avaliação física.

A entidade **Matrícula** foi separada da entidade Frequentador para representar o vínculo do aluno com a academia e armazenar informações específicas desse processo, como data de início, data final e status.

A entidade **Plano** foi criada para representar os diferentes planos oferecidos pela organização. A separação permite que os planos sejam cadastrados e associados às matrículas sem duplicar suas informações.

A entidade **Ficha de Treino** representa uma informação específica do acompanhamento do frequentador. Seus atributos permitem registrar o objetivo, a data de criação e a data de revisão da ficha.

A entidade **Avaliação Física** foi criada para organizar os dados relacionados ao acompanhamento físico dos frequentadores, permitindo registrar peso, altura, percentual de gordura, observações médicas e data da avaliação.

A entidade **Funcionário** representa os profissionais envolvidos na organização e permite relacionar o responsável à realização das avaliações físicas.

A utilização de entidades separadas reduz a repetição de informações e permite que o modelo seja ampliado futuramente. Dessa forma, novas funcionalidades poderão ser incorporadas ao sistema sem a necessidade de alterar completamente sua estrutura conceitual.

As cardinalidades foram definidas de acordo com os vínculos representados no modelo, buscando garantir que as informações permaneçam relacionadas de maneira coerente entre frequentadores, matrículas, planos, fichas de treino, funcionários e avaliações físicas.

### Uso de Inteligência Artificial

Durante a elaboração do projeto, foi utilizada a ferramenta **ChatGPT** como apoio à organização e revisão da documentação do trabalho.

| Item | O que registrar |
|------|------------------|
| **Ferramenta e etapa** | ChatGPT, utilizado durante a organização e elaboração do README.md, estruturação dos requisitos, regras de negócio e revisão textual. |
| **Motivação** | Utilizar a ferramenta como apoio para organizar as informações levantadas pelo grupo e estruturar a documentação de acordo com o modelo de entrega proposto. |
| **Prompt(s) utilizados** | "Chat me ajuda a montar o README do GitHub"; "monta o texto completo por favor com as suas sugestões". |
| **Resposta recebida** | A ferramenta auxiliou na organização das informações fornecidas pelo grupo, sugerindo uma estrutura para caracterização da organização, processos, requisitos funcionais e não funcionais, regras de negócio, dicionário de dados e justificativa técnica. |
| **Fontes consultadas e verificadas** | As informações específicas sobre a X Personal Studio foram fornecidas pelo grupo a partir do levantamento realizado na organização. As sugestões geradas pela IA devem ser conferidas pelo grupo antes da versão final. |
| **Trechos rejeitados ou corrigidos** | Informações não confirmadas pela organização não devem ser apresentadas como fatos. O grupo deve revisar e substituir ou remover qualquer sugestão que não corresponda aos processos reais observados. |
| **Justificativa da escolha final** | As sugestões consideradas compatíveis com a organização e com o DER foram adaptadas e utilizadas na documentação. As decisões finais permanecem sob responsabilidade do grupo. |
| **Reflexão crítica** | A IA foi utilizada como ferramenta de apoio e não como fonte principal das informações da organização. Suas sugestões podem conter generalizações ou informações que não correspondam à realidade observada. Por isso, os requisitos, processos e regras de negócio devem ser validados pelo grupo com base na pesquisa de campo. |
