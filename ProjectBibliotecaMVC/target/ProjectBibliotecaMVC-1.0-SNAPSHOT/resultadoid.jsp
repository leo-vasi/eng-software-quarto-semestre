<%@page import="com.leo.projectbibliotecamvc.model.Livro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Resultado da Pesquisa por ID</title>
        <link href="assets/css/styles.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <header>
            <h1>Resultado da Pesquisa por Livro</h1>
        </header>

        <main>
            <%
                Livro livro = (Livro) request.getAttribute("livro");
                String errorMessage = (String) request.getAttribute("errorMessage");
            %>

            <% if (livro != null) {%>
            <section id="resultado-livro">
                <table>
                    <thead>
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Nome</th>
                            <th scope="col">Número de Páginas</th>
                            <th scope="col">Data de Publicação</th>
                            <th scope="col">Preço</th>
                            <th scope="col">Nome do Autor</th>
                            <th scope="col">Nascimento do Autor</th>
                            <th scope="col">Editora</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><%= livro.getId()%></td>
                            <td><%= livro.getNome()%></td>
                            <td><%= livro.getNumPaginas()%></td>
                            <td><%= livro.getDataPublicacao()%></td>
                            <td><%= livro.getPreco()%></td>
                            <td><%= livro.getNomeAutor()%></td>
                            <td><%= livro.getNascAutor()%></td>
                            <td><%= livro.getNomeEditora()%></td>
                        </tr>
                    </tbody>
                </table>
                <br>
                <nav>
                    <a href="LivroController?action=edit&id=<%= livro.getId()%>" aria-label="Editar livro: <%= livro.getNome()%>" class="btn editar">
                        <img src="assets/images/update-icon.png" alt="Editar">
                    </a>
                    <a href="LivroController?action=delete&id=<%= livro.getId()%>" onclick="return confirmarDelecao()" aria-label="Deletar livro: <%= livro.getNome()%>" class="btn deletar">
                        <img src="assets/images/delete-icon.png" alt="Deletar">
                    </a>
                </nav>
                <br><br>
                <a href="viewbooks.jsp" aria-label="Retornar à página de visualização de livros">Retornar</a>
            </section>

            <% } else if (errorMessage != null) {%>
            <section id="mensagem-erro">
                <p><%= errorMessage%></p>
                <br>
                <a href="viewbooks.jsp" aria-label="Retornar à página de visualização de livros">Retornar</a>
            </section>
            <% }%>
        </main>

        <footer>
            <p>Biblioteca MVC - 2024</p>
        </footer>
        <script src="assets/js/script.js"></script>
    </body>
</html>
