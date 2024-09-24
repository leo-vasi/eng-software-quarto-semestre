<%@page import="com.leo.projectbibliotecamvc.dao.LivroDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.leo.projectbibliotecamvc.model.Livro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Visualização de todos os Livros</title>
        <link href="assets/css/styles.css" rel="stylesheet" type="text/css"/>
        <script src="assets/js/script.js"></script>
    </head>
    <body>
        <header>
            <h1>Livros disponíveis</h1>
        </header>

        <main>
            <section id="pesquisa-livros">
                <form action="LivroController" method="GET" onsubmit="return validarPesquisa()">
                    <label for="idPesquisa">Pesquisar por ID do Livro:</label>
                    <input type="number" id="idPesquisa" name="id" min="1" required>
                    <input type="hidden" name="action" value="search">
                    <button type="submit">Pesquisar</button>
                </form>
                <script>
                    function validarPesquisa() {
                        const idPesquisa = document.getElementById('idPesquisa').value;
                        if (!/^\d+$/.test(idPesquisa)) {
                            alert("Por favor, insira um número válido.");
                            return false;
                        }
                        return true;
                    }
                </script>
            </section>

            <%
                List<Livro> list = LivroDAO.getAllBooks();
                request.setAttribute("list", list);
            %>

            <section id="livros-lista">
                <table>
                    <thead>
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Nome do livro</th>
                            <th scope="col">Número de páginas</th>
                            <th scope="col">Data de publicação</th>
                            <th scope="col">Preço</th>
                            <th scope="col">Nome do autor</th>
                            <th scope="col">Nascimento do autor</th>
                            <th scope="col">Editora</th>
                            <th scope="col">Data de cadastro</th>
                            <th scope="col">Data de modificação</th>
                            <th scope="col">Data de remoção</th>
                            <th scope="col">Atualizar</th>
                            <th scope="col">Deletar</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if (list != null && !list.isEmpty()) {
                                for (Livro livro : list) {
                        %>
                        <tr>
                            <td><%= livro.getId()%></td>
                            <td><%= livro.getNome()%></td>
                            <td><%= livro.getNumPaginas()%></td>
                            <td><%= livro.getDataPublicacao()%></td>
                            <td><%= livro.getPreco()%></td>
                            <td><%= livro.getNomeAutor()%></td>
                            <td><%= livro.getNascAutor()%></td>
                            <td><%= livro.getNomeEditora()%></td>
                            <td><%= livro.getLivroCriacao()%></td>
                            <td><%= livro.getLivroEdicao()%></td>
                            <td><%= livro.getLivroRemocao()%></td>
                            <td>
                                <a href="editbook.jsp?id=<%= livro.getId()%>" aria-label="Editar livro: <%= livro.getNome()%>" class="btn editar">
                                    Editar
                                </a>
                            </td>
                            <td>
                                <a href="LivroController?action=delete&id=<%= livro.getId()%>" onclick="return confirmarDelecao()" aria-label="Deletar livro: <%= livro.getNome()%>" class="btn deletar">
                                    Deletar
                                </a>
                            </td>
                        </tr>
                        <% }
                    } else { %>
                        <tr>
                            <td colspan="13">Nenhum livro encontrado</td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>
            </section>

            <div class="center-links">
                <a href="index.jsp" aria-label="Voltar à página inicial">Página inicial</a>
                <a href="addlivro.jsp" aria-label="Adicionar um novo livro">Adicionar novo livro</a>
            </div>
        </main>
    </body>
</html>
