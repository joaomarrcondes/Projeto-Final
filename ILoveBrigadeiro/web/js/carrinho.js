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

function criaCardCarrinho(carrinhoProdutos) {
 
    const totalPrice = carrinhoProdutos.valor * carrinhoProdutos.quantidade;
    carrinhoProdutos.innerHTML = `
        <section class="item-cart" id="${carrinhoProdutos.id_carrinho}">
            <div class="image-cart">
                <img src="data:image/png;base64,${carrinhoProdutos.imagem.value}"
                    alt="${carrinhoProdutos.nome}">
            </div>
            <div class="container-name-cart-item">
                <span>${carrinhoProdutos.nome}</span>
            </div>
            <div class="container-cart-trash">
                <i class="fa-solid fa-trash-can fa-xs btn btn-outline-danger" onclick="deleteItem(${carrinhoProdutos.id_carrinho})"></i>
            </div>
            <div class="container-value-cart">
                <span>R$${carrinhoProdutos.valor.toFixed(2)}</span>
                <span>R$ ${totalPrice.toFixed(2)}</span>
            </div>
        </section>
    `;
    return carrinhoProdutos;
}


function carregaCarrinhoProdutos(carrinhoProdutos) {
    const element = document.querySelector('.list-group-item');

    element.innerHTML = '';

    carrinhoProdutos.forEach(carrinhoProdutos => {
        const card = criaCardCarrinho(carrinhoProdutos);
        element.appendChild(card);
    });
}

function carregaCarinho() {
    fetch('./carrinho-produtos')
        .then(response => {
            if (!response.ok) {
                throw new Error('Erro ao obter dados dos produtos');
            }
            return response.json();
        })
        .then(data => {
            //updateCartTotal(data);
            carregaCarrinhoProdutos(data);
        })
        .catch(error => {
            console.error(error);
        });
}
carregaCarinho();




