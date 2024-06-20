document.addEventListener('DOMContentLoaded', function () {
    const urlParams = new URLSearchParams(window.location.search);
    const idProduto = urlParams.get('id');
    produtoId(idProduto);
});

function criarProdutoCard(produtos) {
    const card = document.createElement('div');
    card.classList.add('container-produto');
    const imagem = arrayBufferToBase64(produtos.imagem);
    const valorP = produtos.valor * produtos.quantidade;
    card.innerHTML = `
        <div class="container-produto">
            <div class="container-imagem">
                    <img src="data:imagem/png;base64,${imagem}"
                        alt="${produtos.nome}">  
            </div>
            <div class="container-direita">
                 <div class="nome-produto">
                      <h2>${produtos.nome}</h2>  
                 </div>   
                 <div class="valor-produto">
                    <span>${produtos.valor.toFixed(2)}</span>
                 </div>
                 <div class="quantidade-input">
                    <input id="btn-quantidade" onclick="quantidadeProduto(${produtos.id_produto}, this.value)" type="number" value="${produtos.quantidade}" min="1" max="10" step="1" />
                 </div>
                <div class="adicionar">
                    <button class="btn-adicionar" onclick="adicionaCarrinho(${produtos.id_produto}, '${produtos.nome}', ${produtos.valor.toFixed(2)}, '${imagem}')">Adicionar</button>
                </div>
            </div>
        </div>   
        <div class="descricao-produto">
            ${produtos.descricao} 
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

function carregarProdutos(produtos) {
    const container = document.querySelector('main');
    produtos.forEach(produtos => {
        const card = criarProdutoCard(produtos);
        container.appendChild(card);
    });
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

function produtoId(idProduto) {
    fetch('./produto?id=' + idProduto)
        .then(response => {
            if (!response.ok) {
                throw new Error('Erro ao conseguir informações do produto')
            }
            return response.json();
        })
        .then(data => {
            carregarProdutos(data);
        })
        .catch(error => {
            console.error(error);
        })
}

function carregaCarinho() {
    fetch('./carrinho-produtos')
        .then(response => {
            if (!response.ok) {
                throw new Error('Erro ao carregar informações do carrinho');
            }
            return response.json();
        })
        .then(data => {
            atualizaValor(data);
            carregaCarrinhoProdutos(data);
        })
        .catch(error => {
            console.error(error);
        });
}
carregaCarinho();

function quantidadeProduto(produtoId, quantidade) {
    const data = {
        produtoId: produtoId,
        quantidadeProduto: quantidade
    };

    fetch('./quantidade-produto', {
        method: 'PUT',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(data)
    })
        .then(response => {
            if (!response.ok) {
                throw new Error('Erro ao atualizar a quantidade do produto');
            }
            return response.json();
        })
        .catch(error => {
            console.error(error);
        });
        carregaCarinho();
}

function calculaValor(produtos) {
    let valor = 0;
    produtos.forEach(produtos => {
        valor += produtos.valor * produtos.quantidade;
    });
    return valor;
}

function atualizaValor(produtos) {
    const valorTotalCarrinho = document.getElementById("valor-total");
    const novoValor = calculaValor(produtos);
    valorTotalCarrinho.textContent = novoValor.toFixed(2);
}

