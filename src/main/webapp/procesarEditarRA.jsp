<%-- 
    Document   : procesarEditarRA
    Created on : 30 ene 2026, 12:30:30
    Author     : DAW2
--%>

<%@ page import="dao.ResultadoAprendizajeDAO, model.ResultadoAprendizaje" %>
<%
    // 1. Recoger datos del formulario de edición de RA
    int id = Integer.parseInt(request.getParameter("id"));
    String descripcion = request.getParameter("descripcion");
    int idAsignatura = Integer.parseInt(request.getParameter("id_asignatura"));

    // 2. Instanciar objeto y DAO
    ResultadoAprendizaje ra = new ResultadoAprendizaje(id, descripcion, idAsignatura);
    ResultadoAprendizajeDAO dao = new ResultadoAprendizajeDAO();

    // 3. Ejecutar actualización y redirigir
    if (dao.editar(ra)) {
        response.sendRedirect("resultados.jsp?success=1");
    } else {
        response.sendRedirect("resultados.jsp?error=1");
    }
%>
