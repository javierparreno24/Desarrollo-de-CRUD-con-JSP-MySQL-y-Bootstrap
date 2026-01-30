<%-- 
    Document   : procesarEditar
    Created on : 30 ene 2026, 12:29:17
    Author     : DAW2
--%>

<%@ page import="dao.AsignaturaDAO, model.Asignatura" %>
<%
    // 1. Recoger datos del formulario
    int id = Integer.parseInt(request.getParameter("id"));
    String nombre = request.getParameter("nombre");
    String codigo = request.getParameter("codigo");

    // 2. Crear objeto y llamar al DAO
    Asignatura asig = new Asignatura(id, nombre, codigo);
    AsignaturaDAO dao = new AsignaturaDAO();

    // 3. Lógica de redirección (Sustituye al Servlet)
    if (dao.editar(asig)) {
        response.sendRedirect("asignaturas.jsp?success=1");
    } else {
        response.sendRedirect("asignaturas.jsp?error=1");
    }
%>
