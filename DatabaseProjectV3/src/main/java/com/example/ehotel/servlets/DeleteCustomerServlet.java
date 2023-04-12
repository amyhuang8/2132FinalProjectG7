package com.example.ehotel.servlets;

import com.example.ehotel.connections.CustomerServer;
import com.example.ehotel.connections.EmployeeServer;

import java.io.*;

import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

@WebServlet(name = "deleteCustomerServlet", value = "/delete-customer-servlet")
public class DeleteCustomerServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        doPost(req, resp);
    }

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

        // VARIABLE DECLARATION
        HttpSession session = req.getSession(); //getting current session

        CustomerServer con = new CustomerServer();

        // PROCESS: deleting hotel
        con.deleteAccount((String) session.getAttribute("uid"));

        session.invalidate(); //logging out

        resp.sendRedirect("AccountDeleted.jsp"); //redirecting to home page

    }

}