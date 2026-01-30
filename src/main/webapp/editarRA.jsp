<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.AsignaturaDAO, model.Asignatura, java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>Editar Resultado de Aprendizaje</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="card shadow col-md-6 mx-auto">
            <div class="card-header bg-warning text-dark">
                <h3 class="mb-0">Editar Resultado de Aprendizaje</h3>
            </div>
            <div class="card-body">
                <form action="procesarEditarRA.jsp" method="POST">
                    
                    <input type="hidden" name="id" value="<%= request.getParameter("id") %>">
                    
                    <div class="mb-3">
                        <label class="form-label font-weight-bold">Descripción:</label>
                        <textarea name="descripcion" class="form-control" rows="3" required><%= request.getParameter("descripcion") %></textarea>
                    </div>

                    <div class="mb-3">
                        <label class="form-label font-weight-bold">Asignatura Asociada:</label>
                        <select name="id_asignatura" class="form-select" required>
                            <%
                                try {
                                    AsignaturaDAO asigDao = new AsignaturaDAO();
                                    List<Asignatura> lista = asigDao.listar();
                                    int idAsigActual = Integer.parseInt(request.getParameter("id_asignatura"));
                                    
                                    for(Asignatura a : lista) {
                                        String selected = (a.getId() == idAsigActual) ? "selected" : "";
                            %>
                                <option value="<%= a.getId() %>" <%= selected %>><%= a.getNombre() %></option>
                            <% 
                                    }
                                } catch (Exception e) { 
                            %>
                                <option disabled>Error al cargar asignaturas</option>
                            <% } %>
                        </select>
                    </div>

                    <div class="d-flex justify-content-between mt-4">
                        <button type="submit" class="btn btn-success">Actualizar Datos</button>
                        <a href="resultados.jsp" class="btn btn-secondary">Cancelar</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
