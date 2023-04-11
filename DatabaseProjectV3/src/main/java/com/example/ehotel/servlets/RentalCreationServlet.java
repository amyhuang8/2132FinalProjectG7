package com.example.ehotel.servlets;

import com.example.ehotel.connections.RentalServer;

import java.io.*;
import java.text.*;
import java.util.*;

import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

@WebServlet(name = "rentalCreationServlet", value = "/rental-creation-servlet")
public class RentalCreationServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        doPost(req, resp);
    }

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

        // VARIABLE DECLARATION
        HttpSession session = req.getSession(); //getting session

        int roomID = Integer.parseInt(req.getParameter("room id"));
        int employeeID = Integer.parseInt((String) session.getAttribute("uid"));
        String customerEmail = req.getParameter("email");
        Date checkOut;

        // VARIABLE DECLARATION: new connection
        RentalServer con = new RentalServer();

        try {
            checkOut = new SimpleDateFormat("yyyy/MM/dd").parse(
                    req.getParameter("check out date").substring(0, 4) + "/" +
                            req.getParameter("check out date").substring(5, 7) + "/" +
                            req.getParameter("check out date").substring(8));

            // PROCESS: inserting new rental to database
            con.createRental(checkOut,customerEmail,roomID,employeeID); //success
        }
        catch (ParseException e) { //error-handling
            // OUTPUT
            e.printStackTrace();
        }

        resp.sendRedirect("ViewBookings.jsp"); //redirecting

    }

}
