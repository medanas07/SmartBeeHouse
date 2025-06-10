package com.beehouse.smartbeehouse.controller;

import com.beehouse.smartbeehouse.dao.General;
import com.beehouse.smartbeehouse.model.*;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "login", urlPatterns = {"/login"})
public class login extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("email") == null || session.getAttribute("email")==null) {
            request.getRequestDispatcher("WEB-INF/login.jsp").forward(request, response);
        } else {
            response.sendRedirect("/"); // Already logged in
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String pass = request.getParameter("password");

        General<Farmer> dao = new General<>(new Farmer());
        Farmer farmer = dao.findById(email);
        
        General<Agent> daoAg = new General<>(new Agent());
        Agent ag = daoAg.findById(email);

        if (farmer != null && email.equals(farmer.getEmail()) && pass.equals(farmer.getPassword())) {
            HttpSession session = request.getSession(true);
            session.setAttribute("email", email);
            session.setAttribute("role", "farmer");
            response.sendRedirect("/farmer");
        }else if(ag != null && email.equals(ag.getEmail()) && pass.equals(ag.getPassword())){
            HttpSession session = request.getSession(true);
            session.setAttribute("email", email);
            session.setAttribute("role", "agent");
            response.sendRedirect("/agent");
        } else {
            request.setAttribute("error", "Email ou mot de passe incorrect !");
            request.getRequestDispatcher("WEB-INF/login.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Login Servlet for Smart Bee House";
    }
}
