<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>BlueFit | Dicionário de Dados</title>

    <style>

        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap');

        :root {
            --blue: #087cff;
            --blue-light: #19a7ff;
            --dark: #070b12;
            --dark-2: #0d131d;
            --card: #111925;
            --card-2: #151e2b;
            --text: #f5f7fa;
            --muted: #8e9aaa;
            --border: rgba(255,255,255,0.08);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        html {
            scroll-behavior: smooth;
        }

        body {
            font-family: 'Inter', Arial, sans-serif;
            background:
                radial-gradient(circle at 80% 10%, rgba(0, 119, 255, 0.15), transparent 30%),
                radial-gradient(circle at 10% 50%, rgba(0, 119, 255, 0.08), transparent 25%),
                var(--dark);
            color: var(--text);
            line-height: 1.7;
        }

        /* =========================
           SIDEBAR
        ========================= */

        .sidebar {
            position: fixed;
            left: 0;
            top: 0;
            width: 250px;
            height: 100vh;
            background: rgba(8, 12, 19, 0.95);
            border-right: 1px solid var(--border);
            padding: 30px 20px;
            z-index: 1000;
            backdrop-filter: blur(15px);
        }

        .logo {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 45px;
        }

        .logo-icon {
            width: 42px;
            height: 42px;
            border-radius: 10px;
            background: linear-gradient(135deg, var(--blue), var(--blue-light));
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 21px;
            font-weight: 800;
            box-shadow: 0 0 25px rgba(0, 132, 255, .35);
        }

        .logo-text {
            font-size: 20px;
            font-weight: 800;
            letter-spacing: -1px;
        }

        .logo-text span {
            color: var(--blue-light);
        }

        .menu-title {
            color: #566273;
            font-size: 11px;
            font-weight: 700;
            letter-spacing: 1.5px;
            text-transform: uppercase;
            margin: 25px 10px 12px;
        }

        .sidebar a {
            display: block;
            padding: 11px 13px;
            margin: 5px 0;
            color: var(--muted);
            text-decoration: none;
            border-radius: 8px;
            font-size: 13px;
            transition: .25s;
        }

        .sidebar a:hover {
            color: white;
            background: rgba(0, 132, 255, .1);
            transform: translateX(4px);
        }

        /* =========================
           MAIN
        ========================= */

        .main {
            margin-left: 250px;
            padding: 0 50px 60px;
        }

        /* =========================
           HERO
        ========================= */

        .hero {
            min-height: 420px;
            display: flex;
            align-items: center;
            position: relative;
            overflow: hidden;
            border-bottom: 1px solid var(--border);
        }

        .hero::before {
            content: "";
            position: absolute;
            width: 500px;
            height: 500px;
            background: var(--blue);
            filter: blur(180px);
            opacity: .15;
            right: -100px;
            top: -150px;
        }

        .hero-content {
            position: relative;
            z-index: 2;
            max-width: 850px;
        }

        .tag {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            background: rgba(0, 132, 255, .1);
            border: 1px solid rgba(0, 132, 255, .25);
            color: #42b5ff;
            padding: 7px 14px;
            border-radius: 30px;
            font-size: 11px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 20px;
        }

        .tag::before {
            content: "";
            width: 7px;
            height: 7px;
            background: #18a7ff;
            border-radius: 50%;
            box-shadow: 0 0 10px #18a7ff;
        }

        .hero h1 {
            font-size: clamp(40px, 5vw, 72px);
            line-height: 1;
            letter-spacing: -3px;
            margin-bottom: 20px;
        }

        .hero h1 span {
            color: var(--blue-light);
        }

        .hero p {
            max-width: 700px;
            color: var(--muted);
            font-size: 16px;
        }

        /* =========================
           SECTIONS
        ========================= */

        section {
            padding: 70px 0 20px;
            scroll-margin-top: 20px;
        }

        .section-header {
            margin-bottom: 30px;
        }

        .section-number {
            color: var(--blue-light);
            font-size: 12px;
            font-weight: 800;
            letter-spacing: 2px;
            margin-bottom: 7px;
        }

        h2 {
            font-size: 30px;
            letter-spacing: -1px;
        }

        .section-description {
            color: var(--muted);
            margin-top: 7px;
            max-width: 800px;
        }

        /* =========================
           CARDS
        ========================= */

        .cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 15px;
            margin-top: 25px;
        }

        .card {
            background: linear-gradient(145deg, var(--card), var(--card-2));
            border: 1px solid var(--border);
            border-radius: 14px;
            padding: 23px;
            transition: .3s;
        }

        .card:hover {
            transform: translateY(-4px);
            border-color: rgba(0, 132, 255, .4);
            box-shadow: 0 10px 40px rgba(0, 0, 0, .25);
        }

        .card h3 {
            color: white;
            font-size: 17px;
            margin-bottom: 10px;
        }

        .card p {
            color: var(--muted);
            font-size: 13px;
        }

        /* =========================
           TABLES
        ========================= */

        .table-container {
            width: 100%;
            overflow-x: auto;
            border: 1px solid var(--border);
            border-radius: 14px;
            background: var(--card);
        }

        table {
            width: 100%;
            min-width: 700px;
            border-collapse: collapse;
        }

        th {
            background: #151e2b;
            color: #55baff;
            text-align: left;
            padding: 15px 18px;
            font-size: 12px;
            text-transform: uppercase;
            letter-spacing: .5px;
            border-bottom: 1px solid var(--border);
        }

        td {
            padding: 15px 18px;
            color: #c5ccd5;
            font-size: 13px;
            border-bottom: 1px solid var(--border);
        }

        tr:last-child td {
            border-bottom: none;
        }

        tr:hover td {
            background: rgba(0, 132, 255, .035);
        }

        td:first-child {
            color: white;
            font-weight: 600;
        }

        /* =========================
           FLUXO
        ========================= */

        .flow {
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            justify-content: center;
            gap: 10px;
            padding: 35px 25px;
            background:
                linear-gradient(145deg, #0d1724, #0b111a);
            border: 1px solid var(--border);
            border-radius: 15px;
        }

        .flow-item {
            padding: 13px 18px;
            background: #121e2c;
            border: 1px solid rgba(0, 132, 255, .25);
            border-radius: 8px;
            font-size: 12px;
            font-weight: 700;
            color: #dce8f4;
        }

        .arrow {
            color: var(--blue-light);
            font-size: 20px;
            font-weight: bold;
        }

        /* =========================
           CODE
        ========================= */

        .code-box {
            background: #05080d;
            border: 1px solid var(--border);
            border-radius: 14px;
            overflow-x: auto;
            box-shadow: inset 0 0 40px rgba(0,0,0,.3);
        }

        pre {
            padding: 28px;
            color: #72c8ff;
            font-family: 'Courier New', monospace;
            font-size: 13px;
            line-height: 2;
        }

        /* =========================
           ENTITY
        ========================= */

        .entity-title {
            display: flex;
            align-items: center;
            gap: 12px;
            margin: 50px 0 18px;
        }

        .entity-icon {
            width: 38px;
            height: 38px;
            border-radius: 9px;
            background: rgba(0, 132, 255, .12);
            border: 1px solid rgba(0, 132, 255, .25);
            display: flex;
            align-items: center;
            justify-content: center;
            color: #43b8ff;
            font-weight: 800;
            font-size: 13px;
        }

        .entity-title h3 {
            font-size: 20px;
        }

        /* =========================
           PREFIX
        ========================= */

        code {
            background: rgba(0, 132, 255, .1);
            color: #55c2ff;
            padding: 4px 8px;
            border-radius: 5px;
            font-family: Consolas, monospace;
            font-size: 12px;
        }

        /* =========================
           FOOTER
        ========================= */

        footer {
            margin-top: 80px;
            padding: 35px;
            text-align: center;
            border-top: 1px solid var(--border);
            color: #626e7d;
            font-size: 12px;
        }

        footer strong {
            color: #40b7ff;
        }

        /* =========================
           RESPONSIVE
        ========================= */

        @media (max-width: 900px) {

            .sidebar {
                position: relative;
                width: 100%;
                height: auto;
                padding: 18px;
                border-right: none;
                border-bottom: 1px solid var(--border);
            }

            .logo {
                margin-bottom: 15px;
            }

            .sidebar nav {
                display: flex;
                overflow-x: auto;
                gap: 5px;
            }

            .sidebar a {
                white-space: nowrap;
            }

            .menu-title {
                display: none;
            }

            .main {
                margin-left: 0;
                padding: 0 20px 40px;
            }

            .hero {
                min-height: 350px;
            }

            .hero h1 {
                letter-spacing: -2px;
            }
        }

        @media (max-width: 600px) {

            .hero h1 {
                font-size: 42px;
            }

            section {
                padding-top: 50px;
            }

            .flow {
                flex-direction: column;
            }

            .arrow {
                transform: rotate(90deg);
            }
        }

    </style>
</head>


<body>

<!-- =========================
     MENU LATERAL
========================= -->

<aside class="sidebar">

    <div class="logo">

        <div class="logo-icon">
            B
        </div>

        <div class="logo-text">
            BLUE<span>FIT</span>
        </div>

    </div>

    <div class="menu-title">
        Navegação
    </div>

    <nav>

        <a href="#modelo">
            01 · Modelo Conceitual
        </a>

        <a href="#fluxo">
            02 · Fluxo de Dados
        </a>

        <a href="#convencoes">
            03 · Convenções
        </a>

        <a href="#estrutura">
            04 · Estrutura Formal
        </a>

        <a href="#dicionario">
            05 · Dicionário
        </a>

    </nav>

</aside>


<!-- =========================
     CONTEÚDO
========================= -->

<main class="main">


    <!-- HERO -->

    <header class="hero">

        <div class="hero-content">

            <div class="tag">
                Database Documentation
            </div>

            <h1>
                Dicionário<br>
                de <span>Dados</span>
            </h1>

            <p>
                Sistema de Gestão de Academia — BlueFit.
                Documentação conceitual das entidades, atributos,
                relacionamentos e regras de negócio do sistema.
            </p>

        </div>

    </header>


    <!-- =========================
         MODELO
    ========================= -->

    <section id="modelo">

        <div class="section-header">

            <div class="section-number">
                01 / MODELO
            </div>

            <h2>Modelo Conceitual</h2>

            <p class="section-description">
                Representação das principais entidades do sistema
                e seus relacionamentos.
            </p>

        </div>

        <div class="cards">

            <div class="card">
                <h3>FICHA_DE_TREINO</h3>

                <p>
                    Documento que orienta os exercícios de um
                    frequentador, com objetivo definido e revisão
                    periódica.
                </p>
            </div>

            <div class="card">
                <h3>FREQUENTADOR</h3>

                <p>
                    Pessoa física cadastrada que utiliza os serviços
                    oferecidos pela academia.
                </p>
            </div>

            <div class="card">
                <h3>MATRICULA</h3>

                <p>
                    Vínculo contratual entre o frequentador e o
                    plano escolhido.
                </p>
            </div>

            <div class="card">
                <h3>PLANO</h3>

                <p>
                    Oferta comercial da academia que pode compor
                    uma ou várias matrículas.
                </p>
            </div>

            <div class="card">
                <h3>FUNCIONARIO</h3>

                <p>
                    Pessoa que trabalha na academia, podendo atuar
                    na recepção, instrutoria ou gestão.
                </p>
            </div>

            <div class="card">
                <h3>AVALIACAO_FISICA</h3>

                <p>
                    Registro periódico das medidas corporais e
                    observações realizadas por um funcionário.
                </p>
            </div>

        </div>


        <h3 style="margin:40px 0 15px;">
            Relacionamentos
        </h3>


        <div class="table-container">

            <table>

                <thead>

                    <tr>
                        <th>Entidade</th>
                        <th>Relaciona-se com</th>
                        <th>Cardinalidade</th>
                    </tr>

                </thead>

                <tbody>

                    <tr>
                        <td>FICHA_DE_TREINO</td>
                        <td>FREQUENTADOR</td>
                        <td>1:1 → N</td>
                    </tr>

                    <tr>
                        <td>FREQUENTADOR</td>
                        <td>MATRICULA</td>
                        <td>1:N</td>
                    </tr>

                    <tr>
                        <td>MATRICULA</td>
                        <td>PLANO</td>
                        <td>N:1</td>
                    </tr>

                    <tr>
                        <td>FUNCIONARIO</td>
                        <td>AVALIACAO_FISICA</td>
                        <td>1:N</td>
                    </tr>

                    <tr>
                        <td>FREQUENTADOR</td>
                        <td>AVALIACAO_FISICA</td>
                        <td>N:M</td>
                    </tr>

                </tbody>

            </table>

        </div>

    </section>


    <!-- =========================
         FLUXO
    ========================= -->

    <section id="fluxo">

        <div class="section-header">

            <div class="section-number">
                02 / PROCESSO
            </div>

            <h2>Fluxo de Dados</h2>

            <p class="section-description">
                Visão simplificada do funcionamento do sistema.
            </p>

        </div>


        <div class="flow">

            <div class="flow-item">
                FREQUENTADOR
            </div>

            <div class="arrow">→</div>

            <div class="flow-item">
                CADASTRO
            </div>

            <div class="arrow">→</div>

            <div class="flow-item">
                PLANO
            </div>

            <div class="arrow">→</div>

            <div class="flow-item">
                MATRICULA
            </div>

            <div class="arrow">→</div>

            <div class="flow-item">
                FICHA DE TREINO
            </div>

            <div class="arrow">→</div>

            <div class="flow-item">
                AVALIAÇÃO
            </div>

        </div>

    </section>


    <!-- =========================
         CONVENÇÕES
    ========================= -->

    <section id="convencoes">

        <div class="section-header">

            <div class="section-number">
                03 / PADRÕES
            </div>

            <h2>Convenções do Dicionário</h2>

        </div>


        <div class="table-container">

            <table>

                <thead>

                    <tr>
                        <th>Símbolo</th>
                        <th>Significado</th>
                    </tr>

                </thead>

                <tbody>

                    <tr>
                        <td>=</td>
                        <td>É composto de</td>
                    </tr>

                    <tr>
                        <td>+</td>
                        <td>E — conecta elementos obrigatórios</td>
                    </tr>

                    <tr>
                        <td>( )</td>
                        <td>Elemento opcional</td>
                    </tr>

                    <tr>
                        <td>{ } / n{ }m</td>
                        <td>Iteração com limite mínimo e máximo</td>
                    </tr>

                    <tr>
                        <td>[ | ]</td>
                        <td>Escolha obrigatória entre alternativas</td>
                    </tr>

                    <tr>
                        <td>/ /</td>
                        <td>Rótulo de um grupo repetitivo</td>
                    </tr>

                    <tr>
                        <td>@</td>
                        <td>Identificador / chave primária</td>
                    </tr>

                    <tr>
                        <td>* *</td>
                        <td>Comentário fora da estrutura formal</td>
                    </tr>

                </tbody>

            </table>

        </div>


        <h3 style="margin:40px 0 15px;">
            Prefixos
        </h3>


        <div class="table-container">

            <table>

                <thead>

                    <tr>
                        <th>Prefixo</th>
                        <th>Significado</th>
                    </tr>

                </thead>

                <tbody>

                    <tr>
                        <td><code>NM_</code></td>
                        <td>Nome</td>
                    </tr>

                    <tr>
                        <td><code>DT_</code></td>
                        <td>Data</td>
                    </tr>

                    <tr>
                        <td><code>ID_</code></td>
                        <td>Identificador</td>
                    </tr>

                    <tr>
                        <td><code>CD_</code></td>
                        <td>Código de domínio</td>
                    </tr>

                    <tr>
                        <td><code>QT_</code></td>
                        <td>Quantidade</td>
                    </tr>

                    <tr>
                        <td><code>TP_</code></td>
                        <td>Tipo / categorização</td>
                    </tr>

                    <tr>
                        <td><code>IN_</code></td>
                        <td>Indicador booleano</td>
                    </tr>

                    <tr>
                        <td><code>DS_</code></td>
                        <td>Descrição / texto livre</td>
                    </tr>

                </tbody>

            </table>

        </div>

    </section>


    <!-- =========================
         ESTRUTURA FORMAL
    ========================= -->

    <section id="estrutura">

        <div class="section-header">

            <div class="section-number">
                04 / ESTRUTURA
            </div>

            <h2>Estrutura Formal</h2>

            <p class="section-description">
                Definição formal dos elementos que compõem cada entidade.
            </p>

        </div>


        <div class="code-box">

<pre>
FICHA_DE_TREINO =
@ID_FICHA_TREINO +
ID_FREQUENTADOR +
DT_CRIACAO +
(DT_REVISAO) +
TP_OBJETIVO


FREQUENTADOR =
@ID_FREQUENTADOR +
NM_FREQUENTADOR +
ID_CPF +
IN_PAGAMENTO_EM_DIA


MATRICULA =
@ID_MATRICULA +
ID_FREQUENTADOR +
ID_PLANO +
DT_INICIO +
(DT_FINAL) +
TP_STATUS


PLANO =
@ID_PLANO +
NM_PLANO


FUNCIONARIO =
@ID_FUNCIONARIO +
NM_FUNCIONARIO +
ID_CPF +
TP_CARGO +
(DS_ESPECIALIDADE) +
DS_SENHA_HASH


AVALIACAO_FISICA =
@ID_AVALIACAO +
ID_FUNCIONARIO +
DT_AVALIACAO +
QT_PESO +
QT_ALTURA +
QT_PERCENTUAL_GORDURA +
(DS_OBSERVACOES_MEDICAS)
</pre>

        </div>

    </section>


    <!-- =========================
         DICIONÁRIO
    ========================= -->

    <section id="dicionario">

        <div class="section-header">

            <div class="section-number">
                05 / ATRIBUTOS
            </div>

            <h2>Dicionário de Dados</h2>

            <p class="section-description">
                Atributos, descrições e regras de negócio de cada entidade.
            </p>

        </div>


        <!-- FICHA -->

        <div class="entity-title">

            <div class="entity-icon">
                FT
            </div>

            <h3>FICHA_DE_TREINO</h3>

        </div>


        <div class="table-container">

            <table>

                <thead>
                    <tr>
                        <th>Atributo</th>
                        <th>Descrição</th>
                        <th>Regra de Negócio</th>
                    </tr>
                </thead>

                <tbody>

                    <tr>
                        <td>ID_FICHA_TREINO</td>
                        <td>Identificador único da ficha</td>
                        <td>Chave primária; gerada automaticamente</td>
                    </tr>

                    <tr>
                        <td>ID_FREQUENTADOR</td>
                        <td>Referência ao frequentador</td>
                        <td>Obrigatório; toda ficha pertence a um frequentador</td>
                    </tr>

                    <tr>
                        <td>DT_CRIACAO</td>
                        <td>Data de criação da ficha</td>
                        <td>Obrigatório</td>
                    </tr>

                    <tr>
                        <td>DT_REVISAO</td>
                        <td>Data da última atualização</td>
                        <td>Opcional</td>
                    </tr>

                    <tr>
                        <td>TP_OBJETIVO</td>
                        <td>Finalidade do treino</td>
                        <td>Hipertrofia, emagrecimento, condicionamento, reabilitação ou outro</td>
                    </tr>

                </tbody>

            </table>

        </div>


        <!-- FREQUENTADOR -->

        <div class="entity-title">

            <div class="entity-icon">
                FR
            </div>

            <h3>FREQUENTADOR</h3>

        </div>


        <div class="table-container">

            <table>

                <thead>
                    <tr>
                        <th>Atributo</th>
                        <th>Descrição</th>
                        <th>Regra de Negócio</th>
                    </tr>
                </thead>

                <tbody>

                    <tr>
                        <td>ID_FREQUENTADOR</td>
                        <td>Identificador único</td>
                        <td>Chave primária; gerado automaticamente</td>
                    </tr>

                    <tr>
                        <td>NM_FREQUENTADOR</td>
                        <td>Nome completo</td>
                        <td>Obrigatório</td>
                    </tr>

                    <tr>
                        <td>ID_CPF</td>
                        <td>Documento civil</td>
                        <td>Obrigatório e único</td>
                    </tr>

                    <tr>
                        <td>IN_PAGAMENTO_EM_DIA</td>
                        <td>Indica se o pagamento está em dia</td>
                        <td>Obrigatório; valores: sim/não</td>
                    </tr>

                </tbody>

            </table>

        </div>


        <!-- MATRICULA -->

        <div class="entity-title">

            <div class="entity-icon">
                MT
            </div>

            <h3>MATRICULA</h3>

        </div>


        <div class="table-container">

            <table>

                <thead>
                    <tr>
                        <th>Atributo</th>
                        <th>Descrição</th>
                        <th>Regra de Negócio</th>
                    </tr>
                </thead>

                <tbody>

                    <tr>
                        <td>ID_MATRICULA</td>
                        <td>Identificador da matrícula</td>
                        <td>Chave primária; gerado automaticamente</td>
                    </tr>

                    <tr>
                        <td>ID_FREQUENTADOR</td>
                        <td>Frequentador titular</td>
                        <td>Obrigatório</td>
                    </tr>

                    <tr>
                        <td>ID_PLANO</td>
                        <td>Plano contratado</td>
                        <td>Obrigatório; plano deve estar ativo</td>
                    </tr>

                    <tr>
                        <td>DT_INICIO</td>
                        <td>Início da matrícula</td>
                        <td>Obrigatório</td>
                    </tr>

                    <tr>
                        <td>DT_FINAL</td>
                        <td>Data de encerramento</td>
                        <td>Opcional</td>
                    </tr>

                    <tr>
                        <td>TP_STATUS</td>
                        <td>Situação da matrícula</td>
                        <td>Ativa, Suspensa, Cancelada ou Concluída</td>
                    </tr>

                </tbody>

            </table>

        </div>


        <!-- PLANO -->

        <div class="entity-title">

            <div class="entity-icon">
                PL
            </div>

            <h3>PLANO</h3>

        </div>


        <div class="table-container">

            <table>

                <thead>
                    <tr>
                        <th>Atributo</th>
                        <th>Descrição</th>
                        <th>Regra de Negócio</th>
                    </tr>
                </thead>

                <tbody>

                    <tr>
                        <td>ID_PLANO</td>
                        <td>Identificador do plano</td>
                        <td>Chave primária; gerado automaticamente</td>
                    </tr>

                    <tr>
                        <td>NM_PLANO</td>
                        <td>Nome comercial</td>
                        <td>Obrigatório; nomes devem ser únicos</td>
                    </tr>

                </tbody>

            </table>

        </div>


        <!-- FUNCIONARIO -->

        <div class="entity-title">

            <div class="entity-icon">
                FN
            </div>

            <h3>FUNCIONARIO</h3>

        </div>


        <div class="table-container">

            <table>

                <thead>
                    <tr>
                        <th>Atributo</th>
                        <th>Descrição</th>
                        <th>Regra de Negócio</th>
                    </tr>
                </thead>

                <tbody>

                    <tr>
                        <td>ID_FUNCIONARIO</td>
                        <td>Identificador do funcionário</td>
                        <td>Chave primária; gerado automaticamente</td>
                    </tr>

                    <tr>
                        <td>NM_FUNCIONARIO</td>
                        <td>Nome completo</td>
                        <td>Obrigatório</td>
                    </tr>

                    <tr>
                        <td>ID_CPF</td>
                        <td>Documento civil</td>
                        <td>Obrigatório e único</td>
                    </tr>

                    <tr>
                        <td>TP_CARGO</td>
                        <td>Função exercida</td>
                        <td>Instrutor, recepcionista, gerente etc.</td>
                    </tr>

                    <tr>
                        <td>DS_ESPECIALIDADE</td>
                        <td>Especialidade</td>
                        <td>Opcional</td>
                    </tr>

                    <tr>
                        <td>DS_SENHA_HASH</td>
                        <td>Credencial de acesso</td>
                        <td>Obrigatório; armazenada somente em hash</td>
                    </tr>

                </tbody>

            </table>

        </div>


        <!-- AVALIAÇÃO -->

        <div class="entity-title">

            <div class="entity-icon">
                AF
            </div>

            <h3>AVALIACAO_FISICA</h3>

        </div>


        <div class="table-container">

            <table>

                <thead>
                    <tr>
                        <th>Atributo</th>
                        <th>Descrição</th>
                        <th>Regra de Negócio</th>
                    </tr>
                </thead>

                <tbody>

                    <tr>
                        <td>ID_AVALIACAO</td>
                        <td>Identificador da avaliação</td>
                        <td>Chave primária; gerado automaticamente</td>
                    </tr>

                    <tr>
                        <td>ID_FUNCIONARIO</td>
                        <td>Funcionário responsável</td>
                        <td>Obrigatório</td>
                    </tr>

                    <tr>
                        <td>DT_AVALIACAO</td>
                        <td>Data da avaliação</td>
                        <td>Obrigatório</td>
                    </tr>

                    <tr>
                        <td>QT_PESO</td>
                        <td>Peso corporal em kg</td>
                        <td>Obrigatório</td>
                    </tr>

                    <tr>
                        <td>QT_ALTURA</td>
                        <td>Altura em metros</td>
                        <td>Obrigatório; utilizada para cálculo do IMC</td>
                    </tr>

                    <tr>
                        <td>QT_PERCENTUAL_GORDURA</td>
                        <td>Percentual de gordura</td>
                        <td>Obrigatório</td>
                    </tr>

                    <tr>
                        <td>DS_OBSERVACOES_MEDICAS</td>
                        <td>Observações do avaliador</td>
                        <td>Opcional</td>
                    </tr>

                </tbody>

            </table>

        </div>

    </section>


    <!-- FOOTER -->

    <footer>

        <strong>BLUEFIT</strong>

        <br>

        Sistema de Gestão de Academia · Dicionário de Dados

        <br><br>

        Documentação de Banco de Dados

    </footer>

</main>

</body>
</html>
