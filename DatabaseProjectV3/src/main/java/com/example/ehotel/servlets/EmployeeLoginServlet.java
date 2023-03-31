package com.example.ehotel.servlets;

import com.example.ehotel.connections.ConnectionDB;

import java.io.*;
import java.sql.*;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "employeeLoginServlet", value = "/employee-login-servlet")
public class EmployeeLoginServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        doPost(req, resp);
    }

    /**
     * This method takes the employee ID and password (SIN) from the user input on the
     * login page and retrieves the corresponding fields from the database. It then compares
     * the login information and redirects the user to the appropriate page.
     * @param req the request sent from the JSP file
     * @param resp the response to be sent to the JSP file
     * @throws IOException
     */
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        // VARIABLE DECLARATION: new session
        HttpSession session = req.getSession();

        // VARIABLE DECLARATION: username and password from user input
        String username = req.getParameter("user id");
        int pwd = Integer.parseInt(req.getParameter("password"));

        // VARIABLE DECLARATION: new connection
        ConnectionDB con = new ConnectionDB();

        // VARIABLE DECLARATION: new SIN var. to hold SIN retrieved from db
        int sinFromDB;

        // PROCESS: retrieving employee SIN from given username (employee ID)
        // INITIALIZATION
        sinFromDB = con.getESINByUser(username);

        // PROCESS: checking if given password matches SIN from db
        if (pwd == sinFromDB) { //success
            //req.setAttribute("employee_id", username);
            resp.sendRedirect("ViewBookings.jsp"); //redirecting to bookings page
        }
        else { //failure
            resp.sendRedirect("LoginError.jsp"); //redirecting to error page
        }

    }
}