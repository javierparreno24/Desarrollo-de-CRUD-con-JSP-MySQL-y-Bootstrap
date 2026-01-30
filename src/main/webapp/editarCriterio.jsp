<%-- 
    Document   : editarCreiterio
    Created on : 30 ene 2026, 11:30:56
    Author     : DAW2
--%>

<form action="editarCriterioServlet" method="POST">
    <input type="hidden" name="id" value="<%= request.getParameter("id") %>">
    <div class="mb-3">
        <label>Detalle del Criterio</label>
        <input type="text" name="detalle" value="<%= request.getParameter("detalle") %>" class="form-control" required>
    </div>
    <button type="submit" class="btn btn-primary">Guardar Criterio</button>
</form>