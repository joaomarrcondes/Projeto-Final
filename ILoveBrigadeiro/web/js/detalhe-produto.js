// Obtém o id do produto e chama a função produtoId com o 'id'.
document.addEventListener('DOMContentLoaded', function () {
    const urlParams = new URLSearchParams(window.location.search);
    const idProduto = urlParams.get('id');
    produtoId(idProduto);
});

// Cria um card do produto com  imagem do produto, nome, valor, quantidade, botão de adicionar ao carrinho e a descrição do produto.
function criarProdutoCard(produtos) {
    const card = document.createElement('div');
    card.classList.add('container-produto');
    const imagem = arrayBufferToBase64(produtos.imagem);
    card.innerHTML = `
        <div class="info-produtos">
            <div class="container">
                <div class="container-info">
                    <img src="data:imagem/png;base64,${imagem}"
                        alt="${produtos.nome}">  
                </div>
                <div class="container-info">
                    <div class="produto-nome">
                         <h2>${produtos.nome}</h2>  
                    </div>   
                    <div class="valor-produto">
                         <span>R$ ${produtos.valor.toFixed(2)}</span>
                    </div>
                    <div class="quantidade-input">
                         <input id="btn-quantidade" onclick="quantidadeProduto(${produtos.id_produto}, this.value)" type="number" value="${produtos.quantidade}" min="1" max="10" step="1" />
                    </div>
                    <div class="adicionar">
                         <button class="btn-adicionar" onclick="adicionaCarrinho(${produtos.id_produto}, '${produtos.nome}', ${produtos.valor.toFixed(2)}, '${imagem}')">Adicionar</button>
                    </div>
                </div>  
            </div>
            <div class="container">
                <div class="container-info">
                   <h5>INFORMAÇÕES</h5>
                   <hr>
                   <p class="texto-descricao"> 
                      ${produtos.descricao} 
                   </p>
                </div>
            </div>
        </div>   
    `;
    return card;
}

// Adiciona o produto no carrinho e recarrega o carrinho
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

//Recebe uma lista de produtos e adiciona cada um na main criando cards.
function carregarProdutos(produtos) {
    const container = document.querySelector('main');
    produtos.forEach(produtos => {
        const card = criarProdutoCard(produtos);
        container.appendChild(card);
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

// Obtém informações de um produto específico com base no id e chama a função para mostrar o produto.
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

//Obtém os produtos do carrinho e carrega na página e atualiza o valor total do carrinho.
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

