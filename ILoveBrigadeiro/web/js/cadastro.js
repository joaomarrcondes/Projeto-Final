function validacao() {
    let nome = formCadastro.nome.value;
    let senha = formCadastro.senha.value;
    let usuario = formCadastro.usuario.value;
    let telefone = formCadastro.telefone.value;
    let data_nascimento = formCadastro.data_nascimento.value;
    let cpf = formCadastro.cpf.value;

    if (nome.trim() === "") {
        alert("Insira seu Nome Completo");
        formCadastro.nome.focus();
        return false;
    }
    else if (senha.trim() === "") {
        alert("Insira seu Senha");
        formCadastro.senha.focus();
        return false;
    }
    else if (senha.length < 8) {
        alert('Sua Senha Deve Conter No Mínimo 8 Caracteres');
        formCadastro.senha.focus();
        return false;
    }
    else if (usuario.trim() === "") {
        alert("Insira seu Nome de Usuário");
        formCadastro.usuario.focus();
        return false;
    }
    else if (users && users.some(item => item.usuario === usuario)) {
        alert('Esse Nome de Usuário já Possui Cadastro');
        formCadastro.usuario.focus();
        return false;
    }
    else if (telefone.trim() === "") {
        alert("Insira seu Número de Telefone");
        formCadastro.telefone.focus();
        return false;
    }
    else if (telefone.length < 15 || telefone.length >= 16) {
        alert('Preencha o Campo Telefone Corretamente');
        formCadastro.telefone.focus();
        return false;
    }
    else if (users && users.some(item => item.telefone === telefone)) {
        alert('Esse Número de Telefone já Possui Cadastro');
        formCadastro.cpf.focus();
        return false;
    }
    else if (data_nascimento.trim() === "") {
        alert("Insira sua Data de Nascimento");
        formCadastro.data_nascimento.focus();
        return false;
    }
    else if (data_nascimento > dataFormatada) {
        alert('Selecione Uma Data de Nascimento Válida');
        formCadastro.data_nascimento.focus();
        return false;
    }
    else if (cpf.trim() === "") {
        alert("Insira seu Cpf");
        formCadastro.cpf.focus();
        return false;
    }
    else if (cpf.length < 14 || cpf.length >= 15) {
        alert('Preencha o Campo Cpf Corretamente');
        formCadastro.cpf.focus();
        return false;
    }
    else if (users && users.some(item => item.cpf === cpf)) {
        alert('Esse Cpf já Possui Cadastro');
        formCadastro.cpf.focus();
        return false;
    }

    document.forms["formCadastro"].submit();
}

let users;
fetch('./users')
    .then(response => {
        if (!response.ok) {
            throw new Error('Erro ao conseguir informações do usuário');
        }
        return response.json();
    })
    .then(data => {
        users = data;
    })
    .catch(error => {
        console.error(error);
    });

const verificaTelefone = (event) => {
    let input = event.target;
    input.value = mascaraTelefone(input.value);
}

const mascaraTelefone = (value) => {
    if (!value) return "";
    value = value.replace(/\D/g, '');
    value = value.replace(/(\d{2})(\d)/, "($1) $2");
    value = value.replace(/(\d)(\d{4})$/, "$1-$2");
    return value;
}

const verificaCpf = (event) => {
    let input = event.target;
    input.value = mascaraCpf(input.value);
}

const mascaraCpf = (value) => {
    if (!value) return "";
    value = value.replace(/\D/g, "");
    value = value.replace(/(\d{3})(\d)/, "$1.$2");
    value = value.replace(/(\d{3})(\d)/, "$1.$2");
    value = value.replace(/(\d{3})(\d{1,2})$/, "$1-$2");
    return value;
}

let dataAtual = new Date();
let dataFormatada = dataAtual.getFullYear() + '-' +
    ('0' + (dataAtual.getMonth() + 1)).slice(-2) + '-' +
    ('0' + dataAtual.getDate()).slice(-2);

let elementoData = document.getElementById("inputData");
elementoData.setAttribute("max", dataFormatada);

