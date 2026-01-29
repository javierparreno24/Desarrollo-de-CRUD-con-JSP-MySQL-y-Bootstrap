/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

public class ResultadoAprendizaje {
    private int id;
    private String descripcion;
    private int idAsignatura; 

    public ResultadoAprendizaje(int id, String descripcion, int idAsignatura) {
        this.id = id;
        this.descripcion = descripcion;
        this.idAsignatura = idAsignatura;
    }
    // Getters y Setters (Alt+Insert en NetBeans)
    public int getId() { return id; }
    public String getDescripcion() { return descripcion; }
    public int getIdAsignatura() { return idAsignatura; }
}
