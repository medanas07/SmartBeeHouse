/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.beehouse.smartbeehouse.controller;

import com.beehouse.smartbeehouse.dao.General;
import com.beehouse.smartbeehouse.model.Beehive;
import com.beehouse.smartbeehouse.model.Frame;
import com.beehouse.smartbeehouse.model.HiveComponent;
import com.beehouse.smartbeehouse.model.Inspection;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

/**
 *
 * @author moham
 */
@WebServlet(name = "FarmerHiveDetail", urlPatterns = {"/farmer/hiveDetails"})
public class FarmerHiveDetail extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private General<Beehive> beehiveDao = new General<Beehive>(new Beehive());

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            Long hiveId = Long.parseLong(request.getParameter("id"));

            Beehive beehive = beehiveDao.findById(hiveId);
            if (beehive == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Hive not found");
                return;
            }

            // Sort components by type and position
            beehive.getComponents().sort((a, b) -> {
                if (a.getType().equals(b.getType())) {
                    return Integer.compare(a.getPosition(), b.getPosition());
                }
                return a.getType().equals("BASE") ? -1 : 1;
            });

            // Sort frames by slot number
            beehive.getComponents().forEach(component -> {
                component.getFrames().sort(Comparator.comparingInt(Frame::getSlotNumber));
            });

            // Sort inspections by date (newest first)
            beehive.getInspections().sort(Comparator.comparing(Inspection::getDate).reversed());

            request.setAttribute("beehive", beehive);
            request.setAttribute("siteId", beehive.getApiarySite().getId());
            request.getRequestDispatcher("/WEB-INF/farmer/hiveDetails.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid ID format");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Beehive beehive = new Beehive();
        General<Frame> daof = new General<Frame>(new Frame());
        General<Beehive> daohive = new General<Beehive>(beehive);
        General<HiveComponent> daocomp = new General<HiveComponent>(new HiveComponent());
        if (req.getParameter("addComp") != null && req.getParameter("addComp").equals("1")) {
            beehive = daohive.findById(req.getParameter("id"));
            if (beehive != null) {
                HiveComponent e = new HiveComponent();
                e.setBeehive(beehive);
                if (beehive.getComponents().isEmpty()) {
                    e.setPosition(0);
                    e.setType("base");
                    daocomp.save(e);
                } else if (beehive.getComponents().size() < 10) {
                    e.setPosition(beehive.getComponents().size());
                    e.setType("extend");
                    daocomp.save(e);
                } else {
                    req.getSession().setAttribute("error", "beehive componment can't be more than 10");
                }
            }

        } else if (req.getParameter("addFrame") != null && req.getParameter("addFrame").equals("1")) {
            HiveComponent he = daocomp.findById(req.getParameter("frm"));
            if (he != null) {
                Frame f = new Frame();
                f.setComponent(he);
                f.setWeight(Long.parseLong(req.getParameter("weight")));

                if (he.getFrames().isEmpty()) {
                    f.setSlotNumber(0);
                    daof.save(f);

                } else if (he.getFrames().size() < 6) {
                    f.setSlotNumber(he.getFrames().size());
                    daof.save(f);
                }
            } else {
                req.getSession().setAttribute("error", "componment frames can't be more than 6");
            }

        }

        if (req.getParameter("removeComponent") != null) {
            HiveComponent toRemove = daocomp.findById(req.getParameter("removeComponent"));
            if (toRemove != null) {
                daocomp.deleteById(toRemove.getId());
            }
        }

        if (req.getParameter("removeFrame") != null) {
            Frame frame = daof.findById(req.getParameter("removeFrame"));
            if (frame != null) {
                daof.deleteById(frame.getId());
            }
        }
        doGet(req, resp);
    }

}
