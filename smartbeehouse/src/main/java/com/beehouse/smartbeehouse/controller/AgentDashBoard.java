/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.beehouse.smartbeehouse.controller;

import com.beehouse.smartbeehouse.dao.General;
import com.beehouse.smartbeehouse.model.Agent;
import com.beehouse.smartbeehouse.model.Beehive;
import com.beehouse.smartbeehouse.model.Inspection;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.util.List;

/**
 *
 * @author moham
 */
@WebServlet(name = "AgentDashBoard", urlPatterns = {"/agent"})
public class AgentDashBoard extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
 
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Agent agent = new General<Agent>(new Agent()).findById(request.getSession().getAttribute("email"));

        List<Inspection> inspections = agent.getInspections();
        request.setAttribute("inspections", inspections);
        request.setAttribute("agent", agent);
        request.setAttribute("hive", new General<Beehive>(new Beehive()).findAll());
        request.getRequestDispatcher("WEB-INF/agent/agent.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

            Inspection inspection = new Inspection();
            inspection.setDate(Date.valueOf(request.getParameter("date")));
            inspection.setReason(request.getParameter("reason"));
            inspection.setFindings(request.getParameter("findings"));
            inspection.setActionsTaken(request.getParameter("actionsTaken"));
            inspection.setRecommendations(request.getParameter("recommendations"));
            inspection.setPopulationRating(Integer.parseInt(request.getParameter("populationRating")));
            inspection.setHealthRating(Integer.parseInt(request.getParameter("healthRating")));
            inspection.setProductivityRating(Integer.parseInt(request.getParameter("productivityRating")));

            // Link agent and beehive
            Agent agent = new General<Agent>(new Agent()).findById(request.getSession().getAttribute("email"));
            Beehive beehive = new General<Beehive>(new Beehive()).findById(Long.parseLong(request.getParameter("beehiveId")));

            inspection.setAgent(agent);
            inspection.setBeehive(beehive);
            
            if(beehive!=null){ 
                new General<Inspection>(inspection).save(inspection);
            }
            doGet(request, response);

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
