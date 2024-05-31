function validacao() {
    let user = formLogin.user.value;
    let password = formLogin.password.value;

    if (user.trim() === "") {
        alert("Insira seu Nome de Usuário");
        return false;
    } else if (password.trim() === "") {
        alert("Insira sua Senha");
        return false;
    } else {
        let matchedUser = users.find(item => item.usuario === user && item.senha === password);
        if (!matchedUser) {
            alert("Usuário ou Senha Incorretos");
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
