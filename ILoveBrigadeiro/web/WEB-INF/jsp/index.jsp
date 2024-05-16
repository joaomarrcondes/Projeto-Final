<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/glider-js@1/glider.min.css">
    <link rel="stylesheet" href="./style/card.css">
    <link rel="stylesheet" href="./style/index.css">
</head>

<body>
    <%@include file="header.jsp"%>
    <main>
      
        <div id="carouselExample" class="carousel slide">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="./assets/banner1.png" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="..." class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="..." class="d-block w-100" alt="...">
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
                <i class="fa-solid fa-chevron-left"></i>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
                <i class="fa-solid fa-chevron-right"></i>
            </button>
        </div>
        <br>
        <hr id="linha1">
        <br>
        <h2 class="title-carousel">DESTAQUES</h2>
        <div class="c-carousel c-carousel--produtos">
            <div class="c-carousel__slides js-carousel--products d-flex">
            </div>
            <div class="carousel-buttons d-flex justify-content-center">
                <button class="js-carousel--simple-prev btn-slide m-2" aria-label="Anterior"><i class="fa-solid fa-chevron-left"></i></button>
                <button class="js-carousel--simple-next btn-slide m-2" aria-label="Próximo"><i class="fa-solid fa-chevron-right"></i></button>
            </div>
        </div>
    </main>
    <a href="./cadastro-produto">cadastro produto</a>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
        integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
        integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/glider-js@1/glider.min.js"></script>
</body>
<script src="./js/produtos.js"></script>
<script src="./js/carousel.js"></script>

</html>