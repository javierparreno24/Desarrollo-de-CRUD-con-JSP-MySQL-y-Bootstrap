<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.AsignaturaDAO, model.Asignatura, java.util.List" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Nuevo RA - Gestión Académica</title>
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
                <h3 class="mb-0">Añadir Nuevo Resultado de Aprendizaje</h3>
            </div>
            <div class="card-body p-4">
                <form action="procesarAñadirRA.jsp" method="POST">
                    
                    <div class="mb-3">
                        <label class="form-label fw-bold">Descripción del RA:</label>
                        <textarea name="descripcion" class="form-control" rows="4" 
                                  placeholder="Ej: Desarrolla aplicaciones web gestionando bases de datos..." required></textarea>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-bold">Asignatura correspondiente:</label>
                        <select name="id_asignatura" class="form-select" required>
                            <option value="">-- Seleccione una Asignatura --</option>
                            <%
                                try {
                                    AsignaturaDAO asigDao = new AsignaturaDAO();
                                    List<Asignatura> lista = asigDao.listar(); //
                                    
                                    if(lista != null) {
                                        for(Asignatura a : lista) {
                            %>
                                <option value="<%= a.getId() %>"><%= a.getNombre() %> (<%= a.getCodigo() %>)</option>
                            <% 
                                        }
                                    }
                                } catch (Exception e) { 
                            %>
                                <option disabled>Error al cargar las asignaturas: <%= e.getMessage() %></option>
                            <% } %>
                        </select>
                        <div class="form-text">Cada RA debe estar vinculado a una asignatura para cumplir con el RA6.</div>
                    </div>

                    <div class="d-flex justify-content-between mt-4">
                        <button type="submit" class="btn btn-primary px-4 shadow-sm">Guardar Registro</button>
                        <a href="resultados.jsp" class="btn btn-secondary px-4 shadow-sm">Cancelar</a>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>