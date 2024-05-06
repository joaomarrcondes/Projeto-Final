<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Produtos</title>
</head>

<body>
    <jsp:include page="header.jsp"></jsp:include>
    <main>
        <c:forEach items="${produtos}" var="produto">
            <div class="card" style="width: 18rem;">
                <img src="..." class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title">${produto.nome}</h5>
                    <p class="card-text">${produto.descricao}</p>
                    <p class="card-text">${produto.valor}</p>
                    <a href="#" class="btn btn-primary">Comprar</a>
                </div>
            </div>
        </c:forEach>
    </main>
</body>

</html>