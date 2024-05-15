<!DOCTYPE html>
<html lang="pt-br">

<head>
    <script src="https://kit.fontawesome.com/2283da70d2.js" crossorigin="anonymous"></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tela de Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="./style/login.css">
</head>

<body>
    <main>
        <div class="container">
            <div class="content first-content">
                <div class="first-column">
                    <img src="./assets/ILoveBrigadeiro.png" alt="logo">
                    <h2 id="titulo2">Bem-Vindo de Volta!</h2>
                    <span>Para se conectar conosco</span> <br>
                    <hr>
                    <span>crie uma conta com suas informações pessoais</span> <br>
                    <button id="btn-criar"><a href="">Criar uma Conta</a></button>
                </div>
                <div clas="second-column">
                    <h2>Login de Cliente</h2>
                    <h5>Clientes Registrados</h5>
                    <hr>
                    <span>Se você tiver uma conta, acesse com seu nome de usuário e senha.</span>
                    <form name="formLogin" action="login" method="post">
                        <div class="mb-3">
                            <i class="fa-solid fa-circle-user"></i>
                            <label for="inputUser" class="form-label">Usuário</label placeholder="Username">
                            <input name="user" class="form-control" type="text">
                        </div>
                        <div class="mb-3">
                            <i class="fa-solid fa-lock"></i>
                            <label for="inputPassword" class="form-label">Senha</label placeholder="Password">
                            <input name="password" class="form-control" type="text">
                        </div>
                        <br>
                        <input type="button" value="Fazer Login" onclick="validacao()">
                    </form>
                </div>
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