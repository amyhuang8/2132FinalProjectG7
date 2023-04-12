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
        String SIN = req.getParameter("sin");
        String streetAddress = req.getParameter("street address");
        String city = req.getParameter("city");
        String province = req.getParameter("province-state");
        String country = req.getParameter("country");
        long ccNum = Long.parseLong(req.getParameter("credit card number"));
        long phoneNum = Long.parseLong(req.getParameter("phone number"));
        String email = req.getParameter("email");

        // VARIABLE DECLARATION: new connection
        CustomerServer con = new CustomerServer();

        // PROCESS: inserting new customer to database
        if (con.insertNewCustomer(fName, lName, SIN, streetAddress, city, province, country, ccNum,
                phoneNum, email)) { //success
            session.setAttribute("uid", email); //updating session's user id to customer email
            setSessionAttributes(session, con, email); //setting session attributes
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