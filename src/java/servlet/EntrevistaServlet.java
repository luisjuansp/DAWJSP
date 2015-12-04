/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import beans.Entrevista;
import database.MySQL;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.Enumeration;
import java.util.LinkedList;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author lsanchez
 */
public class EntrevistaServlet extends HttpServlet {

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
                url = "/listaEntrevistas.jsp";
                LinkedList<Entrevista> entrevistas = mysql.getBasicEntrevista();
                request.getSession().setAttribute("entrevistas", entrevistas);
                dispatcher = getServletContext().getRequestDispatcher(url);
                dispatcher.forward(request, response);
                break;
            case "getDetalle":
                url = "/detallesEntrevista.jsp";
                int idEnt = Integer.parseInt(request.getParameter("specId"));
                Entrevista entrevista = mysql.getDetalleEntrevista(idEnt);
                request.getSession().setAttribute("entrevista", entrevista);
                dispatcher = getServletContext().getRequestDispatcher(url);
                dispatcher.forward(request, response);
                break;
            case "editEnt":
                PrintWriter out = response.getWriter();
                Map<String, String[]> dataMap = request.getParameterMap();
                Enumeration<String> names = request.getParameterNames();
                String candidato = dataMap.get("candidato")[0];
                String fecha = dataMap.get("fecha")[0];
                String plataforma = dataMap.get("plataforma")[0];
                String entrevistador = dataMap.get("entrevistador")[0];
                String aptitud = dataMap.get("aptitud")[0];
                String feedback = dataMap.get("feedback")[0];
                String sidEnt = dataMap.get("idEnt")[0];
                out.println(mysql.updateEntrevista(Integer.parseInt(sidEnt), candidato, Date.valueOf(fecha), plataforma, entrevistador, aptitud, feedback));
                out.println(mysql.getStatus());
                break;
            case "addEnt":
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
