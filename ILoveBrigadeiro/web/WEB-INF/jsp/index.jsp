<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="pt-br">

    <head>
        <link rel="icon" type="image/x-icon" href="./assets/ILoveBrigadeiro.png">
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
        <%@include file="header.jsp" %>
            <main>
                <div class="main-container">
                    <div id="carouselExample" class="carousel slide">
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img src="./assets/banner1.png" class="d-block w-100" alt="...">
                            </div>
                            <div class="carousel-item">
                                <img src="" class="d-block w-100" alt="...">
                            </div>
                            <div class="carousel-item">
                                <img src="" class="d-block w-100" alt="...">
                            </div>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample"
                            data-bs-slide="prev">
                            <i class="fa-solid fa-chevron-left"></i>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carouselExample"
                            data-bs-slide="next">
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
                            <button class="js-carousel--simple-prev btn-slide m-2" aria-label="Anterior"><i
                                    class="fa-solid fa-chevron-left"></i></button>
                            <button class="js-carousel--simple-next btn-slide m-2" aria-label="Próximo"><i
                                    class="fa-solid fa-chevron-right"></i></button>
                        </div>
                    </div>
                </div>
            </main>
            <footer class="text-center text-lg-start text-white" style="background-color: #F57EB6">
                <div class="container p-4 pb-0">
                    <section>
                        <div class="row">
                            <div class="col-md-3 col-lg-3 col-xl-3 mx-auto mt-3">
                                <h6 class="text-uppercase mb-4 font-weight-bold">
                                    I Love Brigadeiro
                                </h6>
                                <p>
                                    Here you can use rows and columns to organize your footer
                                    content. Lorem ipsum dolor sit amet, consectetur adipisicing
                                    elit.
                                </p>
                            </div>
                            <hr class="w-100 clearfix d-md-none" />
                            <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mt-3">
                                <h6 class="text-uppercase mb-4 font-weight-bold">Institucionais</h6>
                                <p>
                                    <a class="text-white">Política Privacidade</a>
                                </p>
                                <p>
                                    <a class="text-white">Política de Segurança</a>
                                </p>
                                <p>
                                    <a class="text-white">Sobre a Loja</a>
                                </p>
                                <p>
                                    <a class="text-white">Entregas e Retiradas</a>
                                </p>
                            </div>
                            <hr class="w-100 clearfix d-md-none" />
                            <hr class="w-100 clearfix d-md-none" />
                            <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mt-3">
                                <h6 class="text-uppercase mb-4 font-weight-bold">Contatos</h6>
                                <p><i class="fas fa-home mr-3"></i> R.Belém-844, Londrina - PR, 86026-040</p>
                                <p><i class="fas fa-envelope mr-3"></i> ILoveBrigadeiro@gmail.com</p>
                                <p><i class="fas fa-phone mr-3"></i>(43) 984 679 882</p>
                                <p><i class="fas fa-print mr-3"></i>(43) 984 567 879</p>
                            </div>
                            <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mt-3">
                                <h6 class="text-uppercase mb-4 font-weight-bold">Siga-nos</h6>
                                <a class="btn btn-primary btn-floating m-1" style="background-color: #3b5998" href="#!"
                                    role="button"><i class="fab fa-facebook-f"></i></a>
                                <a class="btn btn-primary btn-floating m-1" style="background-color: #55acee" href="#!"
                                    role="button"><i class="fab fa-twitter"></i></a>
                                <a class="btn btn-primary btn-floating m-1" style="background-color: #dd4b39" href="#!"
                                    role="button"><i class="fab fa-google"></i></a>
                                <a class="btn btn-primary btn-floating m-1" style="background-color: #db2188" href="#!"
                                    role="button"><i class="fab fa-instagram"></i></a>
                                <a class="btn btn-primary btn-floating m-1" style="background-color: #0082ca" href="#!"
                                    role="button"><i class="fab fa-linkedin-in"></i></a>
                                <a class="btn btn-primary btn-floating m-1" style="background-color: #333333" href="#!"
                                    role="button"><i class="fab fa-github"></i></a>
                            </div>
                        </div>
                    </section>
                </div>
                <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2)">
                    © 2020 Copyright:
                    <a class="text-white" href="#">ILoveBrigadeiro.com</a>
                </div>
            </footer>
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
    <script src="https://cdn.jsdelivr.net/npm/glider-js@1/glider.min.js"></script>
    <script src="./js/produtos.js"></script>
    <script src="./js/carousel.js"></script>

    </html>