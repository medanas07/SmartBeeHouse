
package com.smartbeehouse.controller;

import com.smartbeehouse.model.Hive;
import com.smartbeehouse.service.HiveService;
import com.smartbeehouse.service.HiveServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class HiveController extends HttpServlet {
    private HiveService hiveService = new HiveServiceImpl();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Hive> hives = hiveService.getAllHives();
        request.setAttribute("hives", hives);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/hiveList.jsp");
        dispatcher.forward(request, response);
    }
}
