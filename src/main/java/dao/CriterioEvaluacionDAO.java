/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import config.Database;
import model.CriterioEvaluacion;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CriterioEvaluacionDAO {

    // Método para recuperar información (Criterio c del RA6)
    public List<CriterioEvaluacion> listarTodos() {
        List<CriterioEvaluacion> lista = new ArrayList<>();
        String sql = "SELECT * FROM criterios_evaluacion";
        
        try (Connection con = Database.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                CriterioEvaluacion ce = new CriterioEvaluacion(
                    rs.getInt("id"),
                    rs.getString("detalle"),
                    rs.getInt("id_ra")
                );
                lista.add(ce);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }

    // Método para insertar (Parte del CRUD completo)
    public boolean insertar(CriterioEvaluacion criterio) {
        String sql = "INSERT INTO criterios_evaluacion (detalle, id_ra) VALUES (?, ?)";
        
        try (Connection con = Database.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setString(1, criterio.getDetalle());
            ps.setInt(2, criterio.getIdRa()); // Asociación con el RA específico
            
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    
}
