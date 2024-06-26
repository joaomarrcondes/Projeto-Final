<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="pt-br">

    <head>
        <link rel="icon" type="image/x-icon" href="./assets/ILoveBrigadeiro.png">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Tela de Cadastro</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="./style/cadastro.css">
    </head>

    <body>
        <main>
            <section class="containerr">
                <div class="container-esquerda">
                    <h2 id="titulo">Criar Nova Conta de Cliente</h2>
                    <h3 id="subtitulo1">Informações Pessoais</h3>
                    <hr id="linha1">
                    <form name="formCadastro" action="cadastro" method="post" class="formulario-cadastro">
                        <div class="mb-3">
                            <h6>Nome Completo</h6>
                            <input name="nome" class="form-control" type="text" id="inputNome"
                                placeholder="Nome Completo">
                        </div>
                        <div class="mb-3">
                            <h6>Telefone</h6>
                            <input name="telefone" class="form-control" id="inputTelefone" type="tel"
                                onkeyup="verificaTelefone(event)" maxlength="15" placeholder="(00)00000-0000">
                        </div>
                        <div class="mb-3">
                            <h6>Cpf</h6>
                            <input name="cpf" class="form-control" id="inputCpf" type="text"
                                onkeyup="verificaCpf(event)" maxlength="14" placeholder="000.000.000-00">
                        </div>
                        <div class="mb-3">
                            <h6>Data de Nascimento</h6>
                            <input name="data_nascimento" class="form-control" id="inputData" type="date">
                        </div>
                        <h3 id="subtitulo2">Informações de Acesso</h3>
                        <hr id="linha2">
                        <div class="mb-3">
                            <h6>Usuário</h6>
                            <input name="usuario" class="form-control" type="text" id="inputUsuario"
                                placeholder="Usuário">
                        </div>
                        <div class="mb-3">
                            <h6>Senha</h6>
                            <input name="senha" class="form-control" type="password" id="inputSenha"
                                placeholder="Mínimo de 8 caracteres">
                        </div>
                        <br>
                        <div class="btn-voltar-cadastro">
                            <a href="./home">
                                <button class="btn-voltar">Voltar</button>
                            </a>
                            <input id="btn-criar" type="button" value="Criar uma Conta" onclick="validacao()">
                        </div>
                        <div class="link-login">
                            <a href="./tela-login">
                                <span>Já possui uma conta? Entre agora</span>
                            </a>
                        </div>
                    </form>
                </div>
                <div class="container-direita">
                    <a href="./home">
                        <img src="./assets/ILoveBrigadeiro.png" alt="logo">
                    </a>
                    <h2 id="titulo2">Seja Bem-Vindo!</h2>
                    <span id="span1">Para se conectar conosco</span> <br>
                    <span>faça login com seu Usuário e Senha</span> <br>
                    <a href="./tela-login">
                        <button id="btn-entrar">Entrar</button>
                    </a>
                </div>
            </section>

        </main>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/notify/0.4.2/notify.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
            integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
            crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
            integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
            crossorigin="anonymous"></script>
        <script src="./js/cadastro.js"></script>
    </body>

    </html>