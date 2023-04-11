package com.example.ehotel.servlets;

import com.example.ehotel.connections.RoomServer;
import com.example.ehotel.entities.Room;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Logger;

/**
 * This servlet is used to create a new booking in the database.
 */
@WebServlet(name = "searchResultsServlet", value = "/show-rooms-servlet")
public class SearchResultsServlet extends HttpServlet {
    // logger
    private static final Logger LOGGER = Logger.getLogger(SearchResultsServlet.class.getName());

    // Date formatter
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");


    /**
     * This method is used to show the available rooms in a specific hotel in the database.
     * @param req the request sent from the JSP file
     * @param resp the response to be sent to the JSP file
     * @throws IOException if there is an error with the input/output
     * @throws ServletException if there is an error with the servlet
     */
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        // VARIABLE DECLARATION
        RoomServer con = new RoomServer(); //new connection

        // get session
        HttpSession session = req.getSession();

        LOGGER.severe("Hotel ID: " + session.getAttribute("hotel_id"));

        // get the hotel id from the session
        if (session.getAttribute("hotel_id") != null) {
            int hotelID = Integer.parseInt((String) session.getAttribute("hotel_id"));
            // get the data from room server
            // get the data from view2
            ArrayList<Room> availableRooms = con.getAvailableRooms(hotelID);

            // setting the attribute
            req.setAttribute("availableRooms", availableRooms);

            // forward to the view bookings page (employee's home page)
            req.setAttribute("availableRooms", availableRooms);
            req.setAttribute("displayBookings", "none");
            req.setAttribute("displayRooms", "block");
            req.getRequestDispatcher("ViewBookings.jsp").forward(req, resp);
        } else {
            // redirect to error page
            //e.printStackTrace();
            resp.setStatus(401); //setting error status
            req.setAttribute("status", "CLOG-DB-401"); //setting error status attribute
            req.setAttribute("heading", "USER ERROR"); //setting heading attribute
            req.setAttribute("error_msg", "Your session has ended. Please click return."); //setting error msg attribute
            req.getRequestDispatcher("ErrorPage.jsp").forward(req, resp); //forwarding response attributes to error page
            resp.sendRedirect("ErrorPage.jsp"); //redirecting to error page
        }

    }

    /**
     * This method is used to filter the rooms available in the database.
     * @param req the request sent from the JSP file
     * @param resp the response to be sent to the JSP file
     * @throws ServletException if there is an error with the servlet
     * @throws IOException if there is an error with the input/output
     */
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // VARIABLE DECLARATION
        RoomServer con = new RoomServer(); //new connection

        // hotel chain chosen
        String hotelChain;
        if (req.getParameter("hotel chain").equals("")) { // no hotel chain was chosen
            hotelChain = null;
        } else {
            hotelChain = req.getParameter("hotel chain");
        }

        // city chosen
        String city;
        if (req.getParameter("location").equals("")) { // no city was chosen
            city = null;
        } else {
            city = req.getParameter("location");
        }

        // check in and check out dates
        Date checkInDate, checkOutDate;
        try { // parse the dates
            checkInDate = dateFormat.parse(req.getParameter("check in date"));
            checkOutDate = dateFormat.parse(req.getParameter("check out date"));
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }

        // room capacity
        String capacity;
        String roomType = req.getParameter("capacity");
        if (roomType == null || roomType.equals("default")) { // no room type was chosen
            capacity = null;
        } else {
            capacity = roomType;
        }

        // hotel category (number of stars)
        String category;
        if (req.getParameter("category") == null) { // no hotel category was chosen
            category = null;
        } else {
            category = req.getParameter("category");
        }

        // number of rooms in hotel
        String numRooms;
        if (req.getParameter("num of rooms") == null) { // no number of rooms was chosen
            numRooms = null;
        } else {
            numRooms = req.getParameter("num of rooms");
        }

        // max price
        int price = Integer.parseInt(req.getParameter("price"));

        // PROCESS: filter booking of room available
        ArrayList<Room> rooms = con.filterRoom(hotelChain, city, new java.sql.Date(checkInDate.getTime()), new java.sql.Date(checkOutDate.getTime()), capacity, category, numRooms, price);

        // DEBUGGING
        LOGGER.info("HOTEL CHAIN: " + hotelChain);
        LOGGER.severe("CITY: " + city);
        LOGGER.severe("CAPACITY: " + capacity);
        LOGGER.severe("CATEGORY: " + category);
        LOGGER.severe("NUM OF ROOMS: " + numRooms);
        LOGGER.severe("PRICE: " + price);

        // set session attributes to be used in booking servlet
        HttpSession session = req.getSession();
        session.setAttribute("checkInDate", checkInDate);
        session.setAttribute("checkOutDate", checkOutDate);

        // SEND THE DATA TO THE JSP
        req.setAttribute("rooms", rooms);
        req.getRequestDispatcher("SearchResults.jsp").forward(req, resp);
    }
}
