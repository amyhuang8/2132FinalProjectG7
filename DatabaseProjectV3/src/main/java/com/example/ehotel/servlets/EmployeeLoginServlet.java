package com.example.ehotel.servlets;

import java.io.*;
import java.sql.SQLException;

import com.example.ehotel.connections.ConnectionDB;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "employeeLoginServlet", value = "/employee-login-servlet")
public class EmployeeLoginServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        doPost(req, resp);
    }

    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession();
//		employee account = new employee();
        String username = req.getParameter("user id");
        int pwd = Integer.parseInt(req.getParameter("password"));

        ConnectionDB con = new ConnectionDB();
        int sinFromDB;
        try {
            sinFromDB = con.getESINByUser(username);
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }


        if (pwd == sinFromDB) {
            System.out.println("success");
            req.setAttribute("employee_id", username);
            resp.sendRedirect("ViewBookings.jsp");
            return;
        }
        resp.sendRedirect("index.jsp");
    }
}