package com.example.ehotel.servlets;

import com.example.ehotel.connections.BookingServer;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Date;
import java.util.logging.Logger;

@WebServlet(name = "createBookingServlet", value = "/create-booking-servlet")
public class CreateBookingServlet extends HttpServlet {

    // LOGGER
    private static final Logger LOGGER = Logger.getLogger(CreateBookingServlet.class.getName());

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        doPost(req, resp);
    }

    /**
     * This method is used to grab the data from the form and the session and create a new booking/archive in the database.
     * @param req the request
     * @param resp the response
     * @throws ServletException if the request could not be handled
     * @throws IOException if the response could not be handled
     */
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // get session variables
        HttpSession session = req.getSession(); // get the session
        String email = (String) session.getAttribute("email");
        LOGGER.info(email);
        Date checkin = (Date) session.getAttribute("checkInDate");
        LOGGER.info(String.valueOf(checkin));
        Date checkout = (Date) session.getAttribute("checkOutDate");
        LOGGER.info(String.valueOf(checkout));

        // create a new connection
        BookingServer con = new BookingServer();

        // obtain the row's data
        int roomID = Integer.parseInt(req.getParameter("room-id"));
        double price = Double.parseDouble(req.getParameter("price"));
        double damages = Double.parseDouble(req.getParameter("damages"));
        double finalPrice = price - damages;


        // DEBUGGING
        LOGGER.info("EMAIL: " + email);
        LOGGER.info("CHECK IN DATE: " + checkin);
        LOGGER.info("CHECK OUT DATE: " + checkout);
        LOGGER.info("ROOM ID: " + roomID);
        LOGGER.info("PRICE: " + price);
        LOGGER.info("DAMAGES: " + damages);
        LOGGER.info( "FINAL PRICE: " + finalPrice);

        // create the booking
        con.createBooking(checkin, checkout, email, roomID, finalPrice);

        // redirect to the previous page
        resp.sendRedirect("ViewRooms.jsp");
    }
}
