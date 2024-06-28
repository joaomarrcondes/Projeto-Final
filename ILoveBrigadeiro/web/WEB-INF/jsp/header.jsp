<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ page session="true" %>
            <!DOCTYPE html>
            <html lang="pt-br">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
                <link rel="stylesheet"
                    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/glider-js@1/glider.min.css">
                <link rel="stylesheet" href="./style/header.css">
                <link rel="stylesheet" href="./style/carrinho.css">
            </head>

            <body>
                <header>
                    <div class="container-header">
                        <div class="logo-container">
                            <a href="./home">
                                <img class="logo" src="./assets/ILoveBrigadeiro.png">
                            </a>
                            <p id="nome-endereco">I Love Brigadeiro <br> R. Belém, 844 - Centro, Londrina - PR,
                                86026-040</p>
                            <div class="input-pesquisa">
                                <form class="d-flex" action="buscar-produtos" method="get">
                                    <button id="btn-pesquisa" type="submit"><i
                                            class="fa-solid fa-magnifying-glass"></i></button>
                                    <input class="form-control me-2" name="busca" type="text"
                                        placeholder="O que você busca? (Ex.: Bolos)" id="inputBusca">
                                </form>
                            </div>
                            <nav>
                                <ul>
                                    <li class="dropdown">
                                        <c:choose>
                                            <c:when test="${!sessionScope.user.equals('admin')}">
                                                <a href="#"><i class="fa-solid fa-user"></i>
                                                    <br>
                                                    Perfil
                                                </a>
                                            </c:when>
                                        </c:choose>
                                        <div class="dropdown-menu">
                                            <c:choose>
                                                <c:when test="${empty sessionScope.user}">
                                                    <a id="btn-login" href="./tela-login">Login</a>
                                                    <a id="btn-cadastro" href="./tela-cadastro">Cadastro</a>
                                                </c:when>
                                                <c:otherwise>
                                                    <a href="./pedidos">Meus Pedidos</a>
                                                    <a href="./sair">Sair da Conta</a>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </li>
                                </ul>
                            </nav>
                            <div class="carrinho-container">
                                <c:choose>
                                    <c:when test="${!sessionScope.user.equals('admin')}">
                                        <button id="btn-abrir-carrinho">
                                            <i class="fa-solid fa-basket-shopping"></i>
                                            <br>
                                            Carrinho
                                        </button>
                                    </c:when>
                                </c:choose>
                            </div>
                            <div class="adm-container">
                                <c:choose>
                                    <c:when test="${sessionScope.user.equals('admin')}">
                                        <button id="btn-adm">
                                            <a href="./tela-adm">
                                                <i class="fa-solid fa-user-tie"></i>
                                                <br>
                                                Adm
                                            </a>
                                        </button>
                                        <button id="btn-adm">
                                            <a href="./sair">
                                                <i class="fa-solid fa-right-from-bracket"></i>
                                                <br>
                                                Sair
                                            </a>
                                        </button>
                                    </c:when>
                                </c:choose>
                            </div>
                        </div>
                        <div class="container-categorias">
                            <ul class="categoria">

                            </ul>
                        </div>
                        <div class="container-carrinho-compra">
                            <div id="carrinho-compras">
                                <div class="header-carrinho">
                                    <h4>Meu Carrinho</h4>
                                    <button id="btn-fechar-carrinho"><i class="fa-regular fa-circle-xmark"></i></button>
                                </div>
                                <div class="produtos-carrinho">
                                    <ul class="produtos">
                                    </ul>
                                </div>
                                <div class="carrinho-footer">
                                    <div class="btn-esvaziar">
                                        <input type="button" value="Esvaziar Carrinho" onclick="esvaziarCarrinho()">
                                    </div>
                                    <div class="subtotal">
                                        <h6>SUBTOTAL</h6>
                                        <div id="valor-total"></div>
                                    </div>
                                    <div class="finalizar-compra">
                                        <c:choose>
                                            <c:when test="${not empty sessionScope.user}">
                                                <a href="./finalizar-compra" id="btn-finalizar">
                                                    <button>Finalizar Compra</button>
                                                </a>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="#" id="btn-finalizar">
                                                    <button>Finalizar Compra</button>
                                                </a>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
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