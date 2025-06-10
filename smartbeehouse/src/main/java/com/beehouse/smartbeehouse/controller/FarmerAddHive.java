/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.beehouse.smartbeehouse.controller;

import com.beehouse.smartbeehouse.dao.General;
import com.beehouse.smartbeehouse.model.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author moham
 */
@WebServlet(name = "FarmerAddHive", urlPatterns = {"/farmer/addHive"})
public class FarmerAddHive extends HttpServlet {

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
        String siteId = request.getParameter("siteId");

        if (siteId == null || siteId.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Site ID is required");
            return;
        }

        try {
            ApiarySite site = new General<ApiarySite>(new ApiarySite()).findById(Long.parseLong(siteId));
            if (site == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Site not found");
                return;
            }

            request.setAttribute("siteId", siteId);
            request.getRequestDispatcher("../WEB-INF/farmer/addHive.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Site ID format");
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
        HttpSession session = request.getSession();
        Map<String, String> errors = new HashMap();

        // Get form parameters
        String siteId = request.getParameter("siteId");
        String hiveName = request.getParameter("hiveName");
        // Validation
        if (hiveName == null || hiveName.trim().isEmpty()) {
            errors.put("hiveName", "Hive name is required");
        }

        if (!errors.isEmpty()) {
            request.setAttribute("errors", errors);
            request.setAttribute("siteId", siteId);
            request.setAttribute("hiveName", hiveName);
            request.getRequestDispatcher("../WEB-INF/farmer/addHive.jsp").forward(request, response);
            return;
        }

        try {
            // Create new hive
            Beehive hive = new Beehive();
            hive.setName(hiveName);


            // Get site and associate with hive
            ApiarySite site = new General<ApiarySite>(new ApiarySite()).findById(Long.parseLong(siteId));
            hive.setApiarySite(site);

            // Save hive
            new General<Beehive>(new Beehive()).save(hive);

            // Set success message and redirect
            session.setAttribute("successMessage", "Hive '" + hiveName + "' was successfully created!");
            response.sendRedirect(request.getContextPath() + "/farmer/siteDetails?id=" + siteId);

        } catch (Exception e) {
            request.setAttribute("error", "Error saving hive: " + e.getMessage());
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
