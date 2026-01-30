<%-- 
    Document   : formCriterio
    Created on : 30 ene 2026, 12:46:43
    Author     : DAW2
--%>

<%@ page import="dao.ResultadoAprendizajeDAO, model.ResultadoAprendizaje, java.util.List" %>
<form action="procesarAñadirCriterio.jsp" method="POST">
    <div class="mb-3">
        <label class="form-label">Detalle del Criterio</label>
        <input type="text" name="detalle" class="form-control" required>
    </div>
    <div class="mb-3">
        <label class="form-label">Resultado de Aprendizaje (RA) asociado</label>
        <select name="id_ra" class="form-select">
            <%
                ResultadoAprendizajeDAO raDao = new ResultadoAprendizajeDAO();
                for(ResultadoAprendizaje ra : raDao.listar()) {
            %>
                <option value="<%= ra.getId() %>"><%= ra.getDescripcion() %></option>
            <% } %>
        </select>
    </div>
    <button type="submit" class="btn btn-primary w-100">Guardar Criterio</button>
</form>
