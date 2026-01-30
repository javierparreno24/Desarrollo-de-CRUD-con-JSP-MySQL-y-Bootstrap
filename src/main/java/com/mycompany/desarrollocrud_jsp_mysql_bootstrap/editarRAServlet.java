package com.mycompany.desarrollocrud_jsp_mysql_bootstrap;

import dao.ResultadoAprendizajeDAO;
import model.ResultadoAprendizaje;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EditarRAServlet")
public class editarRAServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String descripcion = request.getParameter("descripcion");
            int idAsignatura = Integer.parseInt(request.getParameter("id_asignatura"));

            ResultadoAprendizaje ra = new ResultadoAprendizaje(id, descripcion, idAsignatura);
            ResultadoAprendizajeDAO dao = new ResultadoAprendizajeDAO();

            if (dao.editar(ra)) {
                response.sendRedirect("resultados.jsp?success=1");
            } else {
                response.sendRedirect("resultados.jsp?error=1");
            }
        } catch (Exception e) {
            response.sendRedirect("resultados.jsp?error=datos_invalidos");
        }
    }
}
