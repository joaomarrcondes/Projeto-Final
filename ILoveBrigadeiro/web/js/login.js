function validacao() {
    let user = formLogin.user.value;
    let password = formLogin.password.value;

    if (user.trim() === "") {
        $.notify("Por favor, insira seu nome de usuário para continuar.", "warn");
        formLogin.user.focus();
        return false;
    } else if (password.trim() === "") {
        $.notify("Por favor, insira sua senha para continuar.", "warn");
        formLogin.password.focus();
        return false;
    } else {
        let matchedUser = users.find(item => item.usuario === user && item.senha === password);
        if (!matchedUser) {
            $.notify("Ops! Parece que o nome de usuário ou a senha está incorreta. Por favor, tente novamente.", "error");
            return false;
        } else {
            document.forms["formLogin"].submit();
        }
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
