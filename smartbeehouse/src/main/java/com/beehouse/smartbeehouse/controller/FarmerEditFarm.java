/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */package com.beehouse.smartbeehouse.controller;

import com.beehouse.smartbeehouse.model.Farm;
import com.beehouse.smartbeehouse.model.Farmer;
import com.beehouse.smartbeehouse.dao.General;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/farmer/editFarm")
public class FarmerEditFarm extends HttpServlet {
    
    private General<Farm> farmDao;
    
    @Override
    public void init() throws ServletException {
        farmDao = new General<>(new Farm());
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        Farmer farmer = new General<Farmer>(new Farmer()).findById(session.getAttribute("email"));
        
        try {
            Long farmId = Long.parseLong(request.getParameter("id"));
            Farm farm = farmDao.findById(farmId);
            
            if (farm == null) {
                session.setAttribute("error", "Ferme non trouvée.");
                response.sendRedirect(request.getContextPath() + "/farmer/farms");
                return;
            }
            
            if (!farm.getFarmer().getEmail().equals(farmer.getEmail())) {
                session.setAttribute("error", "Vous n'avez pas l'autorisation de modifier cette ferme.");
                response.sendRedirect(request.getContextPath() + "/farmer/farms");
                return;
            }
            
            request.setAttribute("farm", farm);
            request.getRequestDispatcher("../WEB-INF/farmer/editFarm.jsp")
                   .forward(request, response);
            
        } catch (NumberFormatException e) {
            session.setAttribute("error", "ID de ferme invalide.");
            response.sendRedirect(request.getContextPath() + "/farmer/farms");
        } catch (Exception e) {
            session.setAttribute("error", "Une erreur est survenue lors de la récupération des données de la ferme.");
            response.sendRedirect(request.getContextPath() + "/farmer/farms");
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        Farmer farmer = new General<Farmer>(new Farmer()).findById(session.getAttribute("email"));
        
        Map<String, String> errors = new HashMap<>();
        Long farmId = Long.parseLong(request.getParameter("id"));
        
        try {
            Farm existingFarm = farmDao.findById(farmId);
            
            if (existingFarm == null) {
                errors.put("farm", "Ferme non trouvée.");
            } else if (!existingFarm.getFarmer().getEmail().equals(farmer.getEmail())) {
                errors.put("permission", "Vous n'avez pas l'autorisation de modifier cette ferme.");
            } else {
                // Récupérer et valider les données du formulaire
                String name = request.getParameter("name");
                if (name == null || name.trim().isEmpty()) {
                    errors.put("name", "Le nom de la ferme est requis.");
                }
                
                
                if (errors.isEmpty()) {
                    // Mettre à jour la ferme
                    existingFarm.setName(name);
                    farmDao.update(existingFarm);
                    
                    // Rediriger vers la page de détails avec un message de succès
                    session.setAttribute("success", "La ferme a été mise à jour avec succès.");
                    response.sendRedirect(request.getContextPath() + "/farmer/farmDetails?id=" + farmId);
                    return;
                }
            }
        } catch (NumberFormatException e) {
            errors.put("id", "ID de ferme invalide.");
        } catch (Exception e) {
            errors.put("system", "Une erreur est survenue lors de la mise à jour de la ferme.");
        }
        
        if (!errors.isEmpty()) {
            request.setAttribute("errors", errors);
            request.setAttribute("farm", farmDao.findById(farmId));
            request.getRequestDispatcher("../WEB-INF/farmer/editFarm.jsp")
                   .forward(request, response);
        }
    }
} 