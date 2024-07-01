// Cria uma li para cada produto no checkout com suas funcionalidades.
function criaCardCarrinho(carrinhoProduto) {
    const valor = carrinhoProduto.valor * carrinhoProduto.quantidade;
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
                    <span>R$ ${valor.toFixed(2)}</span>
                </div>
               <div class="btn-deleta-produto">
                <i class="fa-regular fa-trash-can" onclick="excluirProduto(${carrinhoProduto.id_carrinho})"></i>
              </div>
            </div>
        </section>
        <hr id="linha-revisao">
    `;
    return cardProduto;
}
// Carrega todos os produtos no checkout na classe informada.
function carregaCarrinhoProdutos(carrinhoProdutos) {
    const element = document.querySelector('.produtos-lista');

    element.innerHTML = '';

    carrinhoProdutos.forEach(produto => {
        const card = criaCardCarrinho(produto);
        element.appendChild(card);
    });
}

// Exclui o produto e atualiza a lista no checkout.
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

// Atualiza a quantidade do produto no checkout.
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

// Calcula o valor total dos produtos no chrckout.
function calculaValor(carrinhoProdutos) {
    let valor = 0;
    carrinhoProdutos.forEach(carrinhoProdutos => {
        valor += carrinhoProdutos.valor * carrinhoProdutos.quantidade;
    });
    return valor;
}

// Mostra e atualiza o valor no elemento id.
function atualizaValor(carrinhoProdutos) {
    const valorTotalCarrinho = document.getElementById("subtotal-checkout");
    const novoValor = calculaValor(carrinhoProdutos);
    valorTotalCarrinho.textContent = novoValor.toFixed(2);
}
