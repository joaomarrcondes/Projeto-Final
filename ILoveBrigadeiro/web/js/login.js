function validacao() {
    let user = formlogin.user.value;
    let password = formlogin.password.value;

    console.log("Usuário digitado:", user);
    console.log("Senha digitada:", password);

    if (user.trim() === "") {
        alert("Preencha o Campo Usuário");
        return false;
    } else if (password.trim() === "") {
        alert("Preencha o Campo Senha");    
        return false;
    } else {
        let matchedUser = users.find(item => item.user === user && item.password === password);
        if (!matchedUser) {
             alert("o Campo Usuário e senha errado");         
            return false;
        } else {
            sendUserId(matchedUser.idUser);
            document.forms["formlogin"].submit();
            return true;
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
            console.log("Usuários carregados:", users);
        })
        .catch(error => {
            console.error(error);
        });
