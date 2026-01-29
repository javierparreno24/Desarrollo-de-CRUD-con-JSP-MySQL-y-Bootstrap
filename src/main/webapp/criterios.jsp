<%-- 
    Document   : criterios
    Created on : 29 ene 2026, 9:52:21
    Author     : DAW2
--%>

<%@ page import="dao.CriterioEvaluacionDAO, model.CriterioEvaluacion, java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Criterios de Evaluación</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-5">
    <h2 class="mb-4">Listado de Criterios de Evaluación</h2>
    <table class="table table-bordered table-striped">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Detalle del Criterio</th>
                <th>ID del RA Asociado</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <%
                CriterioEvaluacionDAO dao = new CriterioEvaluacionDAO();
                List<CriterioEvaluacion> lista = dao.listarTodos();
                for(CriterioEvaluacion ce : lista) {
            %>
            <tr>
                <td><%= ce.getId() %></td>
                <td><%= ce.getDetalle() %></td>
                <td><%= ce.getIdRa() %></td>
                <td>
                    <a href="#" class="btn btn-warning btn-sm">Editar</a>
                    <a href="#" class="btn btn-danger btn-sm">Eliminar</a>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
    <a href="asignaturas.jsp" class="btn btn-secondary">Volver a Asignaturas</a>
    <script src="js/main.js"></script>
</body>
</html>
