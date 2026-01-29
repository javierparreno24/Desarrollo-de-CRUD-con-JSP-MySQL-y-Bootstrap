/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package config;

import java.sql.Connection;
import java.sql.DriverManager;

public class Database {
    // Configuración de tu DB MySQL
    private static final String URL = "jdbc:mysql://localhost:3306/gestion_academica";
    private static final String USER = "root";
    private static final String PASS = ""; // Tu contraseña de MySQL

    public static Connection getConnection() {
        Connection con = null;
        try {
            // Cargar el driver JDBC (Asegúrate de tener el .jar en Libraries)
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(URL, USER, PASS);
        } catch (Exception e) {
            System.err.println("Error de conexión: " + e.getMessage());
        }
        return con;
    }
}
