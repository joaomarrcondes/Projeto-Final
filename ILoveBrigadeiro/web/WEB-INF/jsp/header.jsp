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
                    <a href="./home">
                        <img class="logo" src="./assets/I LO E.png">
                    </a>
                    <p>I Love Brigadeiro <br> R. Belém, 844 - Centro, Londrina - PR, 86026-040</p>
                    <form class="d-flex" action="buscar-produtos" method="get">
                        <input class="form-control me-2" name="busca" type="search"
                            placeholder="Buscar por item da loja" aria-label="Search">
                        <button class="btn btn-outline-success" type="submit"><i
                                class="fa-solid fa-magnifying-glass"></i></button>
                    </form>
                    <div class="basket-container">
                        <i class="fa-solid fa-basket-shopping"></i>
                    </div>
                    <div class="user-container">
                        <i class="fa-solid fa-user"></i>
                        <div class="box">
                            <ul>
                                <li><a href="./tela-login">Login</a></li>
                                <li> <a href="./tela-cadastro">Cadastro</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </nav>
        <div class="container container-categorias">
            <c:forEach items="${categorias}" var="categoria">
                <div class="categoria">
                    <a href="./buscar-produtos?cat=${categoria.idCategoria}&busca=">${categoria.nome}</a>
                </div>
            </c:forEach>
        </div>
    </header>
</body>
<script src="https://kit.fontawesome.com/ffe7fbbd06.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/glider-js@1/glider.min.js"></script>
<script src="./js/header.js"></script>

</html>