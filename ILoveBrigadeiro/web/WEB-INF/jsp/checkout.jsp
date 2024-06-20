<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="pt-br">

    <head>
        <link rel="icon" type="image/x-icon" href="./assets/ILoveBrigadeiro.png">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
            <div class="container-checkout">
                <div class="produtos-revisao">
                    <div class="produtos-carrinho">
                        <h2 id="h2-revisao">Meu Carrinho</h2>
                        <ul class="produtos-lista">
                        </ul>
                    </div>
                </div>
                <div class="endereco-total">
                    <div class="container-endereco">
                        <h3>Endereço de Entrega</h3>
                        <span>Nós levamos o pedido até você</span>
                        <h5>CEP</h5>
                        <input name="cep" class="input-cep" type="text" placeholder="00000-000">
                        <input class="btn-cep" type="button" value="BUSCAR CEP" onclick="">
                    </div>
                    <div class="resumo-valor">
                        <h3>Resumo do Pedido</h3>
                        <div class="sub-total">
                            <h6>SubTotal</h6>
                            <div id="subtotal-checkout"></div>
                        </div>
                        <div class="entrega">
                            <h6>Entrega</h6>
                            <div id="valor-entrega"></div>
                        </div>
                        <div class="total">
                            <h6>Total</h6>
                            <div id="total-checkout"></div>
                        </div>
                        <a href="./home">
                            <button class="btn-continua-compras">CONTINUAR COMPRANDO</button>
                        </a>
                    </div>
                </div>
                <div class="container-agendar">
                    <h3>Agendar Entrega</h3>
                    <div class="data-hora">
                        <div class="data">
                            <h5>Data</h5>
                            <select class="form-select" aria-label="Default select example">
                                <option value="1">qua, 19/06/2024</option>
                                <option value="2">qui, 20/06/2024</option>
                                <option value="3">sex, 21/06/2024</option>
                                <option value="4">sáb, 22/06/2024</option>
                                <option value="5">seg, 23/06/2024</option>
                                <option value="6">ter, 24/06/2024</option>
                                <option value="7">qua, 25/06/2024</option>
                            </select>
                        </div>
                        <div class="hora">
                            <h5>Horário</h5>
                            <select class="form-select" aria-label="Default select example">
                                <option value="1">9:30</option>
                                <option value="2">10:00</option>
                                <option value="3">10:30</option>
                                <option value="4">11:00</option>
                                <option value="5">11:30</option>
                                <option value="6">12:00</option>
                                <option value="7">12:30</option>
                                <option value="8">13:00</option>
                                <option value="9">13:30</option>
                                <option value="10">14:00</option>
                                <option value="11">14:30</option>
                                <option value="12">15:00</option>
                                <option value="13">15:30</option>
                                <option value="14">16:00</option>
                                <option value="15">16:30</option>
                                <option value="16">17:00</option>
                                <option value="17">17:30</option>
                                <option value="18">18:00</option>
                                <option value="19">18:30</option>
                                <option value="20">19:00</option>
                            </select>
                        </div>
                    </div>
                    <button class="btn-agendar">AGENDAR</button>
                </div>
            </div>
        </main>
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
    <script src="./js/checkout.js"></script>

    </html>