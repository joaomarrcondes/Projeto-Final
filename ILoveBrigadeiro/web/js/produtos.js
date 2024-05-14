let produtos;
let cardProdutos;
function criarProdutoCard(produtos) {
    const card = document.createElement('div');
    card.classList.add('produtos-card');

    card.innerHTML = `
    <div class="card border-0">
        <div class="card-body p-4"> 
        <a class="product-item" id="${produtos.id_produto}" href="./produtos?id=${produtos.id_produto}">
            <img src="" alt="${produtos.nome}" class="img-fluid d-block mx-auto mb-3">
            <h5 class="name-product">${produtos.nome}</h5>
            <div class="price d-flex justify-content-center">
                <span class="value">R$ ${produtos.valor}</span>
            </div>
        </a>
            <div class="btn-container d-flex justify-content-center m-3">
                <button class="btn-info" onclick="addToCart(${produtos.id_produto}, '${produtos.nome}', ${produtos.valor})">Adicionar</button>
            </div>
        </div>
    </div>
    `;
    return card;
}

function carregarProdutosCarousel(produtos) {
    const carousel = document.querySelector('.js-carousel--products');
    carousel.innerHTML = '';
    produtos.forEach(produtos => {
        const card = criarProdutoCard(produtos);
        carousel.appendChild(card);
    });
}

fetch('lista-produtos')
    .then(response => {
        if (!response.ok) {
            throw new Error('Erro ao obter os dados do produto');
        }
        return response.json();
    })
    .then(data => {
        produtos = data;
        carregarProdutosCarousel(produtos)
    })
    .catch(error => {
        console.error(error);
    });

