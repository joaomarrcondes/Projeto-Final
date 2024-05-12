<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tela de Cadastro</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>

<body>
    <main>
        <section class="container">
            <form name="formcadastro" action="cadastro" method="post">
                <div class="mb-3">
                    <label for="inputUsuario" class="form-label">Usuario</label>
                    <input name="usuario" class="form-control" type="text" id="inputUsuario">
                </div>
                <div class="mb-3">
                    <label for="inputSenha" class="form-label">Senha</label>
                    <input name="senha" class="form-control" type="password" id="inputSenha">
                </div>
                <div class="mb-3">
                    <label for="inputNome" class="form-label">Nome</label>
                    <input name="nome" class="form-control" type="text" id="inputNome">
                </div>
                <div class="mb-3">
                    <label for="inputTelefone" class="form-label">Telefone</label>
                    <input name="telefone" class="form-control" id="inputTelefone" type="tel"
                        onkeyup="handlePhone(event)" maxlength="15">
                </div>
                <div class="mb-3">
                    <label for="inputData" class="form-label">Data Nascimento</label>
                    <input name="data_nascimento" class="form-control" id="inputData" type="date">
                </div>
                <div class="mb-3">
                    <label for="inputCpf" class="form-label">Cpf</label>
                    <input name="cpf" class="form-control" id="inputCpf" type="text" onkeyup="handleCpf(event)"
                        maxlength="14">
                </div>
                <input type="button" value="Enviar" onclick="validacao()">
            </form>
        </section>
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