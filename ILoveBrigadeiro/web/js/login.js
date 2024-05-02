function validacao() {
    let user = formlogin.user.value;
    let password = formlogin.password.value;

    if (user.trim() === "") {
        alert("Preencha o Campo Usuário");
        formlogin.user.focus();
        return false;
    } else if (password.trim() === "") {
        alert("Preencha o Campo Senha");
        formlogin.password.focus();
        return false;
    } else {
        let matchedUser = users.find(item => item.user === user && item.password === password);
        if (!matchedUser) {
            alert("Usuário ou Senha Incorretos!");
            formlogin.user.focus();
            formlogin.password.focus();
            return false;
        } else {
            sendUserId(matchedUser.id_usuario);
            document.forms["formlogin"].submit();
        }
    }
    document.forms["formlogin"].submit();
}

function sendUserId(userId) {
    fetch(`./logar?userId=${userId}`)
        .then(response => {
            if (!response.ok) {
                throw new Error('Erro ao enviar solicitação');
            }
        })
        .catch(error => {
            console.error(error);
        });
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