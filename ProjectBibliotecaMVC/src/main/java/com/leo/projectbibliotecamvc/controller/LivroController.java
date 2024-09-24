package com.leo.projectbibliotecamvc.controller;

import com.leo.projectbibliotecamvc.dao.LivroDAO;
import com.leo.projectbibliotecamvc.model.Livro;
import java.io.IOException;
import java.sql.Date;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "LivroController", urlPatterns = {"/LivroController"})
public class LivroController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action != null) {
            switch (action) {
                case "list":
                    listBooks(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "delete":
                    deleteBook(request, response);
                    break;
                default:
                    listBooks(request, response);
                    break;
                case "search":
                    searchBookById(request, response);
                    break;

            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("update".equals(action)) {
            updateBook(request, response);
        } else if ("add".equals(action)) {
            addBook(request, response);
        }
    }

    private void searchBookById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Livro livro = LivroDAO.getLivroById(id);

        if (livro != null) {
            request.setAttribute("livro", livro);
            RequestDispatcher dispatcher = request.getRequestDispatcher("resultadoid.jsp");
            dispatcher.forward(request, response);
        } else {
            request.setAttribute("errorMessage", "Livro não encontrado.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("viewbooks.jsp");
            dispatcher.forward(request, response);
        }
    }

    private void listBooks(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Livro> list = LivroDAO.getAllBooks();

        if (list != null && !list.isEmpty()) {
            request.setAttribute("list", list);
            RequestDispatcher dispatcher = request.getRequestDispatcher("viewbooks.jsp");
            dispatcher.forward(request, response);
        } else {
            request.setAttribute("errorMessage", "Nenhum livro encontrado.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("viewbooks.jsp");
            dispatcher.forward(request, response);
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Livro livro = LivroDAO.getLivroById(id);

        if (livro != null) {
            request.setAttribute("livro", livro);
            RequestDispatcher dispatcher = request.getRequestDispatcher("editbook.jsp");
            dispatcher.forward(request, response);
        } else {
            request.setAttribute("errorMessage", "Livro não encontrado.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("viewbooks.jsp");
            dispatcher.forward(request, response);
        }
    }

    private void updateBook(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Livro livro = new Livro();
        livro.setId(id);
        livro.setNome(request.getParameter("nome"));
        livro.setNumPaginas(Integer.parseInt(request.getParameter("numPaginas")));
        livro.setDataPublicacao(Date.valueOf(request.getParameter("dataPublicacao")));
        livro.setPreco(Double.parseDouble(request.getParameter("preco")));
        livro.setNomeAutor(request.getParameter("nomeAutor"));
        livro.setNascAutor(Date.valueOf(request.getParameter("nascAutor")));
        livro.setNomeEditora(request.getParameter("nomeEditora"));

        int linhasAfetadas = LivroDAO.atualizarLivro(livro);

        if (linhasAfetadas > 0) {
            response.sendRedirect("LivroController?action=list");
        } else {
            response.sendRedirect("LivroController?action=editForm&id=" + id + "&errorMessage=Erro+ao+atualizar+livro");
        }
    }

    private void deleteBook(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Livro livro = new Livro();
        livro.setId(id);
        int linhasAfetadas = LivroDAO.removerLivro(livro);
        if (linhasAfetadas > 0) {
            response.sendRedirect("LivroController?action=list");
        } else {
            response.sendRedirect("LivroController?action=list&errorMessage=Erro+ao+remover+livro");
        }
    }

    private void addBook(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Livro livro = new Livro();
        livro.setNome(request.getParameter("nome"));
        livro.setNumPaginas(Integer.parseInt(request.getParameter("numPaginas")));
        livro.setDataPublicacao(Date.valueOf(request.getParameter("dataPublicacao")));
        livro.setPreco(Double.parseDouble(request.getParameter("preco")));
        livro.setNomeAutor(request.getParameter("nomeAutor"));
        livro.setNascAutor(Date.valueOf(request.getParameter("nascAutor")));
        livro.setNomeEditora(request.getParameter("nomeEditora"));
        int linhasAfetadas = LivroDAO.adicionarLivro(livro);
        if (linhasAfetadas > 0) {
            response.sendRedirect("LivroController?action=list");
        } else {
            response.sendRedirect("LivroController?action=addForm&errorMessage=Erro+ao+adicionar+livro");
        }
    }
}
