<%-- 
    Document   : editarAsignatura
    Created on : 30 ene 2026, 11:26:37
    Author     : DAW2
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Editar Asignatura - CRUD</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="card shadow col-md-6 mx-auto">
            <div class="card-header bg-warning text-dark">
                <h3 class="mb-0">Modificar Asignatura</h3>
            </div>
            <div class="card-body">
                <form action="procesarEditar.jsp" method="POST">
                    <input type="hidden" name="id" value="<%= request.getParameter("id") %>">
                    
                    <div class="mb-3">
                        <label class="form-label">Nombre de la Asignatura</label>
                        <input type="text" name="nombre" value="<%= request.getParameter("nombre") %>" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Código</label>
                        <input type="text" name="codigo" value="<%= request.getParameter("codigo") %>" class="form-control" required>
                    </div>
                    
                    <div class="d-flex justify-content-between">
                        <button type="submit" class="btn btn-success">Guardar Cambios</button>
                        <a href="asignaturas.jsp" class="btn btn-secondary">Cancelar</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
