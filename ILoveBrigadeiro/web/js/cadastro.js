function validacao() {
    let nome = formCadastro.nome.value;
    let senha = formCadastro.senha.value;
    let usuario = formCadastro.usuario.value;
    let telefone = formCadastro.telefone.value;
    let data_nascimento = formCadastro.data_nascimento.value;
    let cpf = formCadastro.cpf.value;

    if (nome.trim() === "") {
        $("#inputNome").notify(
            "Ops! Parece que você esqueceu de nos dizer seu nome.", "warn",
            { position: "botton center" }
        );
        formCadastro.nome.focus();
        return false;
    }
    else if (senha.trim() === "") {
        $("#inputSenha").notify(
            "Precisamos da sua senha para prosseguir. Pode digitá-la, por favor?", "warn",
            { position: "botton center" }
        );
        formCadastro.senha.focus();
        return false;
    }
    else if (senha.length < 8) {
        $("#inputSenha").notify(
            "Para sua segurança, a senha deve ter pelo menos 8 caracteres.", "warn",
            { position: "botton center" }
        );
        formCadastro.senha.focus();
        return false;
    }
    else if (usuario.trim() === "") {
        $("#inputUsuario").notify(
            "Seu nome de usuário é importante para nós. Por favor, preencha o campo.", "warn",
            { position: "botton center" }
        );
        formCadastro.usuario.focus();
        return false;
    }
    else if (users && users.some(item => item.usuario === usuario)) {
        $("#inputUsuario").notify(
            "Este nome de usuário já existe. Por favor, escolha outro para continuar.", "warn",
            { position: "botton center" }
        );
        formCadastro.usuario.focus();
        return false;
    }
    else if (telefone.trim() === "") {
        $("#inputTelefone").notify(
            "Por favor, informe seu número de telefone para que possamos contatá-lo.", "warn",
            { position: "botton center" }
        );
        formCadastro.telefone.focus();
        return false;
    }
    else if (telefone.length < 15) {
        $("#inputTelefone").notify(
            "Ah, parece que faltam dígitos no seu número de telefone.", "warn",
            { position: "botton center" }
        );
        formCadastro.telefone.focus();
        return false;
    }
    else if (users && users.some(item => item.telefone === telefone)) {
        $("#inputTelefone").notify(
            "Número de telefone já existente. Por favor, insira um número único.", "warn",
            { position: "botton center" }
        );
        formCadastro.cpf.focus();
        return false;
    }
    else if (data_nascimento.trim() === "") {
        $("#inputData").notify(
            "Para continuar, por favor, nos diga sua data de nascimento.", "warn",
            { position: "botton center" }
        );
        formCadastro.data_nascimento.focus();
        return false;
    }
    else if (cpf.trim() === "") {
        $("#inputCpf").notify(
            "Ah, você esqueceu de preencher seu CPF! Pode fazer isso agora?", "warn",
            { position: "botton center" }
        );
        formCadastro.cpf.focus();
        return false;
    }
    else if (cpf.length < 14) {
        $("#inputCpf").notify(
            "O CPF inserido está incompleto. Pode revisar e completar o campo corretamente?", "warn",
            { position: "botton center" }
        );
        formCadastro.cpf.focus();
        return false;
    }
    else if (users && users.some(item => item.cpf === cpf)) {
        $("#inputCpf").notify(
            "CPF já existente. Por favor, selecione um novo CPF.", "warn",
            { position: "botton center" }
        );
        formCadastro.cpf.focus();
        return false;
    }
    else {
        $.notify(
            "Parabéns! Seu cadastro foi concluído com sucesso. Bem-vindo à I Love Brigadeiro", "success"
        );
        setTimeout(function () {
            document.forms["formCadastro"].submit();
        }, 3000);
    }

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

