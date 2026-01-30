<%-- 
    Document   : procesarEditarCriterio
    Created on : 30 ene 2026, 12:31:38
    Author     : DAW2
--%>

<%@ page import="dao.CriterioEvaluacionDAO, model.CriterioEvaluacion" %>
<%
    // 1. Recoger datos del formulario de edición de Criterios
    int id = Integer.parseInt(request.getParameter("id"));
    String detalle = request.getParameter("detalle");
    int idRa = Integer.parseInt(request.getParameter("id_ra"));

    // 2. Instanciar objeto y DAO
    CriterioEvaluacion ce = new CriterioEvaluacion(id, detalle, idRa);
    CriterioEvaluacionDAO dao = new CriterioEvaluacionDAO();

    // 3. Ejecutar actualización y redirigir
    if (dao.editar(ce)) {
        response.sendRedirect("criterios.jsp?success=1");
    } else {
        response.sendRedirect("criterios.jsp?error=1");
    }
%>
