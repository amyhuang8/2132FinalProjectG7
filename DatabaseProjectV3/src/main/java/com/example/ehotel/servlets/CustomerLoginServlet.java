package com.example.ehotel.servlets;

import java.io.*;
import com.example.ehotel.connections.CustomerServer;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "customerLoginServlet", value = "/customer-login-servlet")
public class CustomerLoginServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
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
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        // VARIABLE DECLARATION: new session
        HttpSession session = req.getSession();

        // VARIABLE DECLARATION: email and password from user input
        String email = req.getParameter("email");
        int password = Integer.parseInt(req.getParameter("password"));

        // VARIABLE DECLARATION: new connection
        CustomerServer con = new CustomerServer();

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
            resp.sendRedirect("LoginError.jsp"); //redirecting to error page
        }

    }
}
