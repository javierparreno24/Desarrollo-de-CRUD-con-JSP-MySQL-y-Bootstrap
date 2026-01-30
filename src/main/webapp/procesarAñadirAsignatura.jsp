<%-- 
    Document   : procesarAñadirAsignatura
    Created on : 30 ene 2026, 12:45:41
    Author     : DAW2
--%>

<%@ page import="dao.AsignaturaDAO, model.Asignatura" %>
<%
    String nom = request.getParameter("nombre");
    String cod = request.getParameter("codigo");
    
    AsignaturaDAO dao = new AsignaturaDAO();

    if (dao.insertar(new Asignatura(0, nom, cod))) {
        response.sendRedirect("asignaturas.jsp?msg=ok");
    } else {
        response.sendRedirect("asignaturas.jsp?error=1");
    }
%>
