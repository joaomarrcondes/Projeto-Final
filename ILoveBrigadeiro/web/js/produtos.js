let produtos;
let cardProdutos;
function criarProdutoCard(produtos) {
    const card = document.createElement('div');
    card.classList.add('produtos-card');

    card.innerHTML = `
    <div class="card rounded border-0 m-2">
    <a class="product-item" id="${produtos.idProduto}" href="./produtos?id=${produtos.idProduto}">
        <div class="card-body p-4">
            <img src="data:image/png;base64,${base64Imagem}" alt="${produtos.nome}" class="img-fluid d-block mx-auto mb-3">
            <h5 class="name-product">${produtos.nome}</h5>
            <div class="price d-flex justify-content-center">
                <span class="value">R$ ${produtos.valor}</span>
            </div>
        </a>
            <div class="btn-container d-flex justify-content-center m-3">
                <button class="btn btn-info" onclick="addToCart(${produtos.idProduto}, '${produtos.nome}', ${produtos.valor},'${base64Imagem}')">Adicionar ao carrinho</button>
            </div>
        </div>
    </div>
    `;
    return card;
}

function arrayBufferToBase64(buffer) {
    let binary = '';
    const bytes = new Uint8Array(buffer);
    const len = bytes.byteLength;
    for (let i = 0; i < len; i++) {
        binary += String.fromCharCode(bytes[i]);
    }
    return window.btoa(binary);
}

function carregarProdutosCarousel(produtos) {
    const carousel = document.querySelector('.js-carousel--simple');
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

