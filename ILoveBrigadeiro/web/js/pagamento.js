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
  
    if (input.value.trim() === '') {
        input.setCustomValidity('O nome não pode estar vazio.');
    } else {
        input.setCustomValidity('');
    }
}