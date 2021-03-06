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
import java.sql.Date;
import java.util.Enumeration;
import java.util.LinkedList;
import java.util.Map;
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

    private Object session;

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
        PrintWriter out = response.getWriter();
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

            case "contratar":
                // forward request and response objects to JSP page
                url = "/contratacion.jsp";

                dispatcher
                        = getServletContext().getRequestDispatcher(url);
                dispatcher.forward(request, response);
                break;
            case "finalizarcontrato":
                // forward request and response objects to JSP page
                url = "/index.jsp";
                String pues = request.getParameter("puesto");
                out.print(pues);
                String depa = request.getParameter("departamento");
                out.print(depa);
                int sal = Integer.parseInt(request.getParameter("salario"));
                out.print(pues);
                int vaca = Integer.parseInt(request.getParameter("vacaciones"));
                int idC = Integer.parseInt(request.getParameter("specId"));
                out.print(mysql.insertEmpleado(idC, pues, depa, sal, vaca));
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
                candidato.setCertificados(mysql.getCertificados(idCand));

                // forward request and response objects to JSP page
                url = "/detallescandidatos.jsp";
                request.getSession().setAttribute("candidato", candidato);
                dispatcher
                        = getServletContext().getRequestDispatcher(url);
                dispatcher.forward(request, response);
                break;
            case "editCand":
                // store the User object in the request object
                // forward request and response objects to JSP page

                Map<String, String[]> dataMap = request.getParameterMap();
                Enumeration<String> names = request.getParameterNames();

                while (names.hasMoreElements()) {
                    String name = names.nextElement();
                    String[] values = dataMap.get(name);
                    for (int i = 0; i < values.length; i++) {
                        out.println(name + ": " + values[i]);
                    }
                }
                String nomina = dataMap.get("nomina")[0];
                String tel = dataMap.get("tel")[0];
                String email = dataMap.get("email")[0];
                String paga = dataMap.get("paga")[0];
                String calle = dataMap.get("calle")[0];
                String numero = dataMap.get("numero")[0];
                String ciudad = dataMap.get("ciudad")[0];
                String estado = dataMap.get("estado")[0];
                String codigo = dataMap.get("codigo")[0];
                out.println(mysql.updateCandidato(Integer.parseInt(nomina), tel, email, Integer.parseInt(paga), calle,
                        Integer.parseInt(numero), ciudad, estado, Integer.parseInt(codigo)));
                out.print(mysql.getStatus());

                int candId = mysql.getEmpleadoCandId(Integer.parseInt(nomina));
                String[] habilidades = dataMap.get("habilidad");
                for (int i = 0; i < habilidades.length; i++) {
                    if (habilidades[i].trim().length() > 0) {
                        out.println(mysql.insertHabilidades(candId, habilidades[i]));
                        out.println(mysql.getStatus());
                    }
                }

                String[] instituciones = dataMap.get("institucion");
                String[] titulaciones = dataMap.get("titulacion");
                String[] titfechas = dataMap.get("titfecha");

                for (int i = 0; i < instituciones.length; i++) {
                    if (instituciones[i].trim().length() > 0) {
                        out.println(mysql.insertTitulos(candId, instituciones[i], titulaciones[i], Date.valueOf(titfechas[i])));
                        out.println(mysql.getStatus());
                    }
                }

                String[] organizacion = dataMap.get("organizacion");
                String[] certificacion = dataMap.get("certificacion");
                String[] cerfecha = dataMap.get("cerfecha");

                for (int i = 0; i < organizacion.length; i++) {
                    if (organizacion[i].trim().length() > 0) {
                        out.println(mysql.insertCertificado(candId, organizacion[i], certificacion[i], Date.valueOf(cerfecha[i])));
                        out.println(mysql.getStatus());
                    }
                }

                String[] compania = dataMap.get("compania");
                String[] status = dataMap.get("status");
                String[] interes = dataMap.get("interes");

                for (int i = 0; i < compania.length; i++) {
                    if (compania[i].trim().length() > 0) {
                        out.println(mysql.insertCompania(Integer.parseInt(nomina), compania[i],
                                status[i], interes[i]));
                        out.println(mysql.getStatus());
                    }
                }

                String[] empresa = dataMap.get("empresa");
                String[] puesto = dataMap.get("puesto");
                String[] entrada = dataMap.get("entrada");
                String[] salida = dataMap.get("salida");
                String[] salario = dataMap.get("salario");

                for (int i = 0; i < empresa.length; i++) {
                    if (empresa[i].trim().length() > 0) {
                        out.println(mysql.insertTrabajo(candId, empresa[i], puesto[i], Date.valueOf(entrada[i]), Date.valueOf(salida[i]), Integer.parseInt(salario[i])));
                        out.println(candId);
                        out.println(mysql.getStatus());
                    }
                }

                break;
            case "addCand":
                Map<String, String[]> dataMap2 = request.getParameterMap();
                Enumeration<String> names2 = request.getParameterNames();

                while (names2.hasMoreElements()) {
                    String name = names2.nextElement();
                    String[] values = dataMap2.get(name);
                    for (int i = 0; i < values.length; i++) {
                        out.println(name + ": " + values[i]);
                    }
                }
                String anombre = dataMap2.get("nombre")[0];
                String atel = dataMap2.get("tel")[0];
                String aemail = dataMap2.get("email")[0];
                String apaga = dataMap2.get("paga")[0];
                String acalle = dataMap2.get("calle")[0];
                String anumero = dataMap2.get("numero")[0];
                String aciudad = dataMap2.get("ciudad")[0];
                String aestado = dataMap2.get("estado")[0];
                String acodigo = dataMap2.get("codigo")[0];

                out.println(mysql.insertCandidato(anombre, atel, aemail, Integer.parseInt(apaga),
                        acalle, Integer.parseInt(anumero), aciudad, aestado, Integer.parseInt(acodigo)));
                out.print(mysql.getStatus());
                url = "/mysqltest.jsp";
                LinkedList<Candidate> candidates1 = mysql.getCandidates();
                request.getSession().setAttribute("candidatos", candidates1);
                dispatcher
                        = getServletContext().getRequestDispatcher(url);
                dispatcher.forward(request, response);
                break;
            default:
                url = "/mysqltest.jsp";

                dispatcher
                        = getServletContext().getRequestDispatcher(url);
                dispatcher.forward(request, response);
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
