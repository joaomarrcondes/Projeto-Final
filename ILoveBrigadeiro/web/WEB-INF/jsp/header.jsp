<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="pt-br">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/glider-js@1/glider.min.css">
        <link rel="stylesheet" href="./style/header.css">
        <link rel="stylesheet" href="./style/carrinho.css">
    </head>

    <body>
        <header>
            <div class="container-header">
                <div class="logo-container">
                    <img class="logo" src="./assets/ILoveBrigadeiro.png">
                    <p id="nome-endereco">I Love Brigadeiro <br> R. Belém, 844 - Centro, Londrina - PR, 86026-040</p>
                    <div class="input-pesquisa">
                        <form class="d-flex" action="buscar-produtos" method="get">
                            <button id="btn-pesquisa" type="submit"><i
                                    class="fa-solid fa-magnifying-glass"></i></button>
                            <input class="form-control me-2" name="busca" type="search"
                                placeholder="Buscar por item da loja" aria-label="Search">
                        </form>
                    </div>
                    <nav>
                        <ul>
                            <li class="dropdown">
                                <a href="#"><i class="fa-solid fa-user"></i>
                                    <br>
                                    Perfil
                                </a>
                                <div class="dropdown-menu">
                                    <a id="btn-login" href="./tela-login">Login</a>
                                    <a id="btn-cadastro" href="./tela-cadastro">Cadastro</a>
                                </div>
                            </li>
                        </ul>
                    </nav>
                    <div class="carrinho-container">
                        <button id="btn-abrir-carrinho">
                            <i class="fa-solid fa-basket-shopping"></i>
                            <br>
                            Carrinho
                        </button>
                    </div>
                    <div class="pedidos-container">
                        <button id="btn-pedidos">
                            <i class="fa-solid fa-receipt"></i>
                            <br>
                            Pedidos
                        </button>
                    </div>
                    <div class="adm-container">
                        <button id="btn-adm">
                            <a href="./tela-adm">
                                <i class="fa-solid fa-user-tie"></i>
                                <br>
                                Adm
                            </a>
                        </button>
                    </div>
                </div>
                <div class="container-categorias">
                    <c:forEach items="${categorias}" var="categoria">
                        <div class="categoria">
                            <a class="categoria-link"
                                href="./buscar-produtos?cat=${categoria.idCategoria}&busca=">${categoria.nome}</a>
                        </div>
                    </c:forEach>
                </div>
                <div class="container-carrinho-compra">
                    <div id="carrinho-compras">
                        <div class="header-carrinho">
                            <h4>Meu Carrinho</h4>
                            <button id="btn-fechar-carrinho"><i class="fa-solid fa-xmark"></i></button>
                        </div>
                        <div class="itens-cart-ul">
                            <ul class="list-group-item">
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div id="background"></div>
        </header>
    </body>
    <script src="https://kit.fontawesome.com/ffe7fbbd06.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/glider-js@1/glider.min.js"></script>
    <script src="./js/header.js"></script>
    <script src="./js/carrinho.js"></script>
    <script src="./js/menu-user.js"></script>

    </html>