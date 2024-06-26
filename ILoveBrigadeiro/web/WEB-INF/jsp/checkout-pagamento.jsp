<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="pt-br">

    <head>
        <link rel="icon" type="image/x-icon" href="./assets/ILoveBrigadeiro.png">
        <meta charset="UTF-8">
        <script src="https://kit.fontawesome.com/52a6b206fa.js" crossorigin="anonymous"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="./style/checkout.css">
        <link rel="stylesheet" href="./style/pagamento.css">
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
            <h2 class="texto-pagamento">Selecionar forma de pagamento online</h2>
            <div class="container-metodos-pagamento">
                <div class="container-card-cartao">
                    <div class="botao-para-cartao">
                        <button id="btn-metodo-cartao" type="button">
                            CARTÃO DE CRÉDITO
                        </button>
                    </div>
                    <div id="container-cartao">
                        <div class="div-numero-cartao">
                            <h6>Número do Cartão</h6>
                            <input name="inputNumero" type="text" class="form-control" id="input-numero-cartao"
                                maxlength="16" minlength="16" required onkeyup="validaNumeroCartao(this)">
                        </div>
                        <h6>Validade</h6>
                        <div class="validade-cvv">
                            <select class="form-select-mes">
                                <option selected>Mês</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                            </select>
                            <select class="form-select-ano">
                                <option selected>Ano</option>
                                <option value="24">24</option>
                                <option value="25">25</option>
                                <option value="26">26</option>
                                <option value="27">27</option>
                                <option value="28">28</option>
                                <option value="29">29</option>
                                <option value="30">30</option>
                                <option value="31">31</option>
                                <option value="32">32</option>
                                <option value="33">33</option>
                                <option value="34">34</option>
                            </select>
                            <div class="div-cvv-cartao">
                                <input name="inputCvv" type="text" id="input-cvv-cartao" placeholder=" CVV"
                                    class="form-control" required maxlength="3" minlength="3"
                                    onkeyup="validaCvvCartao(this)">
                            </div>
                        </div>
                        <div class="div-nome-cartao">
                            <h6>Nome Impresso do Cartão</h6>
                            <input name="inputNome" type="text" id="input-nome-cartao" placeholder=""
                                class="form-control" onkeyup="validaNomeCartao(this)" required>
                        </div>
                    </div>
                </div>
                <div class="container-metodo-pix">
                    <div class="div-btn-pix">
                        <button id="btn-metodo-pix" type="button">
                            PIX
                        </button>
                    </div>
                    <div id="container-pix" class="class-container-pix">
                        <div class="texto-pix">
                            <h5>Escaneie o QR Code</h5>
                            <span>para pagar com Pix:</span>
                        </div>
                        <div class="qrcode-container">
                            <img src="./assets/qrcode-pix.png" alt="">
                        </div>
                        <div class="btn-copia-cola">
                            <button> <i class="fa-solid fa-copy" style="color: #ffffff;"></i>PIX COPIA E COLA</button>
                        </div>
                    </div>
                </div>
                <div class="botoes-resumo-valores">
                    <div class="resumo-valores">
                        <h3>Resumo do Pedido</h3>
                        <div class="sub-total-resumo">
                            <h6>SubTotal</h6>
                            <div id="subtotal-checkout-resumo">0.00</div>
                        </div>
                        <div class="entrega-resumo">
                            <h6>Entrega</h6>
                            <div id="valor-entrega-resumo">25,00</div>
                        </div>
                        <div class="total-resumo">
                            <h6>Total</h6>
                            <div id="total-checkout-resumo">0.00</div>
                        </div>
                        <div class="botoes">
                            <a href="./home">
                                <button class="btn-continua-compras-home">CONTINUAR COMPRANDO</button>
                            </a>
                            <button class="btn-pagamento-compras">FINALIZAR COMPRA</button>
                        </div>
                    </div>
                </div>
                <div class="popup-wrapper">
                    <div class="popup">
                        <div class="popup-fechar">x</div>
                        <div class="popup-conteudo">
                            <i class="fa-solid fa-circle-check" style="color: #63E6BE;"></i>
                            <h2>Sua compra foi realizada com sucesso!</h2>
                            <p>Sua compra foi realizada com sucesso e já estamos processando seu pedido.
                                <br>
                                Estamos ansiosos para entregar seu produto!
                                Se tiver qualquer dúvida ou precisar de assistência, não hesite em entrar em contato conosco.
                                <br>
                                Agradecemos pela confiança e esperamos vê-lo novamente em breve!</p>
                        </div>
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

                                I Love Brigadeiro Descubra o melhor da confeitaria artesanal com nossos
                                brigadeiros, tortas, bolos decorados e muito mais. Delícias irresistíveis para todos os
                                momentos
                                especiais!
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
    <script src="./js/pagamento.js"></script>

    </html>