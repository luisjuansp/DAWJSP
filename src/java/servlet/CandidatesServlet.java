/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import beans.Candidate;
import beans.Empleado;
import database.MySQL;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Luis Juan Sanchez P
 */
public class CandidatesServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet GetCandidatesServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GetCandidatesServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        String firstName = request.getParameter("firstName");
//        String lastName = request.getParameter("lastName");
//        String emailAddress = request.getParameter("emailAddress");
//        String carrera = request.getParameter("carrera");

        // get a relative file name
//        ServletContext context = getServletContext();
//        String path = context.getRealPath("/WEB-INF/EmailList.txt");
        // use regular Java classes
//        User user = new User(firstName, lastName, emailAddress,carrera);
//        UserIO.addRecord(user, path);
        String button = (String) request.getParameter("button");
        MySQL mysql = new MySQL();
        String url = "";
        RequestDispatcher dispatcher;
        switch (button) {
            case "getbasic":
                // store the User object in the request object
                request.setAttribute("table", mysql.getCandidates());
                request.setAttribute("test", "tested");

                // forward request and response objects to JSP page
                url = "/mysqltest.jsp";
                LinkedList<Candidate> candidates = mysql.getCandidates();
                request.getSession().setAttribute("candidatos", candidates);
                dispatcher
                        = getServletContext().getRequestDispatcher(url);
                dispatcher.forward(request, response);
                break;

            case "getall":
                // store the User object in the request object
                int idCand = Integer.parseInt(request.getParameter("specId"));
                Candidate candidato = mysql.getCandidate(idCand);
                candidato.setHabilidades(mysql.getHabilidades(idCand));
                candidato.setTitulos(mysql.getTitulos(idCand));
                candidato.setTrabajos(mysql.getAnteriores(idCand));
                candidato.setCompanias(mysql.getCompanias(idCand));

                // forward request and response objects to JSP page
                url = "/detallescandidatos.jsp";
                request.getSession().setAttribute("candidato", candidato);
                dispatcher
                        = getServletContext().getRequestDispatcher(url);
                dispatcher.forward(request, response);
                break;

            default:
                response.setContentType("text/html;charset=UTF-8");
                try (PrintWriter out = response.getWriter()) {
                    /* TODO output your page here. You may use following sample code. */
                    out.println("<!DOCTYPE html>");
                    out.println("<html>");
                    out.println("<head>");
                    out.println("<title>Servlet GetCandidatesServlet</title>");
                    out.println("</head>");
                    out.println("<body>");
                    out.println("<h1>Servlet GetCandidatesServlet at " + request.getContextPath() + "</h1>");
                    out.println("</body>");
                    out.println("</html>");
                }
                break;
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
