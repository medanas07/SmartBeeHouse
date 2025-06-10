/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.beehouse.smartbeehouse.controller;

import com.beehouse.smartbeehouse.dao.General;
import java.io.IOException;
import com.beehouse.smartbeehouse.model.*;
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
@WebServlet(name = "FarmerFarmDetail", urlPatterns = {"/farmer/farmDetails"})
public class FarmerFarmDetail extends HttpServlet {

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
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
   
        General<Farm> farmDao = new General<>(new Farm());
        try {
            Long farmId = Long.parseLong(request.getParameter("id"));
            Farm farm = farmDao.findById(farmId);
            
            if (farm == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Farm not found");
                return;
            }
            
            // Get last inspection across all hives in this farm
            List<Inspection> lastInspection = new General<Inspection>(new Inspection()).executeQuerry("SELECT i FROM Inspection i ORDER BY i.date DESC");
            
            request.setAttribute("farm", farm);
            request.setAttribute("lastInspection", lastInspection.isEmpty()?null:lastInspection.get(0)); 
            request.getRequestDispatcher("../WEB-INF/farmer/farmDetails.jsp").forward(request, response);
            
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid farm ID");
        }    
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
