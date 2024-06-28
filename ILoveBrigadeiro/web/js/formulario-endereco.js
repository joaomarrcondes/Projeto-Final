const form = document.querySelector("#form-endereco");
const inputCep = document.querySelector("#input-cep");
const inputRua = document.querySelector("#input-rua");
const inputNumero = document.querySelector("#input-numero");
const inputBairro = document.querySelector("#input-bairro");
const inputCidade = document.querySelector("#input-cidade");
const inputEstado = document.querySelector("#input-estado");
const inputComplemento = document.querySelector("#input-complemento");

document.getElementById('input-rua').addEventListener('keypress', function(event) {
    var caractere = String.fromCharCode(event.which);
    if (!/^[a-zA-Z]+$/.test(caractere)) {
        event.preventDefault();
    }
});

document.getElementById('input-bairro').addEventListener('keypress', function(event) {
    var caractere = String.fromCharCode(event.which);
    if (!/^[a-zA-Z]+$/.test(caractere)) {
        event.preventDefault();
    }
});

document.getElementById('input-cidade').addEventListener('keypress', function(event) {
    var caractere = String.fromCharCode(event.which);
    if (!/^[a-zA-Z]+$/.test(caractere)) {
        event.preventDefault();
    }
});

document.getElementById('input-complemento').addEventListener('keypress', function(event) {
    var caractere = String.fromCharCode(event.which);
    if (!/^[a-zA-Z0-9]+$/.test(caractere)) {
        event.preventDefault();
    }
});

inputCep.addEventListener("keypress", (e) => {
    const onlyNumbers = /[0-9]|\-/;
    const key = String.fromCharCode(e.keyCode);
    if (!onlyNumbers.test(key)) {
        e.preventDefault();
        return;
    }
});

inputNumero.addEventListener("keypress", (e) => {
    const onlyNumbers = /[0-9]|\-/;
    const key = String.fromCharCode(e.keyCode);
    if (!onlyNumbers.test(key)) {
        e.preventDefault();
        return;
    }
});

inputCep.addEventListener("keyup", (e) => {
    const inputValue = e.target.value;
    if (inputValue.length === 8) {
        buscarEndereco(inputValue);
    }
});

const buscarEndereco = async (cep) => {
    inputCep.blur();
    const apiUrl = `https://viacep.com.br/ws/${cep}/json/`;
    const response = await fetch(apiUrl);
    const data = await response.json();

    if (data.erro) {
        form.reset();
        $(".class-input-cep").notify(
            "Ops! CEP incorreto. Por favor, verifique e tente novamente.", 
            "warn", { position:"right" }
          );
        return;
    }

    inputRua.value = data.logradouro;
    inputCidade.value = data.localidade;
    inputBairro.value = data.bairro;
    inputEstado.value = data.uf;
}

const button = document.getElementById('btn-pagamento');
button.disabled = true;

const rua = document.getElementById('input-rua');
const numero = document.getElementById('input-numero');
const bairro = document.getElementById('input-bairro');
const cidade = document.getElementById('input-cidade');

const formulario = [rua, numero, bairro, cidade]

function verificaFormulario() {
    let camposPreenchidos = true;

    formulario.forEach((field) => {
        if (field.value === '') {
            camposPreenchidos = false;
        }
    });

    if (camposPreenchidos) {
        button.removeAttribute('disabled');
    } else {
        button.disabled = true;
    }
}

formulario.forEach((field) => {
    field.addEventListener('input', verificaFormulario);
});
