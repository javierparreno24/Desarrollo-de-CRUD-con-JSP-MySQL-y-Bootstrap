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
    <title>Criterios de Evaluación - Gestión Académica</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-5 bg-light">
    
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-4 shadow rounded">
        <div class="container-fluid">
            <a class="navbar-brand" href="asignaturas.jsp">Gestión Académica</a>
            <div class="navbar-nav">
                <a class="nav-link" href="asignaturas.jsp">Asignaturas</a>
                <a class="nav-link" href="resultados.jsp">Resultados (RA)</a>
                <a class="nav-link active" href="criterios.jsp">Criterios (CE)</a>
            </div>
        </div>
    </nav>

    <div class="card shadow">
        <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
            <h2 class="mb-0">Criterios de Evaluación</h2>
            <a href="formCriterio.jsp" class="btn btn-light btn-sm">Nuevo Criterio</a>
        </div>
        <div class="card-body">
            
            <% if(request.getParameter("msg") != null) { %>
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    ¡Operación realizada con éxito!
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            <% } %>

            <table class="table table-bordered table-striped table-hover mt-3">
                <thead class="table-dark text-center">
                    <tr>
                        <th>ID</th>
                        <th>Detalle del Criterio</th>
                        <th>ID RA</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        try {
                            CriterioEvaluacionDAO dao = new CriterioEvaluacionDAO();
                            // Usamos el método listarTodos que ya tienes definido
                            List<CriterioEvaluacion> lista = dao.listarTodos();
                            
                            if(lista != null) {
                                for(CriterioEvaluacion ce : lista) {
                    %>
                    <tr>
                        <td class="text-center"><%= ce.getId() %></td>
                        <td><%= ce.getDetalle() %></td>
                        <td class="text-center">
                            <span class="badge bg-info text-dark">RA: <%= ce.getIdRa() %></span>
                        </td>
                        <td class="text-center">
                            <a href="editarCriterio.jsp?id=<%= ce.getId() %>&detalle=<%= ce.getDetalle() %>&id_ra=<%= ce.getIdRa() %>" 
                               class="btn btn-warning btn-sm">Editar</a>
                            
                            <a href="procesarEliminarCriterio.jsp?id=<%= ce.getId() %>" 
                               class="btn btn-danger btn-sm" 
                               onclick="return confirm('¿Seguro que desea eliminar el criterio <%= ce.getId() %>?')">
                               Eliminar
                            </a>
                        </td>
                    </tr>
                    <% 
                                } 
                            }
                        } catch (Exception e) { 
                    %>
                        <tr>
                            <td colspan="4" class="text-center text-danger">
                                Error al conectar con la base de datos: <%= e.getMessage() %>
                            </td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>

    <div class="mt-4 text-center">
        <a href="index.html" class="btn btn-secondary">Volver al Inicio</a>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="js/main.js"></script>
</body>
</html>