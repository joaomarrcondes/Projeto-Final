document.addEventListener('DOMContentLoaded', function () {
    const btnCartaoCredito = document.getElementById('btn-metodo-cartao');
    const btnPix = document.getElementById('btn-metodo-pix');
    const conteudoCartaoCredito = document.getElementById('container-cartao');
    const conteudoPix = document.getElementById('container-pix');

    btnCartaoCredito.addEventListener('click', function () {
        conteudoCartaoCredito.style.display = 'block';
        conteudoPix.style.display = 'none';
    });

    btnPix.addEventListener('click', function () {
        conteudoCartaoCredito.style.display = 'none';
        conteudoPix.style.display = 'block';
    });
});

function validaNumeroCartao(input) {
    input.value = input.value.replace(/\D/g, '');
}

function validaCvvCartao(input) {
    input.value = input.value.replace(/\D/g, '');
}

function validaNomeCartao(input) {
    input.value = input.value.replace(/[^a-zA-Z\s]/g, '');
}

const button = document.querySelector('.btn-pagamento-compras')
const popup = document.querySelector('.popup-wrapper')

button.addEventListener('click', () => {
    popup.style.display = 'block'
});

popup.addEventListener('click', event => {
    const nomeClasseClicada = event.target.classList[0]
    const fechaPopup = nomeClasseClicada === 'popup-fechar' || nomeClasseClicada === 'popup-wrapper'
    if (fechaPopup) {
        popup.style.display = 'none'
        window.location.href = './home';
    }
})