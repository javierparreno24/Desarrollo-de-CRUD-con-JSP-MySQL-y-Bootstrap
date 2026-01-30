/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;
import config.Database;
import model.ResultadoAprendizaje;
import java.sql.*;
import java.util.*;

public class ResultadoAprendizajeDAO {
    public List<ResultadoAprendizaje> listar() {
        List<ResultadoAprendizaje> lista = new ArrayList<>();
        try (Connection con = Database.getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT * FROM resultados_aprendizaje");
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                lista.add(new ResultadoAprendizaje(rs.getInt("id"), rs.getString("descripcion"), rs.getInt("id_asignatura")));
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return lista;
    }

    public void insertar(ResultadoAprendizaje ra) {
        String sql = "INSERT INTO resultados_aprendizaje (descripcion, id_asignatura) VALUES (?, ?)";
        try (Connection con = Database.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, ra.getDescripcion());
            ps.setInt(2, ra.getIdAsignatura());
            ps.executeUpdate();
        } catch (SQLException e) { e.printStackTrace(); }
    }
    public boolean editar(ResultadoAprendizaje ra) {
    String sql = "UPDATE resultados_aprendizaje SET descripcion = ?, id_asignatura = ? WHERE id = ?";
    try (Connection con = Database.getConnection();
         PreparedStatement ps = con.prepareStatement(sql)) {
        ps.setString(1, ra.getDescripcion());
        ps.setInt(2, ra.getIdAsignatura());
        ps.setInt(3, ra.getId());
        return ps.executeUpdate() > 0;
    } catch (SQLException e) {
        e.printStackTrace();
        return false;
    }
}
}