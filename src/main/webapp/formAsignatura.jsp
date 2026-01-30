<%-- 
    Document   : formAsignatura
    Created on : 30 ene 2026, 12:45:13
    Author     : DAW2
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Nueva Asignatura</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="card shadow col-md-6 mx-auto">
            <div class="card-header bg-success text-white"><h3>Nueva Asignatura</h3></div>
            <div class="card-body">
                <form action="procesarAñadirAsignatura.jsp" method="POST">
                    <div class="mb-3">
                        <label class="form-label">Nombre</label>
                        <input type="text" name="nombre" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Código</label>
                        <input type="text" name="codigo" class="form-control" required>
                    </div>
                    <button type="submit" class="btn btn-primary w-100">Guardar Asignatura</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
