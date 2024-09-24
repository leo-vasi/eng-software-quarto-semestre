/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.leo.projectbibliotecamvc.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author levas
 */
public class ConnectionFactory {

    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        String DRIVER = "com.mysql.cj.jdbc.Driver";
        String URL = "jdbc:mysql://localhost:3306/bibliotecamvc";
        String USER = "root";
        String PASSWORD = "";
        Class.forName(DRIVER);
        Connection con = DriverManager.getConnection(URL, USER, PASSWORD);
        return con;
    }
};
