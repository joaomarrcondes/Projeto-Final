function validacao() {
    let user = formlogin.User.value;
    let password = formlogin.Password.value;

    console.log("Usuário digitado:", user);
    console.log("Senha digitada:", password);

    if (user.trim() === "") {
        alert("Preencha o Campo Usuário");
        return false;
    } else if (password.trim() === "") {
        alert("Preencha o Campo Senha");
        return false;
    } else if (users && users.some(item => item.user !== user) || users && users.some (item => item.password !== password)) {
        alert("tudo errado");
        return false;
    }
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
        console.log(users);
    })
    .catch(error => {
        console.error(error);
    });
