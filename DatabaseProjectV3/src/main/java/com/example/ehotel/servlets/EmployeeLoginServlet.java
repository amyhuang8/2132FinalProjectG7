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

    /**
     * This method is used to get the employee id and password (SIN) from the login page and
     * compare it to the database
     * @param req
     * @param resp
     * @throws IOException
     */
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
        resp.sendRedirect("LoginError.jsp");
    }
}