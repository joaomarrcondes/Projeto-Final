function criaCardCarrinho(carrinhoProduto) {
    const novoValor = carrinhoProduto.valor * carrinhoProduto.quantidade;
    const cardProduto = document.createElement('li');
    cardProduto.innerHTML = `
        <section class="produto-revisao" id="produto-${carrinhoProduto.id_carrinho}">
            <div class="imagem">
                <img src="data:imagem/png;base64,${carrinhoProduto.imagem.value}" alt="${carrinhoProduto.nome}">
            </div>
            <div class="info-revisao">
                <div class="nome-produto-revisao">
                    <span>${carrinhoProduto.nome}</span>
                </div>  
                <div class="quantidade-revisao">
                    <input id="btn-quantidade" onclick="quantidadeProduto(${carrinhoProduto.id_carrinho}, this.value)" type="number" value="${carrinhoProduto.quantidade}" min="1" max="10" step="1" />
                </div> 
                 <div class="valor-total-revisao">
                    <span>${novoValor.toFixed(2)}</span>
                </div>
                <div class="deleta-produto-revisao">
                    <i class="fa-regular fa-trash-can" onclick="excluirProduto(${carrinhoProduto.id_carrinho})"></i>
                </div>
            </div>
        </section>
        <hr id="linha-revisao">
    `;
    return cardProduto;
}

function carregaCarrinhoProdutos(carrinhoProdutos) {
    const element = document.querySelector('.produtos-lista');

    element.innerHTML = '';

    carrinhoProdutos.forEach(produto => {
        const card = criaCardCarrinho(produto);
        element.appendChild(card);
    });
}

function excluirProduto(produtoId) {
    fetch(`./deleta-produto?produtoId=${produtoId}`, {
        method: 'DELETE',
        headers: {
            'Content-Type': 'application/json',
        },
    })
        .then(response => {
            if (!response.ok) {
                throw new Error('Erro ao deletar o produto');
            }
            const contentType = response.headers.get('content-type');
            if (!contentType || !contentType.includes('application/json')) {
                return null;
            }
            return response.json();
        })
        .then(() => {
            carregaCarinho();
        })
        .catch(error => {
            console.error('Erro', error);
        });
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
        .then(() => {
            carregaCarinho();
        })
        .catch(error => {
            console.error(error);
        });
}

function calculaValor(carrinhoProdutos) {
    let valor = 0;
    carrinhoProdutos.forEach(carrinhoProdutos => {
        valor += carrinhoProdutos.valor * carrinhoProdutos.quantidade;
    });
    return valor;
}

function atualizaValor(carrinhoProdutos) {
    const valorTotalCarrinho = document.getElementById("valor-total");
    const novoValor = calculaValor(carrinhoProdutos);
    valorTotalCarrinho.textContent = novoValor.toFixed(2);
}
