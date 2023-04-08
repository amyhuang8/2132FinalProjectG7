package com.example.ehotel.servlets;

import com.example.ehotel.connections.RoomServer;
import com.example.ehotel.entities.Room;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

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

    private static final Logger LOGGER = Logger.getLogger(SearchResultsServlet.class.getName()); //logger


    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        doPost(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // VARIABLE DECLARATION
        RoomServer con = new RoomServer(); //new connection
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); // date format

        // READ THE FORM DATA

        // hotel chain chosen
        String hotelChain = null;
        if (req.getParameter("hotel chain").equals("")) { // no hotel chain was chosen
            hotelChain = null;
        } else {
            hotelChain = req.getParameter("hotel chain");
        }

        // city chosen
        String city = null;
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
        String numRooms = null;
        if (req.getParameter("num of rooms") == null) { // no number of rooms was chosen
            numRooms = null;
        } else {
            numRooms = req.getParameter("num of rooms");
        }

        // max price
        int price = Integer.parseInt(req.getParameter("price"));

        // PROCESS: filter booking of room available
        ArrayList<Room> rooms = con.filterRoom(hotelChain, city, new java.sql.Date(checkInDate.getTime()), new java.sql.Date(checkOutDate.getTime()), capacity, category, numRooms, price);

        //ArrayList<Room> rooms = con.getAvailableRooms();

        // DEBUGGING

        LOGGER.info("HOTEL CHAIN: " + hotelChain);
        LOGGER.severe("CITY: " + city);
        LOGGER.severe("CAPACITY: " + capacity);
        LOGGER.severe("CATEGORY: " + category);
        LOGGER.severe("NUM OF ROOMS: " + numRooms);
        LOGGER.severe("PRICE: " + price);


        // SEND THE DATA TO THE JSP
        req.setAttribute("rooms", rooms);
        req.getRequestDispatcher("SearchResults.jsp").forward(req, resp);
        resp.sendRedirect("SearchResults.jsp");
    }
}
