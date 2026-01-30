package com.mycompany.desarrollocrud_jsp_mysql_bootstrap;

import dao.AsignaturaDAO;
import model.Asignatura;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// Esta anotación vincula el formulario con este código
@WebServlet("/EditarAsignaturaServlet")
public class EditarAsignaturaServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // 1. Obtener los datos del formulario de editarAsignatura.jsp
        int id = Integer.parseInt(request.getParameter("id"));
        String nombre = request.getParameter("nombre");
        String codigo = request.getParameter("codigo");

        // 2. Crear el objeto con los nuevos datos
        Asignatura asig = new Asignatura(id, nombre, codigo);
        AsignaturaDAO dao = new AsignaturaDAO();

        // 3. Ejecutar la actualización y redireccionar
        if (dao.editar(asig)) {
            // Si tiene éxito, volvemos a la lista
            response.sendRedirect("asignaturas.jsp?success=1");
        } else {
            // Si falla, podrías volver con un mensaje de error
            response.sendRedirect("asignaturas.jsp?error=1");
        }
    }
}
