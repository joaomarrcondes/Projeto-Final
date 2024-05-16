document.addEventListener("DOMContentLoaded", function () {
    const btnAbrir = document.getElementById("btn-abrir-carrinho");
    const btnFechar = document.getElementById("btn-fechar-carrinho");
    const background = document.getElementById("background");
    const carrinho = document.getElementById("carrinho-compras");

    btnAbrir.addEventListener('click', toggleCarrinho);
    btnFechar.addEventListener('click', toggleCarrinho);
    background.addEventListener('click', toggleCarrinho);

    function toggleCarrinho(event) {
        carrinho.classList.toggle('open');
        background.classList.toggle('open');
    }
});




