function validacao() {
    let nome = formcadastro.nome.value;
    let senha = formcadastro.senha.value;
    let usuario = formcadastro.usuario.value;
    let telefone = formcadastro.telefone.value;
    let data = formcadastro.data.value;
    let cpf = formcadastro.cpf.value;

    if (nome.trim() === "") {
        alert("Preencha o Campo Nome");
        formcadastro.nome.focus();
        return false;
    }
    else if (senha.trim() === "") {
        alert("Preencha o Campo Senha");
        formcadastro.senha.focus();
        return false;
    }
    else if (senha.length < 8) {
        alert('Senha Deve Conter Pelo Menos 8 Caracteres');
        frmRegister.senha.focus();
        return false;
    }
    else if (usuario.trim() === "") {
        alert("Preencha o Campo Usuário");
        formcadastro.usuario.focus();
        return false;
    }
    else if (users && users.some(item => item.usuario === usuario)) {
        alert('Esse Nome já Possui um Cadastro');
        formcadastro.usuario.focus();
        return false;
    }
    else if (telefone.trim() === "") {
        alert("Preencha o Campo Telefone");
        formcadastro.telefone.focus();
        return false;
    }
    else if (telefone.length < 15 || telefone.length >= 16) {
        alert('Preencha o Campo Telefone Corretamente');
        formcadastro.telefone.focus();
        return false;
    }
    else if (users && users.some(item => item.telefone === telefone)) {
        alert('Esse Número já Possui um Cadastro');
        formcadastro.cpf.focus();
        return false;
    }
    else if (data.trim() === "") {
        alert("Preencha o Campo Data de Nascimento");
        formcadastro.data.focus();
        return false;
    }
    else if (data > dataFormatada) {
        alert('Selecione Uma Data Válida');
        formcadastro.data.focus();
        return false;
    }
    else if (cpf.trim() === "") {
        alert("Preencha o Campo Cpf");
        formcadastro.cpf.focus();
        return false;
    }
    else if (cpf.length < 14 || cpf.length >= 15) {
        alert('Preencha o Campo Cpf Corretamente');
        formcadastro.cpf.focus();
        return false;
    }
    else if (users && users.some(item => item.cpf === cpf)) {
        alert('Cpf de Usuário já Possui um Cadastro');
        formcadastro.cpf.focus();
        return false;
    }

    document.forms["formcadastro"].submit();
}

let users;
fetch('./users')
    .then(response => {
        if (!response.ok) {
            throw new Error('erro ao obter dados do usuario');
        }
        return response.json();
    })
    .then(data => {
        users = data;
    })
    .catch(error => {
        console.error(error);
    });

const handlePhone = (event) => {
    let input = event.target;
    input.value = phoneMask(input.value);
}

const phoneMask = (value) => {
    if (!value) return "";
    value = value.replace(/\D/g, '');
    value = value.replace(/(\d{2})(\d)/, "($1) $2");
    value = value.replace(/(\d)(\d{4})$/, "$1-$2");
    return value;
}

const handleCpf = (event) => {
    let input = event.target;
    input.value = cpfMask(input.value);
}

const cpfMask = (value) => {
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

let elementoData = document.getElementById("inputDate");
elementoData.setAttribute("max", dataFormatada);

