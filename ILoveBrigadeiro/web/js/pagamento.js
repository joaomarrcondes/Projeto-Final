function Conteudo(pagamento) {
    var display = document.getElementById(pagamento).style.display;
    if (display == "none")
        document.getElementById(pagamento).style.display = 'block';
    else
        document.getElementById(pagamento).style.display = 'none';
}


function validacaoNumeroCartao(input) {
    input.value = input.value.replace(/\D/g, '');
}

function validacaoCvvCartao(input) {
    input.value = input.value.replace(/\D/g, '');
}

function validacaoPagamentoCartao(){
    const inputNumero = document.getElementById('input-numero-cartao').value.trim();
    const inputNome = document.getElementById('input-nome-cartao').value.trim();
    const inputCvv = document.getElementById('input-cvv-cartao').value;

    if (inputNumero.length !== 16 || !/^\d+$/.test(inputNumero)) {
        alert('Numero de cartao invalido');
        return false;
    }

    if (inputNome === "") {
        
    }

    if (inputCvv.length !== 3 || !/^\d+$/.test(inputCvv)) {
        
    }
}