<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
        <!DOCTYPE html>
        <html lang="pt-br">

        <head>
            <link rel="icon" type="image/x-icon" href="./assets/ILoveBrigadeiro.png">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
                crossorigin="anonymous">
            <meta charset="UTF-8">
            <script src="https://kit.fontawesome.com/52a6b206fa.js" crossorigin="anonymous"></script>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link rel="stylesheet" href="./style/checkout.css">
        </head>

        <body>
            <header>
                <div class="header-checkout">
                    <a href="./home">
                        <img class="logo" src="./assets/ILoveBrigadeiro.png">
                    </a>
                    <p id="nome-endereco">I Love Brigadeiro <br> R. Belém, 844 - Centro, Londrina - PR,
                        86026-040</p>
                </div>
            </header>
            <main>
                <div class="container">
                    <h1>Cadastro de Produtos</h1>
                    <form action="inserir-produtos" enctype="multipart/form-data" method="post">
                        <h6>Selecione uma Imagem</h6>
                        <input type="file" name="imagem" class="form-control">
                        <h6>Nome do Produto</h6>
                        <input type="text" name="nome" class="form-control" placeholder="Nome do produto">
                        <h6>Valor Unitário</h6>
                        <input type="text" name="valor" class="form-control" placeholder="Valor do produto">
                        <h6>Categoria do Produto</h6>
                        <input type="text" name="categoria" class="form-control" placeholder="Categoria do produto">
                        <h6>Quantidade no Estoque</h6>
                        <input type="text" name="quantidade" class="form-control" placeholder="Quantidade do produto">
                        <h6>Descrição</h6>
                        <textarea class="form-control" name="descricao" aria-label="With textarea"></textarea>
                        <input type="submit" value="Salvar">
                    </form>
                </div>
            </main>
        </body>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
            crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
        <script src="./js/cadastro-produto.js"></script>

        </html>