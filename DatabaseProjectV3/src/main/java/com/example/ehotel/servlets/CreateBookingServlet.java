package com.example.ehotel.servlets;

import com.example.ehotel.connections.BookingServer;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Logger;

@WebServlet(name = "createBookingServlet", value = "/create-booking-servlet")
public class CreateBookingServlet extends HttpServlet {
    // LOGGER
    private static final Logger LOGGER = Logger.getLogger(SearchResultsServlet.class.getName());

    // DATE FORMATTER
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        BookingServer con = new BookingServer();

        // obtain the form data
        Date checkin;
        Date checkout;
        try {
            checkin = dateFormat.parse(req.getParameter("checkin"));
            checkout = dateFormat.parse(req.getParameter("checkout"));
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
        String email = req.getParameter("email");
        int roomID = Integer.parseInt(req.getParameter("roomID"));
        double finalPrice = Double.parseDouble(req.getParameter("finalPrice"));

        con.createBooking(checkin, checkout, email, roomID, finalPrice);
    }
}
