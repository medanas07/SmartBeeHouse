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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author moham
 */
@WebServlet(name = "FarmerAddSite", urlPatterns = {"/farmer/addSite"})
public class FarmerAddSite extends HttpServlet {

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
        String farmId = request.getParameter("farmId");

        if (farmId == null || farmId.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Farm ID is required");
            return;
        }

        try {
            Farm farm = (new General<Farm>(new Farm())).findById(Long.parseLong(farmId));
            if (farm == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Farm not found");
                return;
            }

            request.setAttribute("farmId", farmId);
            request.getRequestDispatcher("/WEB-INF/farmer/addSite.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Farm ID format");
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
        Map<String, String> errors = new HashMap<String, String>();

        // Get form parameters
        String farmId = request.getParameter("farmId");
        String implementationDate = request.getParameter("implementationDate");
        String latitude = request.getParameter("latitude");
        String longitude = request.getParameter("longitude");
        String altitude = request.getParameter("altitude");

        // Validation
        
        if (implementationDate == null || implementationDate.isEmpty()) {
            errors.put("implementationDate", "Implementation date is required");
        }

        if (latitude == null || latitude.isEmpty()) {
            errors.put("latitude", "Latitude is required");
        } else {
            try {
                double lat = Double.parseDouble(latitude);
                if (lat < -90 || lat > 90) {
                    errors.put("latitude", "Latitude must be between -90 and 90");
                }
            } catch (NumberFormatException e) {
                errors.put("latitude", "Invalid latitude value");
            }
        }

        if (longitude == null || longitude.isEmpty()) {
            errors.put("longitude", "Longitude is required");
        } else {
            try {
                double lng = Double.parseDouble(longitude);
                if (lng < -180 || lng > 180) {
                    errors.put("longitude", "Longitude must be between -180 and 180");
                }
            } catch (NumberFormatException e) {
                errors.put("longitude", "Invalid longitude value");
            }
        }

        if (!errors.isEmpty()) {
            request.setAttribute("errors", errors);
            request.setAttribute("farmId", farmId);
            request.setAttribute("implementationDate", implementationDate);
            request.setAttribute("latitude", latitude);
            request.setAttribute("longitude", longitude);
            request.setAttribute("altitude", altitude);
            request.getRequestDispatcher("../WEB-INF/farmer/addSite.jsp").forward(request, response);
            return;
        }

        try {
            // Create new apiary site
            ApiarySite site = new ApiarySite();
            site.setLatitude(Double.parseDouble(latitude));
            site.setLongitude(Double.parseDouble(longitude));

            if (altitude != null && !altitude.isEmpty()) {
                site.setAltitude(Double.parseDouble(altitude));
            }

            SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
            site.setImplementationDate(f.parse(implementationDate));

            // Associate with farm
            Farm farm = (new General<Farm>(new Farm())).findById(Long.parseLong(farmId));
            site.setFarm(farm);

            // Save site
            (new General<ApiarySite>(new ApiarySite())).save(site);

            // Set success message and redirect
            session.setAttribute("successMessage", "Apiary site was successfully created!");
            response.sendRedirect(request.getContextPath() + "/farmer/farmDetails?id=" + farmId);

        } catch (DateTimeParseException e) {
            errors.put("implementationDate", "Invalid date format");
            request.setAttribute("errors", errors);
            request.getRequestDispatcher("../WEB-INF/farmer/addSite.jsp").forward(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(FarmerAddSite.class.getName()).log(Level.SEVERE, null, ex);
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
