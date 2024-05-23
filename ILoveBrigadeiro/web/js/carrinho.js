document.addEventListener("DOMContentLoaded", function () {
    const btnAbrir = document.getElementById("btn-abrir-carrinho");
    const btnFechar = document.getElementById("btn-fechar-carrinho");
    const background = document.getElementById("background");
    const carrinho = document.getElementById("carrinho-compras");

    btnAbrir.addEventListener('click', toggleCarrinho);
    btnFechar.addEventListener('click', toggleCarrinho);
    background.addEventListener('click', toggleCarrinho);

    function toggleCarrinho(event) {
        carrinho.classList.toggle('open');
        background.classList.toggle('open');
    }
});

function criaCardCarrinho(carrinhoProdutos) {

    carrinhoProdutos.innerHTML = `
        <section class="produto-carrinho" id="${carrinhoProdutos.id_carrinho}">
            <div class="imagem-carrinho">
                <img src="data:imagem/png;base64,${carrinhoProdutos.imagem.value}"
                    alt="${carrinhoProdutos.nome}">
            </div>
            <div class="nome-produto">
                <span>${carrinhoProdutos.nome}</span>
            </div>
            <div class="btn-deleta-produto">
                <i class="fa-solid fa-trash-can fa-xs btn btn-outline-danger" onclick="deleteItem(${carrinhoProdutos.id_carrinho})"></i>
            </div>
            <div class="valor-carrinho">
                <span>R$${carrinhoProdutos.valor.toFixed(2)}</span>
            </div>
        </section>
    `;
    return carrinhoProdutos;
}


function carregaCarrinhoProdutos(carrinhoProdutos) {
    const element = document.querySelector('.list-group-item');

    element.innerHTML = '';

    carrinhoProdutos.forEach(carrinhoProdutos => {
        const card = criaCardCarrinho(carrinhoProdutos);
        element.appendChild(card);
    });
}

function carregaCarinho() {
    fetch('./carrinho-produtos')
        .then(response => {
            if (!response.ok) {
                throw new Error('Erro ao obter dados dos produtos');
            }
            return response.json();
        })
        .then(data => {
            //carregaCarrinhoProdutos(data);
            console.log(data)
        })
        .catch(error => {
            console.error(error);
        });
}
carregaCarinho();




