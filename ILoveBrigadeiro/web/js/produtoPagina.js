const urlParams = new URLSearchParams(window.location.search);
const produtoBusca = urlParams.get('busca');
function criarProduto(produtos) {
    const card = document.createElement('div');
    card.classList.add('produtos');

    //const base64Imagem = arrayBufferToBase64(produtos.imagem);
    card.innerHTML = `
    <div class="imagem-container">
    <img src="data:image/png;base64,${base64Imagem}" alt="${produtos.name}">
    </div>
        <aside>
    <header>
        <h1>${produtos.nome}</h1>
    </header>
    <section class="d-flex justify-content-between align-items-center">
        <div class="valores">
            <span>R$ ${produtos.valor}</span>
        </div>
        <a href="#" class="btn btn-success" onclick="addToCart(${produtos.idProduto}, '${produtos.nome}', ${produtos.valor},'${base64Imagem}')">Adicionar</a>
    </section>
</aside>
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

function carregarProdutos(produtos) {
    const container = document.querySelector('.container');
    container.innerHTML = '';
    produtos.forEach(produtos => {
        const card = criarProduto(produtos);
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
            console.log(data)
        })
        .catch(error => {
            console.error('Erro:', error);
        });
}
getProdutosData(produtoBusca);