function criarCategoria(categoria) {
    const li = document.createElement('li');
    li.innerHTML = `
            <a href="./buscar-produtos?categoria=${categoria.id_categoria}&busca=">${categoria.nome}</a>
        `;
    return li;
}

function carregarCategoria(categorias) {
    const ul = document.querySelector('.categoria');
    categorias.forEach(categoria => {
        const item = criarCategoria(categoria);
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
