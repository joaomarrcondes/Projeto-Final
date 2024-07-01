const urlParams = new URLSearchParams(window.location.search);
const buscarProdutos = urlParams.get('busca');
const buscarCategorias = urlParams.get('categoria');

let cardProdutos;

// Cria um elemento div para o card do produto
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

//  Envia uma solicitação para adicionar um produto ao carrinho e exibe o produto.
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

// Carrega e exibe os produtos em um carrousel
function carregarProdutos(produtos) {
    const div = document.querySelector('.js-carousel--products');
    div.innerHTML = '';
    produtos.forEach(produtos => {
        const card = criarProdutoCard(produtos);
        div.appendChild(card);
    });
}

// Converte um buffer de imagem em uma string Base64 para exibição.
function arrayBufferToBase64(buffer) {
    let binary = '';
    const bytes = new Uint8Array(buffer);
    const len = bytes.byteLength;
    for (let i = 0; i < len; i++) {
        binary += String.fromCharCode(bytes[i]);
    }
    return window.btoa(binary);
}

// Busca produtos por nome.
function nomeProduto (buscarProdutos){
    fetch('./busca?busca=' + buscarProdutos)
    .then(response => {
        if(!response.ok){
            throw new Error('erro na busca do produto')
        }
        return response.json();
    })
    .then(data => {
        console.log("Produtos encontrados na busca:", data);
        carregarProdutos(data);
    })
    .catch(error => {
        console.error(error);
    })
}

//Busca produtos por categoria.
function categoriaProduto (buscarCategorias){
    fetch('./busca?categoria=' + buscarCategorias)
    .then(response => {
        if(!response.ok){
            throw new Error('erro na busca do produto por categoria')
        }
        return response.json();
    })
    .then(data => {
        console.log("Produtos encontrados na busca de categoria:", data);
        carregarProdutos(data);
    })
    .catch(error => {
        console.error(error);
    })
}

if (buscarProdutos !== "") {
    nomeProduto(buscarProdutos);
} else {
    categoriaProduto(buscarCategorias);
}