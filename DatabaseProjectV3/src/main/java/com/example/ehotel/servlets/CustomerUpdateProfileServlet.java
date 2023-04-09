package com.example.ehotel.servlets;

import com.example.ehotel.connections.CustomerServer;

import java.io.*;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "customerUpdateProfileServlet", value = "/customer-update-profile-servlet")
public class CustomerUpdateProfileServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        doPost(req, resp);
    }

    /**
     * This method takes all the user input from the profile page and updates the corresponding
     * fields in the database. It then refreshes the page.
     * @param req the request sent from the JSP file
     * @param resp the response to be sent to the JSP file
     * @throws IOException
     * @throws ServletException
     */
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

        // VARIABLE DECLARATION
        HttpSession session = req.getSession(); //new session
        CustomerServer con = new CustomerServer(); //new connection

        // VARIABLE DECLARATION: user input parameters
        String fName = req.getParameter("first name");
        String lName = req.getParameter("last name");
        String currentEmail = (String) session.getAttribute("email");
        String newEmail = req.getParameter("email");
        String street = req.getParameter("street address");
        String city = req.getParameter("city");
        String province = req.getParameter("province-state");
        String country = req.getParameter("country");
        long phoneNum = Long.parseLong(req.getParameter("phone number"));
        long ccNum = Long.parseLong(req.getParameter("credit card number"));

        // PROCESS: updating fields
        if (con.updateFieldByID("first_name", currentEmail, fName) &&
                con.updateFieldByID("last_name", currentEmail, lName) &&
                con.updateFieldByID("street", currentEmail, street) &&
                con.updateFieldByID("city", currentEmail, city) &&
                con.updateFieldByID("province", currentEmail, province) &&
                con.updateFieldByID("country", currentEmail, country) &&
                con.updateFieldByID("customer_phone_number", currentEmail, phoneNum) &&
                con.updateFieldByID("credit_card_num", currentEmail, ccNum) &&
                con.updateFieldByID("customer_email", currentEmail, newEmail)) { //success
            session.setAttribute("uid", newEmail); //updating session's user id to customer email

            setSessionAttributes(session, con, newEmail); //updating session attributes

            resp.setHeader("refresh", "1;url=CustomerProfile.jsp"); //refreshing page
        }
        else { //failure
            resp.setStatus(500); //setting error status
            req.setAttribute("status", "CPRO-DB-500"); //setting error status attribute
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
    private void setSessionAttributes(HttpSession session, CustomerServer con, String uid) {

        // VARIABLE DECLARATION: form vars. to hold values from db
        String fName, lName, email, street, city, province, country;
        long phoneNum, sin, ccNum;

        // PROCESS: retrieving form values from db using uid
        // INITIALIZATION
        fName = (String) con.getFieldByID("first_name", uid);
        lName = (String) con.getFieldByID("last_name", uid);
        email = (String) con.getFieldByID("customer_email", uid);
        street = (String) con.getFieldByID("street", uid);
        city = (String) con.getFieldByID("city", uid);
        province = (String) con.getFieldByID("province", uid);
        country = (String) con.getFieldByID("country", uid);
        phoneNum = Long.parseLong((String) con.getFieldByID("customer_phone_number", uid));
        sin = Long.parseLong((String) con.getFieldByID("sin", uid));
        ccNum = Long.parseLong((String) con.getFieldByID("credit_card_num", uid));

        // PROCESS: setting form values to the ones retrieved
        session.setAttribute("fname", fName);
        session.setAttribute("lname", lName);
        session.setAttribute("email", email);
        session.setAttribute("phone_num", phoneNum);
        session.setAttribute("street_address", street);
        session.setAttribute("city", city);
        session.setAttribute("province_state", province);
        session.setAttribute("country", country);
        session.setAttribute("sin", sin);
        session.setAttribute("cc_num", ccNum);

    }

}