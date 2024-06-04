function criarCategoria(categorias) {
    const li = document.createElement('li');
    li.innerHTML = `
        <a href="./buscar-produtos?categoria=${categorias.id_categoria}&buscar=">${categorias.nome}</a>
    `;
    return li;
}

function carregarCategoria(categorias) {
    const ul = document.querySelector('.categoria');

    categorias.forEach(categorias => {
        const item = criarCategoria(categorias);
        ul.appendChild(item);
    });
}

fetch('./lista-categorias')
    .then(response => {
        if (!response.ok) {
            throw new Error('Erro ao conseguir informações do produto');
        }
        return response.json();
    })
    .then(data => {
        carregarCategoria(data);
    })
    .catch(error => {
        console.error(error);
    });