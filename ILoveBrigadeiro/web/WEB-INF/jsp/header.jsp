<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/glider-js@1/glider.min.css">
    <link rel="stylesheet" href="./style/header.css">
</head>

<body>
    <header>
        <nav class="navbar navbar-expand-lg">
            <div class="container-fluid">
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <img class="logo" src="./assets/I LO E.png">
                    <p>I Love Brigadeiro <br> R. Belém, 844 - Centro, Londrina - PR, 86026-040</p>
                    <form class="d-flex" action="buscar-produtos" method="get">
                        <div class="container">
                            <div class="input-wrapper">
                                <i class="fa-solid fa-magnifying-glass"></i>
                                <input name="busca" type="search" placeholder="     Buscar por item da loja">
                            </div>
                        </div>

                    </form>
                    <div class="user-container">
                        <button id="user-button-open"><i class="fa-solid fa-user"></i></button>
                    </div>
                    <div class="basket-container">
                        <button id="basket"><i class="fa-solid fa-basket-shopping"></i></button>
                    </div>
                </div>
            </div>
        </nav>
    </header>
    <a href="./tela-login">Login</a>
    <a href="./tela-cadastro">Cadastro</a>
    <a href="./home">home</a>
    <a href="./cadastro-produto">cadastro produto</a>
</body>
<script src="https://kit.fontawesome.com/ffe7fbbd06.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/glider-js@1/glider.min.js"></script>
<script src="./js/header.js"></script>

</html>