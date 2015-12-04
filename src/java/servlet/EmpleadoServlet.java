/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import beans.Empleado;
import database.MySQL;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.util.Enumeration;
import java.util.LinkedList;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author lsanchez
 */
public class EmpleadoServlet extends HttpServlet {

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
        String button = request.getParameter("button");
        MySQL mysql = new MySQL();
        String url = "/404";
        RequestDispatcher dispatcher;
        switch (button) {
            case "getList":
                // store the User object in the request object
                // forward request and response objects to JSP page
                url = "/listaEmpleados.jsp";
                LinkedList<Empleado> empleados = mysql.getBasicEmpleados();
                request.getSession().setAttribute("empleados", empleados);
                dispatcher = getServletContext().getRequestDispatcher(url);
                dispatcher.forward(request, response);
                break;
            case "getDetalle":
                url = "/detalleEmpleado.jsp";
                int idEmp = Integer.parseInt(request.getParameter("specId"));
                Empleado empleado = mysql.getDetalleEmpleado(idEmp);
                empleado.setTitulos(mysql.getTitulos(empleado.getIdCand()));
                empleado.setHabilidades(mysql.getHabilidades(empleado.getIdCand()));
                empleado.setCertificados(mysql.getCertificados(empleado.getIdCand()));
                empleado.setHistorial(mysql.getHistorial(empleado.getNomina()));
                request.getSession().setAttribute("empleado", empleado);
                dispatcher = getServletContext().getRequestDispatcher(url);
                dispatcher.forward(request, response);
                break;
            case "editEmp":
                // store the User object in the request object
                // forward request and response objects to JSP page
                PrintWriter out = response.getWriter();
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
                String departamento = dataMap.get("departamento")[0];
                String puesto = dataMap.get("puesto")[0];
                String fechaEntrada = dataMap.get("fecha")[0];
                String salario = dataMap.get("salario")[0];
                String vacaciones = dataMap.get("vacaciones")[0];
                out.println(mysql.updateEmpleado(Integer.parseInt(nomina), departamento,
                        puesto, Date.valueOf(fechaEntrada), Integer.parseInt(salario),
                        Integer.parseInt(vacaciones), null));
                String tel = dataMap.get("tel")[0];
                String email = dataMap.get("email")[0];
                String calle = dataMap.get("calle")[0];
                String numero = dataMap.get("numero")[0];
                String ciudad = dataMap.get("ciudad")[0];
                String estado = dataMap.get("estado")[0];
                String codigo = dataMap.get("codigo")[0];
                out.println(mysql.updateEmpleadoCandidato(Integer.parseInt(nomina), tel, email, calle,
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
                
                String[] hispuesto = dataMap.get("hispuesto");
                String[] hisfecha = dataMap.get("hisfecha");
                String[] hissalario = dataMap.get("hissalario");
                
                for (int i = 0; i < hispuesto.length; i++) {
                    if (hispuesto[i].trim().length() > 0) {
                        out.println(mysql.insertHisorial(Integer.parseInt(nomina), hispuesto[i], 
                                Integer.parseInt(hissalario[i]), Date.valueOf(hisfecha[i])));
                        out.println(mysql.getStatus());
                    }
                }
                
                break;
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
        processRequest(request, response);
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
