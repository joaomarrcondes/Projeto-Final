const form = document.querySelector("#form-endereco");
const inputCep = document.querySelector("#input-cep");
const inputRua = document.querySelector("#input-rua");
const inputNumero = document.querySelector("#input-numero");
const inputComplemento = document.querySelector("#input-complemento");
const inputBairro = document.querySelector("#input-bairro");
const inputCidade = document.querySelector("#input-cidade");
const inputEstado = document.querySelector("#input-estado");

inputCep.addEventListener("keypress", (e) => {
    const onlyNumbers = /[0-9]|\-/;
    const key = String.fromCharCode(e.keyCode);
    if (!onlyNumbers.test(key)) {
        e.preventDefault();
        return;
    }
});

inputNumero.addEventListener("keypress", (e) => {
    const onlyNumbers = [0-9];
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
        alert("CEP inválido. Verifique e tente novamente.");
        return;
    }

    inputRua.value = data.logradouro;
    inputCidade.value = data.localidade;
    inputBairro.value = data.bairro;
    inputEstado.value = data.uf;
}