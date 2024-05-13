const urlParams = new URLSearchParams(window.location.search);
const produtoBusca = urlParams.get('busca');
function criarProduto(produtos) {
    const card = document.createElement('div');
    card.classList.add('produtos');

    card.innerHTML = `
    <div class="imagem-container">
    <img src="./assets/I LO E.png" alt="${produtos.nome}">
    </div>
        <aside>
    <header>
        <h1>${produtos.nome}</h1>
    </header>
    <section class="d-flex justify-content-between align-items-center">
        <div class="valores">
            <span>R$ ${produtos.valor}</span>
        </div>
        <a href="#" class="btn btn-success" onclick="addToCart(${produtos.id_produto}, '${produtos.nome}', ${produtos.valor},'')">Adicionar</a>
    </section>
        </aside>
    `;
    return card;
}

function carregarProdutos(produtos) {
    const container = document.querySelector('.container');
    container.innerHTML = '';
    produtos.forEach(produto => {
        const card = criarProduto(produto);
        container.appendChild(card);
    });
}

function getProdutosData(produtoBusca) {
    fetch('./produtos-item?busca=' + produtoBusca)
        .then(response => {
            if (!response.ok) {
                throw new Error('Erro ao obter os dados do produto');
            }
            return response.json();
        })
        .then(data => {
            carregarProdutos(data);
        })
        .catch(error => {
            console.error('Erro:', error);
        });
}
getProdutosData(produtoBusca);