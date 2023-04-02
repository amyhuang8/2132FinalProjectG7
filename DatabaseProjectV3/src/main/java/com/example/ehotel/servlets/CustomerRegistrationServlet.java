package com.example.ehotel.servlets;

import com.example.ehotel.connections.CustomerServer;

import java.io.*;

import jakarta.servlet.*;
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
        int SIN = Integer.parseInt(req.getParameter("sin"));
        String streetAddress = req.getParameter("street address");
        String city = req.getParameter("city").substring(0, 1).toUpperCase()
                + req.getParameter("city").substring(1);
        String province = req.getParameter("province-state").substring(0, 1).toUpperCase()
                + req.getParameter("province-state").substring(1);
        String country = req.getParameter("country").substring(0, 1).toUpperCase()
                + req.getParameter("country").substring(1);
        long ccNum = Long.parseLong(req.getParameter("credit card number"));
        long phoneNum = Long.parseLong(req.getParameter("phone number"));
        String email = req.getParameter("email");

        // VARIABLE DECLARATION: new connection
        CustomerServer con = new CustomerServer();

        // PROCESS: inserting new customer to database
        if (con.insertNewCustomer(fName, lName, SIN, streetAddress, city, province, country, ccNum,
                phoneNum, email)) { //success
            session.setAttribute("uid", email); //updating session's user id to customer email
            resp.sendRedirect("ViewRooms.jsp"); //redirecting to rooms page
        }
        else { //failure
            resp.setStatus(400); //setting error status
            req.setAttribute("status", "CREG-DB-400"); //setting error status attribute
            req.setAttribute("heading", "REGISTRATION ERROR"); //setting heading attribute
            req.setAttribute("error_msg", "An account with either this email or SIN already exists. " +
                    "Please return to the previous page, and try again."); //setting error msg attribute
            req.getRequestDispatcher("ErrorPage.jsp").forward(req, resp); //forwarding response attributes to error page
            resp.sendRedirect("ErrorPage.jsp"); //redirecting to error page
        }

    }

}