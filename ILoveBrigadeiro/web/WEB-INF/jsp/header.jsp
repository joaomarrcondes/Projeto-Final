<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>

<body>
    <header>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="./home"><i class="fa-solid fa-house"></i></a>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">

                    <form class="d-flex" action="buscar-produtos" method="get">
                        <input class="form-control me-2" name="busca" type="search" placeholder="Search"
                            aria-label="Search">
                        <button class="btn btn-outline-success" type="submit">
                            <i class="fa-solid fa-magnifying-glass"></i>
                        </button>
                    </form>
                </div>
            </div>
            <div class="container container-categorias">
                <c:forEach items="${categorias}" var="categoria">
                    <div class="categoria">
                        <a href="./buscar-produtos?cat=${categoria.idCategoria}&busca=">${categoria.nome}</a>
                    </div>
                </c:forEach>
            </div>
        </nav>
    </header>
    <a href="./tela-login">Login</a> <br>
    <a href="./tela-cadastro">Cadastro</a> <br>
    <a href="./home">home</a> <br>
    <a href="./cadastro-produto">cadastro produto</a>
</body>
<script src="https://kit.fontawesome.com/ffe7fbbd06.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</html>