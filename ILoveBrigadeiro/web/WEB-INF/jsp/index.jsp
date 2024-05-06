<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
</head>

<body>
    <jsp:include page="header.jsp"></jsp:include>
    <div class="container">
        <h1 class="my-4">Listagem de Produtos</h1>
        <div class="row">
            <c:forEach var="produto" items="${produtos}">
                <div class="col-md-4 mb-3">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">${produto.nome}</h5>
                            <p class="card-text">Categoria: ${produto.categoria}</p>
                            <p class="card-text">Valor: R$ ${produto.valor}</p>
                            <p class="card-text">Descrição: ${produto.descricao}</p>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</body>

</html>