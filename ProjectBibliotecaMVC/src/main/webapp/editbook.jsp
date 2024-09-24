<%@page import="com.leo.projectbibliotecamvc.model.Livro"%>
<%@page import="com.leo.projectbibliotecamvc.dao.LivroDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Editar Livro</title>
        <link href="assets/css/styles.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%
            String id = request.getParameter("id");
            Livro livro = LivroDAO.getLivroById(Integer.parseInt(id));
        %>

        <div class="container">
            <h1>Editar Livro</h1>
            <form action="LivroController?action=update&id=<%= id%>" method="POST" onsubmit="return validarFormulario()">
                <label for="nome">Nome do Livro</label>
                <input type="text" id="nome" name="nome" value="<%= livro.getNome()%>" required pattern="[A-Za-zÀ-ÿ\s]{2,100}" title="Somente letras, mínimo de 2 caracteres e máximo de 100">

                <label for="numPaginas">Número de Páginas</label>
                <input type="number" id="numPaginas" name="numPaginas" value="<%= livro.getNumPaginas()%>" required min="1" step="1" title="Número de páginas deve ser maior que 0">

                <label for="dataPublicacao">Data de Publicação</label>
                <input type="date" id="dataPublicacao" name="dataPublicacao" value="<%= livro.getDataPublicacao()%>" required>

                <label for="preco">Preço</label>
                <input type="number" id="preco" name="preco" value="<%= livro.getPreco()%>" required step="0.01" min="0" title="O preço deve ser um valor positivo">

                <label for="nomeAutor">Nome do Autor</label>
                <input type="text" id="nomeAutor" name="nomeAutor" value="<%= livro.getNomeAutor()%>" required pattern="[A-Za-zÀ-ÿ\s]{2,100}" title="Somente letras, mínimo de 2 caracteres e máximo de 100">

                <label for="nascAutor">Data de Nascimento do Autor</label>
                <input type="date" id="nascAutor" name="nascAutor" value="<%= livro.getNascAutor()%>" required>

                <label for="nomeEditora">Nome da Editora</label>
                <input type="text" id="nomeEditora" name="nomeEditora" value="<%= livro.getNomeEditora()%>" required pattern="[A-Za-zÀ-ÿ\s]{2,100}" title="Somente letras, mínimo de 2 caracteres e máximo de 100">

                <div class="form-actions">
                    <button type="submit" class="btn editar">Salvar</button>
                    <button type="button" onclick="window.location.href = 'viewbooks.jsp'" class="btn cancelar">Cancelar</button>
                </div>
            </form>
        </div>
        <script src="assets/js/script.js"></script>
    </body>
</html>
