<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <meta charset="UTF-8">
    <script src="https://kit.fontawesome.com/52a6b206fa.js" crossorigin="anonymous"></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro Produto</title>

</head>

<body>
    <main>
        <div class="container">
            <h1>Cadastro de Produtos</h1>
            <form action="inserir-produtos" enctype="multipart/form-data" method="post">
                Imagem
                <input type="file" name="imagem" class="form-control" placeholder="Carregar imagem"
                    aria-label="Username" aria-describedby="basic-addon1">
                Nome
                <input type="text" name="nome" class="form-control" placeholder="Nome do produto" aria-label="Username"
                    aria-describedby="basic-addon1">
                Valor
                <input type="text" name="valor" class="form-control" placeholder="Valor do produto"
                    aria-label="Username" aria-describedby="basic-addon1">
                Categoria
                <input type="text" name="categoria" class="form-control" placeholder="Categoria do produto" aria-label="Username"
                    aria-describedby="basic-addon1">
                Quantidade em Estoque
                <input type="text" name="quantidade" class="form-control" placeholder="Quantidade do produto" aria-label="Username"
                    aria-describedby="basic-addon1">
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text">Descrição</span>
                    </div>
                    <textarea class="form-control" name="descricao" aria-label="With textarea"></textarea>
                </div>
                <input type="submit" value="Enviar">
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

</html>