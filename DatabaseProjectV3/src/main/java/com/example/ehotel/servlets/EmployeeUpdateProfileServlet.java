package com.example.ehotel.servlets;

import com.example.ehotel.connections.CustomerServer;

import java.io.*;

import com.example.ehotel.connections.EmployeeServer;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "employeeUpdateProfileServlet", value = "/employee-update-profile-servlet")
public class EmployeeUpdateProfileServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        doPost(req, resp);
    }

    /**
     * This method takes all the user input from the profile page and updates the corresponding
     * fields in the database. It then refreshes the page.
     * @param req the request sent from the JSP file
     * @param resp the response to be sent to the JSP file
     * @throws IOException
     */
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

        // VARIABLE DECLARATION
        HttpSession session = req.getSession(); //new session
        EmployeeServer con = new EmployeeServer(); //new connection

        // VARIABLE DECLARATION: user input parameters
        String employeeID = (String) session.getAttribute("uid");

        String fName = req.getParameter("first name");
        String lName = req.getParameter("last name");
        String street = req.getParameter("street address");
        String city = req.getParameter("city");
        String province = req.getParameter("province-state");
        String country = req.getParameter("country");

        // PROCESS: updating fields
        if (con.updateFieldByID("first_name", employeeID, fName) &&
                con.updateFieldByID("last_name", employeeID, lName) &&
                con.updateFieldByID("street", employeeID, street) &&
                con.updateFieldByID("city", employeeID, city) &&
                con.updateFieldByID("province", employeeID, province) &&
                con.updateFieldByID("country", employeeID, country)) { //success
            setSessionAttributes(session, con, employeeID); //updating session attributes
            resp.setHeader("refresh", "1;url=EmployeeProfile.jsp"); //refreshing page
        }
        else { //failure
            resp.setStatus(500); //setting error status
            req.setAttribute("status", "EPRO-DB-500"); //setting error status attribute
            req.setAttribute("heading", "PROFILE SAVE ERROR"); //setting heading attribute
            req.setAttribute("error_msg", "The changes in your information could not be saved. Please return to the previous page, and try again."); //setting error msg attribute
            req.getRequestDispatcher("ErrorPage.jsp").forward(req, resp); //forwarding response attributes to error page
            resp.sendRedirect("ErrorPage.jsp"); //redirecting to error page
        }
    }

    /**
     * This helper method sets all the session attributes once the user logs in.
     * @param session the current session
     * @param con the current database connection
     * @param uid the current user ID
     */
    private void setSessionAttributes(HttpSession session, EmployeeServer con, String uid) {

        // VARIABLE DECLARATION: form vars. to hold values from db
        String fName, lName, street, city, province, country;

        // PROCESS: retrieving form values from db using uid
        // INITIALIZATION
        fName = (String) con.getFieldByID("first_name", uid);
        lName = (String) con.getFieldByID("last_name", uid);
        street = (String) con.getFieldByID("street", uid);
        city = (String) con.getFieldByID("city", uid);
        province = (String) con.getFieldByID("province", uid);
        country = (String) con.getFieldByID("country", uid);

        // PROCESS: setting form values to the ones retrieved
        session.setAttribute("fname", fName);
        session.setAttribute("lname", lName);
        session.setAttribute("street_address", street);
        session.setAttribute("city", city);
        session.setAttribute("province_state", province);
        session.setAttribute("country", country);

    }

}