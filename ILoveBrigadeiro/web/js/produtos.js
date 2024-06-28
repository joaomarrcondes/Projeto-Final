let cardProdutos;
function criarProdutoCard(produtos) {
    const card = document.createElement('div');
    card.classList.add('produtos-card');
    const imagem = arrayBufferToBase64(produtos.imagem);
    card.innerHTML = `
    <div class="card border-0">
        <div class="card-body p-4"> 
        <a class="produto-item" id="${produtos.id_produto}" href="./info-produtos?id=${produtos.id_produto}">
            <img src="data:imagem/png;base64,${imagem}" alt="${produtos.nome}" class="img-fluid d-block mx-auto mb-3">
            <h5 class="nome-produto">${produtos.nome}</h5>
            <div class="valor d-flex justify-content-center">
                <span class="valor">R$ ${produtos.valor.toFixed(2)}</span>
            </div>
        </a>
            <div class="btn-container d-flex justify-content-center m-3">
                <button class="btn-adicionar" onclick="adicionaCarrinho(${produtos.id_produto}, '${produtos.nome}', ${produtos.valor.toFixed(2)}, '${imagem}')">Adicionar</button>
            </div>
        </div>
    </div>
    `;
    return card;
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
                throw new Error('Erro ao conseguir informações do produto');
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

function carregarProdutosCarousel(produtos) {
    const carousel = document.querySelector('.js-carousel--products');
    carousel.innerHTML = '';
    produtos.forEach(produtos => {
        const card = criarProdutoCard(produtos);
        carousel.appendChild(card);
    });
}

fetch('./lista-produtos')
    .then(response => {
        if (!response.ok) {
            throw new Error('Erro ao conseguir informações do produto');
        }
        return response.json();
    })
    .then(data => {
        carregarProdutosCarousel(data)
    })
    .catch(error => {
        console.error(error);
    });

function arrayBufferToBase64(buffer) {
    let binary = '';
    const bytes = new Uint8Array(buffer);
    const len = bytes.byteLength;
    for (let i = 0; i < len; i++) {
        binary += String.fromCharCode(bytes[i]);
    }
    return window.btoa(binary);
}