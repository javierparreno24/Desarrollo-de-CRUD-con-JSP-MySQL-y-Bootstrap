package com.mycompany.desarrollocrud_jsp_mysql_bootstrap;

import dao.CriterioEvaluacionDAO;
import model.CriterioEvaluacion;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EditarCriterioServlet")
public class editarCriterioServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String detalle = request.getParameter("detalle");
            int idRa = Integer.parseInt(request.getParameter("id_ra"));

            CriterioEvaluacion ce = new CriterioEvaluacion(id, detalle, idRa);
            CriterioEvaluacionDAO dao = new CriterioEvaluacionDAO();

            if (dao.editar(ce)) {
                response.sendRedirect("criterios.jsp?success=1");
            } else {
                response.sendRedirect("criterios.jsp?error=1");
            }
        } catch (Exception e) {
            response.sendRedirect("criterios.jsp?error=datos_invalidos");
        }
    }
}
