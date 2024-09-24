/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.leo.projectbibliotecamvc.model;

import java.sql.Date;
import java.sql.Timestamp;

/**
 *
 * @author levas
 */
public class Livro {
    private int id;
    private String nome;
    private int numPaginas;
    private Date dataPublicacao;
    private double preco;
    private String nomeAutor;
    private Date nascAutor;
    private String nomeEditora;
    private Timestamp livroCriacao;
    private Timestamp livroEdicao;
    private Timestamp livroRemocao;

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the nome
     */
    public String getNome() {
        return nome;
    }

    /**
     * @param nome the nome to set
     */
    public void setNome(String nome) {
        this.nome = nome;
    }

    /**
     * @return the numPaginas
     */
    public int getNumPaginas() {
        return numPaginas;
    }

    /**
     * @param numPaginas the numPaginas to set
     */
    public void setNumPaginas(int numPaginas) {
        this.numPaginas = numPaginas;
    }

    /**
     * @return the dataPublicacao
     */
    public Date getDataPublicacao() {
        return dataPublicacao;
    }

    /**
     * @param dataPublicacao the dataPublicacao to set
     */
    public void setDataPublicacao(Date dataPublicacao) {
        this.dataPublicacao = dataPublicacao;
    }

    /**
     * @return the preco
     */
    public double getPreco() {
        return preco;
    }

    /**
     * @param preco the preco to set
     */
    public void setPreco(double preco) {
        this.preco = preco;
    }

    /**
     * @return the nomeAutor
     */
    public String getNomeAutor() {
        return nomeAutor;
    }

    /**
     * @param nomeAutor the nomeAutor to set
     */
    public void setNomeAutor(String nomeAutor) {
        this.nomeAutor = nomeAutor;
    }

    /**
     * @return the nascAutor
     */
    public Date getNascAutor() {
        return nascAutor;
    }

    /**
     * @param nascAutor the nascAutor to set
     */
    public void setNascAutor(Date nascAutor) {
        this.nascAutor = nascAutor;
    }

    /**
     * @return the nomeEditora
     */
    public String getNomeEditora() {
        return nomeEditora;
    }

    /**
     * @param nomeEditora the nomeEditora to set
     */
    public void setNomeEditora(String nomeEditora) {
        this.nomeEditora = nomeEditora;
    }

    /**
     * @return the livroCriacao
     */
    public Timestamp getLivroCriacao() {
        return livroCriacao;
    }

    /**
     * @param livroCriacao the livroCriacao to set
     */
    public void setLivroCriacao(Timestamp livroCriacao) {
        this.livroCriacao = livroCriacao;
    }

    /**
     * @return the livroEdicao
     */
    public Timestamp getLivroEdicao() {
        return livroEdicao;
    }

    /**
     * @param livroEdicao the livroEdicao to set
     */
    public void setLivroEdicao(Timestamp livroEdicao) {
        this.livroEdicao = livroEdicao;
    }

    /**
     * @return the livroRemocao
     */
    public Timestamp getLivroRemocao() {
        return livroRemocao;
    }

    /**
     * @param livroRemocao the livroRemocao to set
     */
    public void setLivroRemocao(Timestamp livroRemocao) {
        this.livroRemocao = livroRemocao;
    }
    
    
}
