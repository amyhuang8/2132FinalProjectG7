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
        if (req.getParameter("hotel chain") == null) { // no hotel chain was chosen
            hotelChain = null;
        } else {
            hotelChain = req.getParameter("hotel chain");
        }

        // city chosen
        String city = null;
        if (req.getParameter("city") == null) { // no city was chosen
            city = null;
        } else {
            city = req.getParameter("city");
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
        String capacity = null;
        String roomType = req.getParameter("room type");
        if (roomType == null) { // no room type was chosen
            capacity = null;
        } else if (roomType.equals("single")) {
            capacity = "single";
        } else if (roomType.equals("double")) {
            capacity = "double";
        } else if (roomType.equals("triple")) {
            capacity = "triple";
        } else if (roomType.equals("quad")) {
            capacity = "quad";
        } else if (roomType.equals("joint")) {
            capacity = "joint";
        }

        // hotel category (number of stars)
        String category = null;
        if (req.getParameter("category") == null) { // no hotel category was chosen
            category = null;
        } else if (req.getParameter("category").equals("5")) {
            category = "5";
        } else if (req.getParameter("category").equals("4")) {
            category = "4";
        } else if (req.getParameter("category").equals("3")) {
            category = "3";
        }

        // number of rooms in hotel
        String numRooms = null;
        if (req.getParameter("num of rooms") == null) { // no number of rooms was chosen
            numRooms = null;
        } else if (req.getParameter("num of rooms").equals("1")) {
            numRooms = "1";
        } else if (req.getParameter("num of rooms").equals("2")) {
            numRooms = "2";
        } else if (req.getParameter("num of rooms").equals("3")) {
            numRooms = "3";
        } else if (req.getParameter("num of rooms").equals("4")) {
            numRooms = "4";
        } else if (req.getParameter("num of rooms").equals("5")) {
            numRooms = "5";
        }

        // max price
        int price = Integer.parseInt(req.getParameter("price"));

        // PROCESS: filter booking of room available
        //ArrayList<Room> rooms = con.filterRoom(hotelChain, city, new java.sql.Date(checkInDate.getTime()), new java.sql.Date(checkOutDate.getTime()), capacity, category, numRooms, price);

        ArrayList<Room> rooms = con.getAvailableRooms();

        LOGGER.severe("PRICE: " + price);

        // SEND THE DATA TO THE JSP
        req.setAttribute("rooms", rooms);
        req.getRequestDispatcher("SearchResults.jsp").forward(req, resp);
        resp.sendRedirect("SearchResults.jsp");
    }
}
