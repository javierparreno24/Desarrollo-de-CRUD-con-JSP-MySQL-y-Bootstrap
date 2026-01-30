<%-- 
    Document   : formCriterio
    Created on : 30 ene 2026, 12:46:43
    Author     : DAW2
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.ResultadoAprendizajeDAO, model.ResultadoAprendizaje, java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Nuevo Criterio - Gestión Académica</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-4 shadow">
        <div class="container">
            <a class="navbar-brand" href="asignaturas.jsp">Sistema Académico</a>
        </div>
    </nav>

    <div class="container mt-5">
        <div class="card shadow col-md-8 mx-auto">
            <div class="card-header bg-success text-white">
                <h3 class="mb-0">Añadir Criterio de Evaluación</h3>
            </div>
            <div class="card-body">
                <form action="procesarAñadirCriterio.jsp" method="POST">
                    
                    <div class="mb-3">
                        <label class="form-label font-weight-bold">Detalle del Criterio:</label>
                        <textarea name="detalle" class="form-control" rows="3" 
                                  placeholder="Ej: Define la estructura de la base de datos..." required></textarea>
                    </div>

                    <div class="mb-3">
                        <label class="form-label font-weight-bold">Resultado de Aprendizaje (RA) asociado:</label>
                        <select name="id_ra" class="form-select" required>
                            <option value="">-- Seleccione un RA --</option>
                            <%
                                try {
                                    ResultadoAprendizajeDAO raDao = new ResultadoAprendizajeDAO();
                                    List<ResultadoAprendizaje> lista = raDao.listar(); //
                                    
                                    if(lista != null) {
                                        for(ResultadoAprendizaje ra : lista) {
                            %>
                                <option value="<%= ra.getId() %>"><%= ra.getDescripcion() %></option>
                            <% 
                                        }
                                    }
                                } catch (Exception e) { 
                            %>
                                <option disabled>Error al conectar con la base de datos: <%= e.getMessage() %></option>
                            <% } %>
                        </select>
                        <div class="form-text">El criterio debe estar vinculado a un RA existente.</div>
                    </div>

                    <div class="d-flex justify-content-between mt-4">
                        <button type="submit" class="btn btn-primary shadow-sm">Guardar Criterio</button>
                        <a href="criterios.jsp" class="btn btn-secondary shadow-sm">Cancelar</a>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
