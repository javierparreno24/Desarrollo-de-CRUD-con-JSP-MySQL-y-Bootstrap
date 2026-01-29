<%-- 
    Document   : asignaturas
    Created on : 29 ene 2026, 9:41:50
    Author     : DAW2
--%>

<%@ page import="dao.AsignaturaDAO, model.Asignatura, java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>CRUD Asignaturas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="card shadow">
            <div class="card-header bg-primary text-white">
                <h2>Gestión de Asignaturas </h2>
            </div>
            <div class="card-body">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>ID</th><th>Nombre</th><th>Código</th><th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            AsignaturaDAO dao = new AsignaturaDAO();
                            List<Asignatura> lista = dao.listar();
                            for(Asignatura a : lista) {
                        %>
                        <tr>
                            <td><%= a.getId() %></td>
                            <td><%= a.getNombre() %></td>
                            <td><%= a.getCodigo() %></td>
                            <td>
                                <a href="editarAsignatura.jsp?id=<%= a.getId() %>" class="btn btn-warning btn-sm">Editar</a>
                                <a href="eliminarAsignatura?id=<%= a.getId() %>" class="btn btn-danger btn-sm">Eliminar</a>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
                <a href="formAsignatura.jsp" class="btn btn-success">Nueva Asignatura</a>
            </div>
        </div>
    </div>
                    <script src="js/main.js"></script>
</body>
</html>
