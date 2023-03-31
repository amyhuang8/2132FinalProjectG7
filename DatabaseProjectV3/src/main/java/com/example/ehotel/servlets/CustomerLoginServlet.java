package com.example.ehotel.servlets;

import java.io.*;
import java.sql.SQLException;

import com.example.ehotel.connections.ConnectionDB;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "customerLoginServlet", value = "/customer-login-servlet")
public class CustomerLoginServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        doPost(req, resp);
    }

    /**
     * This method is used to get the customer id and password (SIN) from the login page and
     * compare it to the database
     * @param req
     * @param resp
     * @throws IOException
     */
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession();
//		customer account = new customer();
        String email = req.getParameter("email");
        int password = Integer.parseInt(req.getParameter("password"));

        ConnectionDB con = new ConnectionDB();

        int sinFromDB;
        try { // try to retrieve the sin of the customer from the database
            sinFromDB = con.getCSINByEmail(email);
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        if (password == sinFromDB) { // if password (inputted) matches the sin of the customer (from database)
            System.out.println("success");
            req.setAttribute("email", email);
            resp.sendRedirect("ViewRooms.jsp");
            return;
        }
        resp.sendRedirect("LoginError.jsp");
    }
}
