<%-- 
    Document   : editarCriterio
    Created on : 30 ene 2026, 12:36:38
    Author     : DAW2
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.ResultadoAprendizajeDAO, model.ResultadoAprendizaje, java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>Editar Criterio de Evaluación</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="card shadow col-md-6 mx-auto">
            <div class="card-header bg-warning text-dark">
                <h3 class="mb-0">Modificar Criterio</h3>
            </div>
            <div class="card-body">
                <form action="procesarEditarCriterio.jsp" method="POST">
                    <input type="hidden" name="id" value="<%= request.getParameter("id") %>">
                    
                    <div class="mb-3">
                        <label class="form-label">Detalle del Criterio</label>
                        <textarea name="detalle" class="form-control" required><%= request.getParameter("detalle") %></textarea>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Resultado de Aprendizaje Asociado</label>
                        <select name="id_ra" class="form-select" required>
                            <%
                                ResultadoAprendizajeDAO raDao = new ResultadoAprendizajeDAO();
                                List<ResultadoAprendizaje> listaRA = raDao.listar();
                                for(ResultadoAprendizaje ra : listaRA) {
                            %>
                                <option value="<%= ra.getId() %>"><%= ra.getDescripcion() %></option>
                            <% } %>
                        </select>
                    </div>
                    
                    <div class="d-flex justify-content-between">
                        <button type="submit" class="btn btn-success">Guardar Cambios</button>
                        <a href="criterios.jsp" class="btn btn-secondary">Cancelar</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
