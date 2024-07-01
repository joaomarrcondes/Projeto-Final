document.addEventListener("DOMContentLoaded", function () {
    const btnAbrir = document.getElementById("btn-abrir-carrinho");
    const btnFechar = document.getElementById("btn-fechar-carrinho");
    const background = document.getElementById("background");
    const carrinho = document.getElementById("carrinho-compras");
    const body = document.body;

    btnAbrir.addEventListener('click', toggleCarrinho);
    btnFechar.addEventListener('click', toggleCarrinho);
    background.addEventListener('click', toggleCarrinho);

    function toggleCarrinho(event) {
        carrinho.classList.toggle('open');
        background.classList.toggle('open');
        body.classList.toggle('no-scroll');
    }
});

const finalizarCompra = document.getElementById("btn-finalizar");

// Cria uma li para cada produto no carrinho com suas funcionalidades.
function criaCardCarrinho(carrinhoProdutos) {
    const novoValor = carrinhoProdutos.valor * carrinhoProdutos.quantidade;
    const cardProduto = document.createElement('li');
    cardProduto.innerHTML = `
        <section class="produto-carrinho" id="${carrinhoProdutos.id_carrinho}">
            <div class="imagem-carrinho">
                <img src="data:imagem/png;base64,${carrinhoProdutos.imagem.value}"
                    alt="${carrinhoProdutos.nome}">
            </div>
            <div class="conteudo-imagem">
              <div class="nome-produto">
                <span>${carrinhoProdutos.nome}</span>
              </div>
              <div class="btn-deleta-produto">
                <i class="fa-regular fa-trash-can" onclick="excluirProduto(${carrinhoProdutos.id_carrinho})"></i>
              </div>
              <div class="valor-total-produto">
              <span>${novoValor.toFixed(2)}</span>
              </div>
              <div class="input-quantidade">
              <input id="btn-quantidade-${carrinhoProdutos.id_carrinho}" onclick="quantidadeProduto(${carrinhoProdutos.id_carrinho}, this.value)" type="number" value="${carrinhoProdutos.quantidade}" min="1" max="10" step="1" />
              </div>
            </div>
        </section>
        <br>
        <hr>
    <br>
    `;
    return cardProduto;
}

// Carrega todos os produtos no carrinho
function carregaCarrinhoProdutos(carrinhoProdutos) {
    const element = document.querySelector('.produtos');

    element.innerHTML = '';

    carrinhoProdutos.forEach(carrinhoProdutos => {
        const card = criaCardCarrinho(carrinhoProdutos);
        element.appendChild(card);
    });
}

// Exclui o produto e recarrega o carrinho.
function excluirProduto(produtoId) {
    fetch('./deleta-produto?produtoId=' + produtoId, {
        method: 'DELETE',
        headers: {
            'Content-Type': 'application/json',
        },
    })
        .then(response => {
            if (!response.ok) {
                throw new Error('Erro');
            }
            const contentType = response.headers.get('content-type');
            if (!contentType || !contentType.includes('application/json')) {
                return null;
            }
            return response.json();
        })
        .catch(error => {
            console.error('Erro', error);
        })
    carregaCarinho();
}

// Esvazia o carrinho e recarrega o carrinho após isso.
function esvaziarCarrinho() {
    fetch('./esvaziar-carrinho', {
        method: 'DELETE',
        headers: {
            'Content-Type': 'application/json',
        },
    })
        .then(response => {
            if (!response.ok) {
                throw new Error('Erro');
            }
            const contentType = response.headers.get('content-type');
            if (!contentType || !contentType.includes('application/json')) {
                return null;
            }
            return response.json();
        })
        .then(data => {
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
                throw new Error('Erro ao conseguir informações do produto');
            }
            return response.json();
        })
        .then(data => {
            atualizaValor(data);
            carregaCarrinhoProdutos(data);
            itensCarrinho()
        })
        .catch(error => {
            console.error(error);
        });
}
carregaCarinho();

// Atualiza a quantidade do produto no carrinho.
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
                throw new Error('Erro quantidade produto');
            }
            return response.json();
        })
        .then(data => {
            carregaCarinho();
        })
        .catch(error => {
            console.error(error);
        });
}

// Atualiza a quantidade do produto no carrinho.
function alterarQuantidade(produtoId, quantidade) {
    const inputElement = document.getElementById(`btn-quantidade-${produtoId}`);
    clearTimeout(inputElement.dataset.timeout);
    inputElement.dataset.timeout = setTimeout(function () {
        quantidadeProduto(produtoId, quantidade);
    }, 100);
}

// Calcula o valor total dos produtos no carrinho.
function calculaValor(carrinhoProdutos) {
    let valor = 0;
    carrinhoProdutos.forEach(carrinhoProdutos => {
        valor += carrinhoProdutos.valor * carrinhoProdutos.quantidade;
    });
    return valor;
}

// Mostra e atualiza o valor no elemento id.
function atualizaValor(carrinhoProdutos) {
    let valorTotalCarrinho = document.getElementById("valor-total");
    const valor = calculaValor(carrinhoProdutos);
    valorTotalCarrinho.textContent = valor.toFixed(2);
}

// Habilita ou desabilita o botão de finalizar compra com base da indentificação do produto no carrinho.
function itensCarrinho() {
    const ul = document.querySelector(".produtos");
    if (!ul.hasChildNodes()) {
        finalizarCompra.style.pointerEvents = "none";
    } else {
        finalizarCompra.style.pointerEvents = "auto";
    }
}



