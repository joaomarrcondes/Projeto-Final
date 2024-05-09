//função que cria as li de cada categoria
function criarCategoria(categorias) {
    const li = document.createElement('li');
    li.innerHTML = `
        <a href="./search-product?category=${categorias.id_categoria}&search=">${categorias.nome}</a>
    `;
    return li;
}

//função que carregar as categorias na ul
function carregarCategoria(categorias) {
    const ul = document.querySelector('.categoria');

    categorias.forEach(categorias => {
        const item = criarCategoria(categorias);
        ul.appendChild(item);
    });
}

//Acesso aos dados da lista de categorias
fetch('./lista-categorias')
    .then(response => {
        if (!response.ok) {
            throw new Error('Erro ao obter dados dos produtos');
        }
        return response.json();
    })
    .then(data => {
        carregarCategoria(data);
    })
    .catch(error => {
        console.error(error);
    });