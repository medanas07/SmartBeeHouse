/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.beehouse.smartbeehouse.controller;

import com.beehouse.smartbeehouse.dao.General;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Map;
import com.beehouse.smartbeehouse.model.*;
import java.util.HashMap;

/**
 *
 * @author moham
 */
@WebServlet(name = "FarmerAddFarm", urlPatterns = {"/farmer/addFarm"})
public class FarmerAddFarm extends HttpServlet {

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
                request.getRequestDispatcher("../WEB-INF/farmer/addFarm.jsp").forward(request, response);

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
         // Validate and process form data
        Map<String, String> errors = new HashMap<>();
        String farmName = request.getParameter("farmName");
        String description = request.getParameter("description");
        String location = request.getParameter("location");
        String siteCountStr = request.getParameter("initialSiteCount");

        // Validation
        if (farmName == null || farmName.trim().isEmpty()) {
            errors.put("farmName", "Farm name is required");
        } else if (farmName.length() > 100) {
            errors.put("farmName", "Farm name must be less than 100 characters");
        }

        if (!errors.isEmpty()) {
            request.setAttribute("errors", errors);
            request.setAttribute("farmName", farmName);
            request.getRequestDispatcher("../WEB-INF/farmer/addFarm.jsp").forward(request, response);
            return;
        }

        try {
            // Create and save new farm
            General<Farmer> dao = new General<>(new Farmer());
            Farmer farmer = dao.findById(request.getSession().getAttribute("email"));
            Farm newFarm = new Farm();
            newFarm.setName(farmName);
            newFarm.setFarmer(farmer);

            (new General<Farm>(newFarm)).save(newFarm);

            // Set success message
            response.sendRedirect(request.getContextPath() + "/farmer/farms");
        } catch (Exception e) {
            request.setAttribute("error", "An error occurred while saving the farm: " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/error.jsp").forward(request, response);
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
