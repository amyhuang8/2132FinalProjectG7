package com.example.ehotel.servlets;

import com.example.ehotel.connections.ConnectionDB;

import java.io.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "customerRegistrationServlet", value = "/customer-registration-servlet")
public class CustomerRegistrationServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        doPost(req, resp);
    }

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

        // VARIABLE DECLARATION: new session
        HttpSession session = req.getSession();

        // VARIABLE DECLARATION: registration vars.
        String fName = req.getParameter("first name");
        String lName = req.getParameter("last name");
        int SIN = Integer.parseInt(req.getParameter("ssn"));
        String streetAddress = req.getParameter("street address");
        String city = req.getParameter("city").substring(0, 1).toUpperCase()
                + req.getParameter("city").substring(1);
        String province = req.getParameter("provincestate").substring(0, 1).toUpperCase()
                + req.getParameter("provincestate").substring(1);
        String country = req.getParameter("country").substring(0, 1).toUpperCase()
                + req.getParameter("country").substring(1);
        long ccNum = Long.parseLong(req.getParameter("credit card number"));
        long phoneNum = Long.parseLong(req.getParameter("phone number"));
        String email = req.getParameter("email");

        // VARIABLE DECLARATION: new connection
        ConnectionDB con = new ConnectionDB();

        // PROCESS: inserting new customer to database
        if (con.insertNewCustomer(fName, lName, SIN, streetAddress, city, province, country, ccNum,
                phoneNum, email)) { //success
            resp.sendRedirect("ViewRooms.jsp"); //redirecting to rooms page
        }
        else { //failure
            resp.setStatus(400); //setting error status
            req.setAttribute("status", "CREG-DB-400"); //setting error status attribute
            req.setAttribute("heading", "REGISTRATION ERROR");
            req.setAttribute("error_msg", "An account with either this email or SIN already exists. " +
                    "Please return to the previous page, and try again."); //setting error msg attribute
            req.getRequestDispatcher("AccessError.jsp").forward(req, resp); //forwarding response attributes to error page
            resp.sendRedirect("AccessError.jsp"); //redirecting to error page
        }

    }

}