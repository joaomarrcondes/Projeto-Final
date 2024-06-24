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
                        <div class="texto-endereco-entrega">
                            <h3>Endereço de Entrega</h3>
                            <span>Nós levamos o pedido até você no conforto da sua casa!</span>
                        </div>
                        <form id="form-endereco" name="form-checkout-endereco" action="cadastro-endereco" method="POST">
                            <div class="div-cep">
                                <h5>CEP</h5>
                                <div class="flex-cep-link">
                                    <input name="cep" id="input-cep" type="text" placeholder="00000-000" maxlength="8"
                                        minlength="8" required>
                                    <a href="http://www.buscacep.correios.com.br/sistemas/buscacep/">Não sei meu CEP</a>
                                </div>
                            </div>
                            <div class="div-rua">
                                <h5>Rua</h5>
                                <input name="rua" id="input-rua" type="text" required>
                            </div>
                            <div class="flex-numero-complemento">
                                <div class="div-numero">
                                    <h5>Número</h5>
                                    <input name="numero" id="input-numero" type="text" required minlength="1"
                                        maxlength="4">
                                </div>
                                <div class="div-complemento">
                                    <h5>Complemento</h5>
                                    <input name="complemento" id="input-complemento" type="text">
                                </div>
                            </div>
                            <div class="div-bairro">
                                <h5>Bairro</h5>
                                <input name="bairro" id="input-bairro" type="text" required>
                            </div>
                            <div class="div-cidade">
                                <h5>Cidade</h5>
                                <input name="cidade" id="input-cidade" type="text" required>
                            </div>
                            <div class="div-estado">
                                <h5>Estado</h5>
                                <select name="estado" id="input-estado" required>
                                    <option selected>Estado</option>
                                    <option value="AC">Acre</option>
                                    <option value="AL">Alagoas</option>
                                    <option value="AP">Amapá</option>
                                    <option value="AM">Amazonas</option>
                                    <option value="BA">Bahia</option>
                                    <option value="CE">Ceará</option>
                                    <option value="DF">Distrito Federal</option>
                                    <option value="ES">Espírito Santo</option>
                                    <option value="GO">Goiás</option>
                                    <option value="MA">Maranhão</option>
                                    <option value="MT">Mato Grosso</option>
                                    <option value="MS">Mato Grosso do Sul</option>
                                    <option value="MG">Minas Gerais</option>
                                    <option value="PA">Pará</option>
                                    <option value="PB">Paraíba</option>
                                    <option value="PR">Paraná</option>
                                    <option value="PE">Pernambuco</option>
                                    <option value="PI">Piauí</option>
                                    <option value="RJ">Rio de Janeiro</option>
                                    <option value="RN">Rio Grande do Norte</option>
                                    <option value="RS">Rio Grande do Sul</option>
                                    <option value="RO">Rondônia</option>
                                    <option value="RR">Roraima</option>
                                    <option value="SC">Santa Catarina</option>
                                    <option value="SP">São Paulo</option>
                                    <option value="SE">Sergipe</option>
                                    <option value="TO">Tocantins</option>
                                </select>
                            </div>
                            <button type="submit" class="btn-salvar">SALVAR ENDEREÇO</button>
                        </form>
                    </div>
                    <div class="resumo-agendar">
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
                            <a href="./pagamento">
                                <button class="btn-pagamento">PAGAMENTO</button>
                            </a>
                        </div>
                        <div class="container-agendar">
                            <h3>Agendar Entrega</h3>
                            <span>Os horários de entrega são aproximados</span>
                            <div class="data-hora">
                                <div class="data">
                                    <h5>Data</h5>
                                    <div class="icon-data">
                                        <i class="fa-solid fa-calendar-days"></i>
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
                                </div>
                                <div class="hora">
                                    <h5>Horário</h5>
                                    <div class="icon-relogio">
                                        <i class="fa-solid fa-clock"></i>
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
                            </div>
                            <button class="btn-agendar">AGENDAR</button>
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
    <script src="./js/checkout.js"></script>
    <script src="./js/formulario-endereco.js"></script>

    </html>