/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

public class CriterioEvaluacion {
    private int id;
    private String detalle;
    private int idRa; // Relación con RA [cite: 51]

    public CriterioEvaluacion(int id, String detalle, int idRa) {
        this.id = id;
        this.detalle = detalle;
        this.idRa = idRa;
    }
    // Getters y Setters
    public int getId() { return id; }
    public String getDetalle() { return detalle; }
    public int getIdRa() { return idRa; }
}
