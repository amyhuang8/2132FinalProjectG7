package com.example.ehotel.servlets;

import com.example.ehotel.connections.ConnectionDB;

import java.io.*;
import java.sql.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "customerLoginServlet", value = "/customer-login-servlet")
public class CustomerLoginServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        doPost(req, resp);
    }

    /**
     * This method takes the customer email and password (SIN) from the user input on the
     * login page and retrieves the corresponding fields from the database. It then compares
     * the login information and redirects the user to the appropriate page.
     * @param req the request sent from the JSP file
     * @param resp the response to be sent to the JSP file
     * @throws IOException
     */
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

        // VARIABLE DECLARATION: new session
        HttpSession session = req.getSession();

        // VARIABLE DECLARATION: email and password from user input
        String email = req.getParameter("email");
        int password = Integer.parseInt(req.getParameter("password"));

        // VARIABLE DECLARATION: new connection
        ConnectionDB con = new ConnectionDB();

        // VARIABLE DECLARATION: new SIN var. to hold SIN retrieved from db
        int sinFromDB;

        // PROCESS: retrieving customer SIN from given username (email)
        // INITIALIZATION
        sinFromDB = con.getCSINByEmail(email);

        // PROCESS: checking if given password matches SIN from db
        if (password == sinFromDB) { //success
            //req.setAttribute("email", email);
            resp.sendRedirect("ViewRooms.jsp"); //redirecting to rooms page
        }
        else { //failure
            resp.setStatus(401); //setting error status
            req.setAttribute("status", "CLOG-DB-401"); //setting error status attribute
            req.setAttribute("heading", "LOGIN ERROR");
            req.setAttribute("error_msg", "Your login information is incorrect. Please return to the previous page, and try again."); //setting error msg attribute
            req.getRequestDispatcher("AccessError.jsp").forward(req, resp); //forwarding response attributes to error page
            resp.sendRedirect("AccessError.jsp"); //redirecting to error page
        }

    }
}
