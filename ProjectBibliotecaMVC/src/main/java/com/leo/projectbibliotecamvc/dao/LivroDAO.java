/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.leo.projectbibliotecamvc.dao;

import com.leo.projectbibliotecamvc.model.Livro;
import com.leo.projectbibliotecamvc.util.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author levas
 */
public class LivroDAO {

    public static Livro getLivroById(int id) {
        Livro livro = null;
        try {
            Connection con = ConnectionFactory.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM livro WHERE id_livro = ?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                livro = new Livro();
                livro.setId(rs.getInt("id_livro"));
                livro.setNome(rs.getString("nome_livro"));
                livro.setNumPaginas(rs.getInt("num_paginas"));
                livro.setDataPublicacao(rs.getDate("data_publicacao"));
                livro.setPreco(rs.getDouble("preco"));
                livro.setNomeAutor(rs.getString("nome_autor"));
                livro.setNascAutor(rs.getDate("nasc_autor"));
                livro.setNomeEditora(rs.getString("nome_editora"));
                livro.setLivroCriacao(rs.getTimestamp("livro_criacao"));
                livro.setLivroEdicao(rs.getTimestamp("livro_edicao"));
                livro.setLivroRemocao(rs.getTimestamp("livro_remocao"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return livro;
    }

    public static List<Livro> getAllBooks() {
        List<Livro> list = new ArrayList<Livro>();
        try {
            Connection con = ConnectionFactory.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM livro;");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Livro livro = new Livro();
                livro.setId(rs.getInt("id_livro"));
                livro.setNome(rs.getString("nome_livro"));
                livro.setNumPaginas(rs.getInt("num_paginas"));
                livro.setDataPublicacao(rs.getDate("data_publicacao"));
                livro.setPreco(rs.getDouble("preco"));
                livro.setNomeAutor(rs.getString("nome_autor"));
                livro.setNascAutor(rs.getDate("nasc_autor"));
                livro.setNomeEditora(rs.getString("nome_editora"));
                livro.setLivroCriacao(rs.getTimestamp("livro_criacao"));
                livro.setLivroEdicao(rs.getTimestamp("livro_edicao"));
                livro.setLivroRemocao(rs.getTimestamp("livro_remocao"));
                list.add(livro);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static int atualizarLivro(Livro livro) {
        int status = 0;
        try {
            Connection con = ConnectionFactory.getConnection();
            String sql = "UPDATE livro SET nome_livro = ?, num_paginas = ?, data_publicacao = ?, preco = ?, nome_autor = ?, nasc_autor = ?, nome_editora = ?, livro_edicao = NOW() WHERE id_livro = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, livro.getNome());
            ps.setInt(2, livro.getNumPaginas());
            ps.setDate(3, new java.sql.Date(livro.getDataPublicacao().getTime()));
            ps.setDouble(4, livro.getPreco());
            ps.setString(5, livro.getNomeAutor());
            ps.setDate(6, new java.sql.Date(livro.getNascAutor().getTime()));
            ps.setString(7, livro.getNomeEditora());
            ps.setInt(8, livro.getId());
            status = ps.executeUpdate();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    public static int removerLivro(Livro livro) {
        int status = 0;
        try {
            Connection con = ConnectionFactory.getConnection();
            PreparedStatement ps = con.prepareStatement("DELETE FROM livro WHERE id_livro =?");
            ps.setInt(1, livro.getId());
            status = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    public static int adicionarLivro(Livro livro) {
        int status = 0;
        try {
            Connection con = ConnectionFactory.getConnection();
            PreparedStatement ps = con.prepareStatement("INSERT INTO livro (nome_livro, num_paginas, data_publicacao, preco, nome_autor, nasc_autor, nome_editora) VALUES (?, ?, ?, ?, ?, ?, ?)");
            ps.setString(1, livro.getNome());
            ps.setInt(2, livro.getNumPaginas());
            ps.setDate(3, livro.getDataPublicacao());
            ps.setDouble(4, livro.getPreco());
            ps.setString(5, livro.getNomeAutor());
            ps.setDate(6, livro.getNascAutor());
            ps.setString(7, livro.getNomeEditora());
            status = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
}
