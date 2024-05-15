<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tela de Cadastro</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="./style/cadastro.css">
</head>

<body>
    <main>
        <div class="container-esquerda">
            <h2 id="titulo">Criar Nova Conta de Cliente</h2>
            <h3 id="subtitulo1">Informações Pessoais</h3>
            <hr id="linha1">
            <form name="formcadastro" action="cadastro" method="post">
                <div class="mb-3">
                    <label for="inputNome" class="form-label">Nome Completo</label>
                    <input name="nome" class="form-control" type="text" id="inputNome" placeholder="Nome Completo">
                </div>
                <div class="mb-3">
                    <label for="inputTelefone" class="form-label">Telefone</label>
                    <input name="telefone" class="form-control" id="inputTelefone" type="tel"
                        onkeyup="handlePhone(event)" maxlength="15" placeholder="(00)00000-0000">
                </div>
                <div class="mb-3">
                    <label for="inputCpf" class="form-label">Cpf</label>
                    <input name="cpf" class="form-control" id="inputCpf" type="text" onkeyup="handleCpf(event)"
                        maxlength="14" placeholder="000.000.000-00">
                </div>
                <div class="mb-3">
                    <label for="inputData" class="form-label">Data Nascimento</label>
                    <input name="data_nascimento" class="form-control" id="inputData" type="date">
                </div>
                <h3 id="subtitulo2">Informações de Acesso</h3>
                <hr id="linha2">
                <div class="mb-3">
                    <label for="inputUsuario" class="form-label">Usuario</label>
                    <input name="usuario" class="form-control" type="text" id="inputUsuario" placeholder="Username">
                </div>
                <div class="mb-3">
                    <label for="inputSenha" class="form-label">Senha</label>
                    <input name="senha" class="form-control" type="password" id="inputSenha"
                        placeholder="Mínimo de 8 caracteres">
                </div>
                <input id="btn-criar" type="button" value="Criar uma Conta" onclick="validacao()">
            </form>
        </div>
        <div class="container-direita">
            <img src="./assets/ILoveBrigadeiro.png" alt="logo">
            <h2 id="titulo2">Seja Bem-Vindo!</h2>
            <span>Para se conectar conosco</span> <br>
            <span>faça login com seu Usuário e Senha</span> <br>
            <button id="btn-entrar"><a href="">Entrar</a></button>
        </div>

    </main>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
        integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
        integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>
    <script src="./js/cadastro.js"></script>
</body>

</html>