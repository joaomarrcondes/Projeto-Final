<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="pt-br">

    <head>
        <script src="https://kit.fontawesome.com/2283da70d2.js" crossorigin="anonymous"></script>
        <meta charset=ISO-8859-1>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Tela de Login</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="./style/login.css">
    </head>

    <body>
        <main>
            <div class="container-login">
                <div class="first-column">
                    <a href="./home">
                        <img src="./assets/ILoveBrigadeiro.png" alt="logo">
                    </a>
                    <h2 id="titulo2">Bem-Vindo de Volta!</h2>
                    <span>Para se conectar conosco</span> <br>
                    <span>crie uma conta com suas informações pessoais</span> <br>
                    <a href="./tela-cadastro">
                        <button id="btn-criar">Criar uma Conta</button>
                    </a>
                </div>
                <div class="second-column">
                    <h2 id="titulo1">Login de Cliente</h2>
                    <h5 id="subtitulo">Clientes Registrados</h5>
                    <hr id="linha">
                    <span id="texto-span">Se você tiver uma conta, acesse com seu nome de usuário e senha.</span>
                    <form name="formLogin" action="login" method="post">
                        <div class="mb-3">
                            <i class="fa-solid fa-circle-user"></i>
                            <h6>Usuário</h6>
                            <input name="user" class="form-control" type="text" placeholder="Username">
                        </div>
                        <div class="mb-3">
                            <i class="fa-solid fa-lock"></i>
                            <h6>Senha</h6>
                            <input name="password" class="form-control" type="text" placeholder="Password">
                            <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                            <label class="form-check-label" for="flexCheckChecked">Lembre-me</label>
                        </div>
                        <input id="btn-fazer-login" type="button" value="Fazer Login" onclick="validacao()">
                    </form>
                </div>
            </div>
        </main>
    </body>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
        integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
        integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>
    <script src="./js/login.js"></script>

    </html>