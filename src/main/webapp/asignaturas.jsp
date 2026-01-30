<%-- 
    Document   : asignaturas
    Created on : 29 ene 2026
    Author     : DAW2
--%>

<%@ page import="dao.AsignaturaDAO, model.Asignatura, java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gestión de Asignaturas - Sistema Académico</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-4 shadow">
        <div class="container">
            <a class="navbar-brand" href="asignaturas.jsp">Sistema Académico</a>
            <div class="navbar-nav">
                <a class="nav-link active" href="asignaturas.jsp">Asignaturas</a>
                <a class="nav-link" href="resultados.jsp">Resultados (RA)</a>
                <a class="nav-link" href="criterios.jsp">Criterios (CE)</a>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="card shadow">
            <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
                <h2 class="mb-0">Listado de Asignaturas</h2>
                <a href="formAsignatura.jsp" class="btn btn-light btn-sm fw-bold">+ Añadir Asignatura</a>
            </div>
            <div class="card-body">
                
                <%-- Mensajes de feedback --%>
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
                            <th>Nombre de la Asignatura</th>
                            <th>Código</th>
                            <th>Contenido</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            try {
                                AsignaturaDAO dao = new AsignaturaDAO();
                                List<Asignatura> lista = dao.listar(); //
                                
                                for(Asignatura asig : lista) {
                        %>
                        <tr>
                            <td class="text-center fw-bold"><%= asig.getId() %></td>
                            <td><%= asig.getNombre() %></td>
                            <td class="text-center">
                                <span class="badge bg-secondary"><%= asig.getCodigo() %></span>
                            </td>
                            <td class="text-center">
                                <a href="resultados.jsp?id_asig=<%= asig.getId() %>" class="btn btn-outline-primary btn-sm fw-bold">
                                    Ver Resultados (RA)
                                </a>
                            </td>
                            <td class="text-center">
                                <a href="editarAsignatura.jsp?id=<%= asig.getId() %>&nombre=<%= asig.getNombre() %>&codigo=<%= asig.getCodigo() %>" 
                                   class="btn btn-warning btn-sm shadow-sm">Editar</a>
                                
                                <a href="procesarEliminarAsignatura.jsp?id=<%= asig.getId() %>" 
                                   class="btn btn-danger btn-sm shadow-sm"
                                   onclick="return confirm('¿Seguro que desea eliminar esta asignatura?')">
                                    Eliminar
                                </a>
                            </td>
                        </tr>
                        <% 
                                } 
                            } catch (Exception e) { 
                        %>
                            <tr>
                                <td colspan="5" class="text-center text-danger">
                                    Error al cargar las asignaturas. Verifique la conexión a MySQL.
                                </td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
