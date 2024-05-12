function validacao() {
    let user = formLogin.user.value;
    let password = formLogin.password.value;

    if (user.trim() === "") {
        alert("Preencha o Campo Usuário");
        return false;
    } else if (password.trim() === "") {
        alert("Preencha o Campo Senha");
        return false;
    } else {
        let matchedUser = users.find(item => item.usuario === user && item.senha === password);
        if (!matchedUser) {
            alert("tudo errado");
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
