function validacao() {
    let user = formLogin.user.value;
    let password = formLogin.password.value;

    if (user.trim() === "") {
        $("#input-usuario").notify(
            "Por Favor, insira seu nome de usuário para continuar.", "warn",
            { position: "top center" }
        );
        formLogin.user.focus();
        return false;
    } else if (password.trim() === "") {
        $("#input-senha").notify(
            "Por favor, informe sua senha para que possamos continuar.", "warn",
            { position: "top center" }
        );
        formLogin.password.focus();
        return false;
    } else {
        let matchedUser = users.find(item => item.usuario === user && item.senha === password);
        if (!matchedUser) {
            $.notify("Ops! Parece que o nome de usuário ou a senha está incorreta. Por favor, tente novamente.", "error");
            return false;
        } else {
            $.notify(
                "Login realizado com sucesso! Prepare-se para uma experiência incrível.", "success"
            );
            setTimeout(function () {
                document.forms["formLogin"].submit();
            }, 3000);
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
