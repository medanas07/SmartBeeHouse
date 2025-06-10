/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.beehouse.smartbeehouse.controller;

import com.beehouse.smartbeehouse.dao.General;
import com.beehouse.smartbeehouse.model.Agent;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author moham
 */
@WebServlet(name = "FarmerAgentList", urlPatterns = {"/farmer/agentList"})
public class FarmerAgentList extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private General<Agent> agentDao = new General<>(new Agent());
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Get filter parameters
        String search = request.getParameter("search");
        String roleFilter = request.getParameter("roleFilter");
        String statusFilter = request.getParameter("statusFilter");
        
        // Pagination parameters
        int page = 1;
        int recordsPerPage = 10;
        
        
        // Get filtered agents
        List<Agent> agents = agentDao.findAll();
        
        
        // Set attributes for JSP
        request.setAttribute("agents", agents);
        
        request.getRequestDispatcher("../WEB-INF/farmer/agentlist.jsp").forward(request, response);
    }
}
