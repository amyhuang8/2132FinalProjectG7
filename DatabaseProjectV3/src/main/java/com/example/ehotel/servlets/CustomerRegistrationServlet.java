package com.example.ehotel.servlets;

import java.io.*;
import java.sql.SQLException;

import com.example.ehotel.connections.ConnectionDB;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "customerRegistrationServlet", value = "/customer-registration-servlet")
public class CustomerRegistrationServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        doPost(req, resp);
    }

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession();
        String fName = req.getParameter("first name");
        String lName = req.getParameter("last name");
        int SIN = Integer.parseInt(req.getParameter("ssn"));
        String streetAddress = req.getParameter("street address");
        String city = req.getParameter("first name");
        String province = req.getParameter("province");
        String country = req.getParameter("country");
        int ccNum = Integer.parseInt(req.getParameter("credit card number"));
        int phoneNum = Integer.parseInt(req.getParameter("phone number"));
        String email = req.getParameter("email");

        // VARIABLE DECLARATION: new connection
        ConnectionDB con = new ConnectionDB();

        // PROCESS: inserting new customer to database
        con.insertNewCustomer(fName, lName, SIN, streetAddress, city, province, country, ccNum,
                phoneNum, email);
    }

}