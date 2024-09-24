<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Adicionar Novo Livro</title>
        <link href="assets/css/styles.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <h1>Adicionar Novo Livro</h1>
            <form action="LivroController?action=add" method="POST" onsubmit="return validarFormulario()">
                <label for="nome">Nome do Livro</label>
                <input type="text" id="nome" name="nome" required pattern="[A-Za-z�-�\s]{2,100}" title="Somente letras, m�nimo de 2 caracteres e m�ximo de 100">

                <label for="numPaginas">N�mero de P�ginas</label>
                <input type="number" id="numPaginas" name="numPaginas" required min="1" step="1" title="N�mero de p�ginas deve ser maior que 0">

                <label for="dataPublicacao">Data de Publica��o</label>
                <input type="date" id="dataPublicacao" name="dataPublicacao" required>

                <label for="preco">Pre�o</label>
                <input type="number" id="preco" name="preco" required step="0.01" min="0" title="O pre�o deve ser um valor positivo">

                <label for="nomeAutor">Nome do Autor</label>
                <input type="text" id="nomeAutor" name="nomeAutor" required pattern="[A-Za-z�-�\s]{2,100}" title="Somente letras, m�nimo de 2 caracteres e m�ximo de 100">

                <label for="nascAutor">Data de Nascimento do Autor</label>
                <input type="date" id="nascAutor" name="nascAutor" required>

                <label for="nomeEditora">Nome da Editora</label>
                <input type="text" id="nomeEditora" name="nomeEditora" required pattern="[A-Za-z�-�\s]{2,100}" title="Somente letras, m�nimo de 2 caracteres e m�ximo de 100">

                <div class="form-actions">
                    <button type="submit" class="btn adicionar">Adicionar</button>
                    <button type="button" onclick="window.location.href = 'viewbooks.jsp'" class="btn cancelar">Cancelar</button>
                </div>
            </form>

            <% if (request.getAttribute("errorMessage") != null) {%>
            <p class="error-message"><%= request.getAttribute("errorMessage")%></p>
            <% }%>
        </div>
        <script src="assets/js/script.js"></script>
    </body>
</html>
