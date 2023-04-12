package com.example.ehotel.servlets;

import com.example.ehotel.connections.EmployeeServer;

import java.io.*;
import java.util.logging.Logger;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "employeeLoginServlet", value = "/employee-login-servlet")
public class EmployeeLoginServlet extends HttpServlet {

    // logger
    private static final Logger LOGGER = Logger.getLogger(SearchResultsServlet.class.getName());

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        doPost(req, resp);
    }

    /**
     * This method takes the employee ID and password (SIN) from the user input on the
     * login page and retrieves the corresponding fields from the database. It then compares
     * the login information and redirects the user to the appropriate page.
     * @param req the request sent from the JSP file
     * @param resp the response to be sent to the JSP file
     * @throws IOException if there is an error with the input/output
     * @throws ServletException if there is an error with the servlet
     */
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

        // VARIABLE DECLARATION: new session
        HttpSession session = req.getSession();

        // VARIABLE DECLARATION: username and password from user input
        String username = req.getParameter("user id");
        int pwd = Integer.parseInt(req.getParameter("password"));

        // VARIABLE DECLARATION: new connection
        EmployeeServer con = new EmployeeServer();

        // VARIABLE DECLARATION: new SIN var. to hold SIN retrieved from db
        int sinFromDB;

        // PROCESS: retrieving employee SIN from given username (employee ID)
        // INITIALIZATION
        sinFromDB = con.getESINByUser(username);

        // PROCESS: checking if given password matches SIN from db
        if (pwd == sinFromDB) { //success
            session.setAttribute("uid", username); //updating session's user id to employee id

            setSessionAttributes(session, con, username); //setting session attributes

            resp.sendRedirect("ViewBookings.jsp"); //redirecting to bookings page
        }
        else { //failure
            resp.setStatus(401); //setting error status
            req.setAttribute("status", "ELOG-DB-401"); //setting error status to title attribute
            req.setAttribute("heading", "LOGIN ERROR"); //setting heading attribute
            req.setAttribute("error_msg", "Your login information is incorrect. Please return to the previous page, and try again."); //setting error msg attribute
            req.getRequestDispatcher("ErrorPage.jsp").forward(req, resp); //forwarding response attributes to error page
        //    resp.sendRedirect("ErrorPage.jsp"); //redirecting to error page
        }

    }

    /**
     * This helper method sets all the session attributes once the user logs in.
     * @param session the current session
     * @param con the current database connection
     * @param uid the current user ID
     */
    private void setSessionAttributes(HttpSession session,
                                      EmployeeServer con, String uid) {

        // VARIABLE DECLARATION: form vars. to hold values from db
        String fName, lName, managerID, hotelID, street, city, province, country, position;
        long sin;
        double salary;

        // PROCESS: retrieving form values from db using uid
        // INITIALIZATION
        fName = (String) con.getFieldByID("first_name", uid);
        lName = (String) con.getFieldByID("last_name", uid);
        managerID = (String) con.getFieldByID("manager_id", uid);
        hotelID = (String) con.getFieldByID("hotel_id", uid);
        street = (String) con.getFieldByID("street", uid);
        city = (String) con.getFieldByID("city", uid);
        province = (String) con.getFieldByID("province", uid);
        country = (String) con.getFieldByID("country", uid);
        position = (String) con.getFieldByID("position", uid);
        sin = Long.parseLong((String) con.getFieldByID("sin", uid));
        salary = Double.parseDouble((String) con.getFieldByID("salary", uid));

        // PROCESS: setting form values to the ones retrieved
        session.setAttribute("fname", fName);
        session.setAttribute("lname", lName);

        if (managerID == null) { //not manager
            managerID = "N/A"; //updating manager ID
        }

        session.setAttribute("manager_id", managerID);
        session.setAttribute("hotel_id", hotelID);
        session.setAttribute("street_address", street);
        session.setAttribute("city", city);
        session.setAttribute("province_state", province);
        session.setAttribute("country", country);
        session.setAttribute("position", position);
        session.setAttribute("sin", sin);
        session.setAttribute("salary", salary);

    }

}