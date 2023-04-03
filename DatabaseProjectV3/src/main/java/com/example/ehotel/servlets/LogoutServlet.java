package com.example.ehotel.servlets;

import java.io.*;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "logoutServlet", value = "/logout-servlet")
public class LogoutServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        doPost(req, resp);
    }

    /**
     * This method takes destroys the current session and redirects the user to the homepage.
     *
     * @param req the request sent from the JSP file
     * @param resp the response to be sent to the JSP file
     * @throws IOException
     */
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        // VARIABLE DECLARATION: new session
        HttpSession session = req.getSession();

        session.invalidate(); //logging out

        resp.sendRedirect("Logout.jsp"); //redirecting to home page

    }

}