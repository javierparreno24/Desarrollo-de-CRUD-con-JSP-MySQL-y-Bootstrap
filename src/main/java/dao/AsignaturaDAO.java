/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;
import config.Database; // Clase de conexión
import model.Asignatura;
import java.sql.*;
import java.util.*;

public class AsignaturaDAO {
    // Listar: Criterio c) y d) del RA6
    public List<Asignatura> listar() {
        List<Asignatura> lista = new ArrayList<>();
        String sql = "SELECT * FROM asignaturas";
        try (Connection con = Database.getConnection(); 
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                lista.add(new Asignatura(rs.getInt("id"), rs.getString("nombre"), rs.getString("codigo")));
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return lista;
    }

    // Insertar: Criterio b) del RA6
    public boolean insertar(Asignatura a) {
        String sql = "INSERT INTO asignaturas (nombre, codigo) VALUES (?, ?)";
        try (Connection con = Database.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, a.getNombre());
            ps.setString(2, a.getCodigo());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) { return false; }
    }
    public boolean editar(Asignatura asig) {
    // Usamos PreparedStatement para evitar inyección SQL y errores de sintaxis
    String sql = "UPDATE asignaturas SET nombre = ?, codigo = ? WHERE id = ?";
    try (Connection con = Database.getConnection(); 
         PreparedStatement ps = con.prepareStatement(sql)) {
        
        ps.setString(1, asig.getNombre());
        ps.setString(2, asig.getCodigo());
        ps.setInt(3, asig.getId());
        
        return ps.executeUpdate() > 0; // Retorna true si se actualizó el registro
    } catch (SQLException e) {
        System.out.println("Error al editar asignatura: " + e.getMessage());
        return false;
    }
}
}
