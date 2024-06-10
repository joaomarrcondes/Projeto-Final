document.addEventListener("DOMContentLoaded", function () {
    const btnAbrir = document.getElementById("btn-abrir-carrinho");
    const btnFechar = document.getElementById("btn-fechar-carrinho");
    const background = document.getElementById("background");
    const carrinho = document.getElementById("carrinho-compras");
    const body = document.body;
    const btnFinalizar = document.getElementById("btn-finalizar");
    

    btnAbrir.addEventListener('click', toggleCarrinho);
    btnFechar.addEventListener('click', toggleCarrinho);
    background.addEventListener('click', toggleCarrinho);

    function toggleCarrinho(event) {
        carrinho.classList.toggle('open');
        background.classList.toggle('open');
        body.classList.toggle('no-scroll');
    }
});

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
              <input id="btn-quantidade" onclick="quantidadeProduto(${carrinhoProdutos.id_carrinho}, this.value)" type="number" value="${carrinhoProdutos.quantidade}" min="1" max="10" step="1" />
              </div>
            </div>
        </section>
        <br>
        <hr>
    <br>
    `;
    return cardProduto;
}


function carregaCarrinhoProdutos(carrinhoProdutos) {
    const element = document.querySelector('.list-group-item');

    element.innerHTML = '';

    carrinhoProdutos.forEach(carrinhoProdutos => {
        const card = criaCardCarrinho(carrinhoProdutos);
        element.appendChild(card);
    });
}

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
            console.log('tudo removido', data);
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
                throw new Error('Erro ao conseguir informações do produto');
            }
            return response.json();
        })
        .then(data => {
            if (data === "") {
                btnFinalizar.disabled = true;
            }
            atualizaValor(data);
            carregaCarrinhoProdutos(data);
        })
        .catch(error => {
            console.error(error);
        });
}
carregaCarinho();

function quantidadeProduto(produtoId, quantidade){
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
        if(!response.ok){
            throw new Error('Erro quantidade produto');
        }
        return response.json();
    })
    .catch(error => {
        console.error(error);
    });
    carregaCarinho();
}

function calculaValor(carrinhoProdutos){
    let valor = 0;
    carrinhoProdutos.forEach(carrinhoProdutos => {
        valor += carrinhoProdutos.valor * carrinhoProdutos.quantidade;
    });
    return valor;
}

function atualizaValor(carrinhoProdutos){
    let valorTotalCarrinho = document.getElementById("valor-total");
    const valor = calculaValor(carrinhoProdutos);
    valorTotalCarrinho.textContent = valor.toFixed(2);
}


