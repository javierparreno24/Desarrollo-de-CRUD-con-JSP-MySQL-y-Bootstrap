<%-- 
    Document   : editarRA
    Created on : 30 ene 2026, 11:30:18
    Author     : DAW2
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.AsignaturaDAO, model.Asignatura, java.util.List" %>
<div class="container mt-5">
    <div class="card shadow col-md-6 mx-auto">
        <div class="card-header bg-warning"><h3>Editar Resultado de Aprendizaje</h3></div>
        <div class="card-body">
            <form action="EditarRAServlet" method="POST">
                <input type="hidden" name="id" value="<%= request.getParameter("id") %>">
                <div class="mb-3">
                    <label class="form-label">Descripción</label>
                    <textarea name="descripcion" class="form-control" required><%= request.getParameter("descripcion") %></textarea>
                </div>
                <div class="mb-3">
                    <label class="form-label">Asignatura Asociada</label>
                    <select name="id_asignatura" class="form-select">
                        <%
                            AsignaturaDAO asigDao = new AsignaturaDAO();
                            List<Asignatura> lista = asigDao.listar();
                            for(Asignatura a : lista) {
                        %>
                            <option value="<%= a.getId() %>"><%= a.getNombre() %></option>
                        <% } %>
                    </select>
                </div>
                <button type="submit" class="btn btn-success">Actualizar</button>
            </form>
        </div>
    </div>
</div>
