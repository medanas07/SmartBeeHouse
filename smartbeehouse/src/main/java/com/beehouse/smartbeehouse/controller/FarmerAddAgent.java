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
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author moham
 */
@WebServlet(name = "FarmerAddAgent", urlPatterns = {"/farmer/addAgent"})
public class FarmerAddAgent extends HttpServlet {

    private General<Agent> agentDao = new General<>(new Agent());
    
     @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                request.getRequestDispatcher("../WEB-INF/farmer/addAgent.jsp").forward(request, response);

    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        Map<String, String> errors = new HashMap<>();
        // Validation and processing logic here
        
        if (!errors.isEmpty()) {
            request.setAttribute("errors", errors);
            request.getRequestDispatcher("/WEB-INF/jsp/admin/addAgent.jsp").forward(request, response);
            return;
        }
        
        Agent a = new Agent(  request.getParameter("email"), request.getParameter("Name") , request.getParameter("password"), null);
        
        agentDao.save(a);
        response.sendRedirect("/farmer");
        
    }

}
