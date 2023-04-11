package com.example.ehotel.servlets;

import com.example.ehotel.connections.BookingServer;
import com.example.ehotel.entities.Booking;

import java.io.*;
import java.util.*;

import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

@WebServlet(name = "bookingServlet", value = "/booking-servlet")
public class BookingServlet extends HttpServlet  {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        doPost(req, resp);
    }

    /**
     * This method retrieves an arraylist of pending bookings and forwards the attribute to
     * the page requested.
     * @param req the request sent from the JSP file
     * @param resp the response to be sent to the JSP file
     * @throws IOException
     */
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

        // VARIABLE DECLARATION
        HttpSession session = req.getSession();
        BookingServer con = new BookingServer(); //new connection

        // RETRIEVE ALL PENDING BOOKINGS
        ArrayList<Booking> bookings = con.getPendingBookings((String) session.getAttribute("hotel_id"));

        // SEND THE DATA TO THE JSP
        req.setAttribute("bookings", bookings); //sending bookings arraylist
        req.setAttribute("displayBookings", "block");
        req.setAttribute("displayRooms", "none");
        req.getRequestDispatcher("ViewBookings.jsp").forward(req, resp); //forwarding response

    }

}