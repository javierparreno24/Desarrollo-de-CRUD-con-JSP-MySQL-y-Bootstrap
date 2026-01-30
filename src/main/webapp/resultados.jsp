<%-- 
    Document   : resultados
    Created on : 29 ene 2026, 9:51:44
    Author     : DAW2
--%>

<%@ page import="dao.ResultadoAprendizajeDAO, model.ResultadoAprendizaje, java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Gestión de RA</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-5">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-4">
        <div class="container-fluid">
            <a class="navbar-brand" href="asignaturas.jsp">Gestión Académica</a>
            <div class="navbar-nav">
                <a class="nav-link" href="asignaturas.jsp">Asignaturas</a>
                <a class="nav-link active" href="resultados.jsp">Resultados (RA)</a>
            </div>
        </div>
    </nav>

    <h2>Resultados de Aprendizaje</h2>
    <table class="table table-hover">
        <thead class="table-info">
            <tr><th>ID</th><th>Descripción</th><th>ID Asignatura</th><th>Acciones</th></tr>
        </thead>
        <tbody>
    <%
        ResultadoAprendizajeDAO dao = new ResultadoAprendizajeDAO();
        for(ResultadoAprendizaje ra : dao.listar()) {
    %>
    <tr>
        <td><%= ra.getId() %></td>
        <td><%= ra.getDescripcion() %></td>
        <td><%= ra.getIdAsignatura() %></td>
        <td>
            <a href="editarRA.jsp?id=<%= ra.getId() %>&descripcion=<%= ra.getDescripcion() %>&id_asignatura=<%= ra.getIdAsignatura() %>" 
               class="btn btn-warning btn-sm">Editar</a>
            
            <a href="procesarEliminarRA.jsp?id=<%= ra.getId() %>" 
               class="btn btn-danger btn-sm" 
               onclick="return confirm('¿Estás seguro de eliminar este RA?')">Eliminar</a>
        </td>
    </tr>
    <% } %>
</tbody>
    </table>
        <script src="js/main.js"></script>
</body>
</html>