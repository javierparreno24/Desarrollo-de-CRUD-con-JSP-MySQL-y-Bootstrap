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
    <title>Gestión de Resultados de Aprendizaje (RA)</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-4 shadow">
        <div class="container">
            <a class="navbar-brand" href="asignaturas.jsp">Sistema Académico</a>
            <div class="navbar-nav">
                <a class="nav-link" href="asignaturas.jsp">Asignaturas</a>
                <a class="nav-link active" href="resultados.jsp">Resultados (RA)</a>
                <a class="nav-link" href="criterios.jsp">Criterios (CE)</a>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="card shadow">
            <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
                <h2 class="mb-0">Resultados de Aprendizaje</h2>
                <a href="formRA.jsp" class="btn btn-light btn-sm fw-bold">+ Añadir Nuevo RA</a>
            </div>
            <div class="card-body">
                
                <% if(request.getParameter("msg") != null) { %>
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        Operación realizada con éxito.
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                <% } %>

                <table class="table table-hover table-bordered mt-3">
                    <thead class="table-dark text-center">
                        <tr>
                            <th>ID</th>
                            <th>Descripción</th>
                            <th>ID Asignatura</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            try {
                                ResultadoAprendizajeDAO dao = new ResultadoAprendizajeDAO();
                                List<ResultadoAprendizaje> lista = dao.listar(); //
                                
                                for(ResultadoAprendizaje ra : lista) {
                        %>
                        <tr>
                            <td class="text-center fw-bold"><%= ra.getId() %></td>
                            <td><%= ra.getDescripcion() %></td>
                            <td class="text-center">
                                <span class="badge bg-primary">Asig: <%= ra.getIdAsignatura() %></span>
                            </td>
                            <td class="text-center">
                                <a href="editarRA.jsp?id=<%= ra.getId() %>&descripcion=<%= ra.getDescripcion() %>&id_asignatura=<%= ra.getIdAsignatura() %>" 
                                   class="btn btn-warning btn-sm shadow-sm">Editar</a>
                                
                                <a href="procesarEliminarRA.jsp?id=<%= ra.getId() %>" 
                                   class="btn btn-danger btn-sm shadow-sm" 
                                   onclick="return confirm('¿Seguro que desea eliminar este RA?')">
                                    Eliminar
                                </a>
                            </td>
                        </tr>
                        <% 
                                } 
                            } catch (Exception e) { 
                        %>
                            <tr>
                                <td colspan="4" class="text-center text-danger">
                                    Error al conectar con la base de datos
                                </td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
        
        <div class="mt-4">
            <a href="asignaturas.jsp" class="btn btn-secondary">← Volver a Asignaturas</a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>