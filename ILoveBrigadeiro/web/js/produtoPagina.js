const urlParams = new URLSearchParams(window.location.search);
const produtoBusca = urlParams.get('busca');
const produtoCategoria = urlParams.get('categoria');

function criarProduto(produtos) {
    const card = document.createElement('div');
    card.classList.add('produtos');
    const base64Imagem = arrayBufferToBase64(produtos.imagem);

    card.innerHTML = `
    <div class="card border-0">
        <div class="card-body p-4"> 
        <a class="product-item" id="${produtos.id_produto}" href="./produtos?id=${produtos.id_produto}">
            <img src="data:download.png;base64,${base64Imagem}" alt="${produtos.nome}" class="img-fluid d-block mx-auto mb-3">
            <h5 class="name-product">${produtos.nome}</h5>
            <div class="price d-flex justify-content-center">
                <span class="value">R$ ${produtos.valor}</span>
            </div>
        </a>
            <div class="btn-container d-flex justify-content-center m-3">
                <button class="btn-card" onclick="adicionaCarrinho(${produtos.id_produto}, '${produtos.nome}', ${produtos.valor}, '${base64Imagem}')">Adicionar</button>
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


function adicionaCarrinho(idProduto, nome, valor, imagem) {
    const data = {
        idProduto: idProduto,
        nome: nome,
        valor: valor,
        imagem: imagem,
        quantidade: 1
    }

    fetch('./adiciona-produto', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(data)
    })
        .then(response => {
            if (!response.ok) {
                throw new Error('Erro na solicitação: ' + response.status);
            }
            carregaCarinho();
            return response.json();
        })
        .then(data => {
            return fetch('./carrinho-produtos');
        })
        .then(response => {
            if (!response.ok) {
                throw new Error('Erro ao obter dados dos produtos');
            }
            return response.json();
        })
        .then(data => {
            carregaCarrinhoProdutos(data);
        })
        .catch(error => {
            console.error('Erro:', error);
        });
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

function getCategoriaData(produtoCategoria) {
    fetch('./busca?categoria=' + produtoCategoria)
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
if (produtoBusca !== "") {
    getProdutosData(produtoBusca);
} else {
    getCategoriaData(produtoCategoria);
}