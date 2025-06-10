package com.beehouse.smartbeehouse.controller;

import com.beehouse.smartbeehouse.dao.General;
import com.beehouse.smartbeehouse.model.Farmer;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "Register", urlPatterns = {"/register"})
public class Register extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("email") != null) {
            response.sendRedirect("/"); // Déjà connecté
        } else {
            request.getRequestDispatcher("WEB-INF/register.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        // Validation des données
        if (name == null || name.trim().isEmpty() ||
            email == null || email.trim().isEmpty() ||
            password == null || password.trim().isEmpty() ||
            confirmPassword == null || confirmPassword.trim().isEmpty()) {
            request.setAttribute("error", "Tous les champs sont obligatoires");
            request.getRequestDispatcher("WEB-INF/register.jsp").forward(request, response);
            return;
        }

        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "Les mots de passe ne correspondent pas");
            request.getRequestDispatcher("WEB-INF/register.jsp").forward(request, response);
            return;
        }

        try {
            // Vérifier si l'email existe déjà
            General<Farmer> farmerDao = new General<>(new Farmer());
            Farmer existingFarmer = farmerDao.findById(email);
            
            if (existingFarmer != null) {
                request.setAttribute("error", "Cet email est déjà utilisé");
                request.getRequestDispatcher("WEB-INF/register.jsp").forward(request, response);
                return;
            }

            // Créer le nouvel utilisateur
            Farmer newFarmer = new Farmer();
            newFarmer.setName(name);
            newFarmer.setEmail(email);
            newFarmer.setPassword(password); // Note: Dans un vrai projet, il faudrait hasher le mot de passe

            // Sauvegarder dans la base de données
            farmerDao.save(newFarmer);

            // Créer la session et rediriger
            HttpSession session = request.getSession();
            session.setAttribute("email", email);
            response.sendRedirect("/");
        } catch (Exception e) {
            request.setAttribute("error", "Une erreur est survenue lors de l'inscription");
            request.getRequestDispatcher("WEB-INF/register.jsp").forward(request, response);
        }
    }
} 