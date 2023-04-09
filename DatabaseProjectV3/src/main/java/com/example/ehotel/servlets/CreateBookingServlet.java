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

        // get session variables
        HttpSession session = req.getSession();
        String email = (String) session.getAttribute("email");
        int roomID = (int) session.getAttribute("roomID");
        Date checkin = (Date) session.getAttribute("checkin");
        Date checkout = (Date) session.getAttribute("checkout");


        // create a new connection
        BookingServer con = new BookingServer();

        // obtain the row's data
        double price = Double.parseDouble(req.getParameter("price"));
        double damages = Double.parseDouble(req.getParameter("damages"));
        double finalPrice = price - damages;

        con.createBooking(checkin, checkout, email, roomID, finalPrice);
    }
}
