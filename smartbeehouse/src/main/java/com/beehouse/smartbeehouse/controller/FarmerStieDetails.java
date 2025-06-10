/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.beehouse.smartbeehouse.controller;

import com.beehouse.smartbeehouse.dao.General;
import com.beehouse.smartbeehouse.model.ApiarySite;
import com.beehouse.smartbeehouse.model.Beehive;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Comparator;

/**
 *
 * @author moham
 */
@WebServlet(name = "FarmerStieDetails", urlPatterns = {"/farmer/siteDetails"})
public class FarmerStieDetails extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private General<ApiarySite> siteDao = new General<ApiarySite>(new ApiarySite());
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        try {
            Long siteId = Long.parseLong(request.getParameter("id"));
            
            ApiarySite site = siteDao.findById(siteId);
            if (site == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Site not found");
                return;
            }
            
            // Sort hives by name
            site.getBeehives().sort(Comparator.comparing(Beehive::getName));
            
            request.setAttribute("site", site);
            request.setAttribute("farmId", site.getFarm().getId());
            request.getRequestDispatcher("/WEB-INF/farmer/siteDetails.jsp").forward(request, response);
            
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid ID format");
        }
    }
}
