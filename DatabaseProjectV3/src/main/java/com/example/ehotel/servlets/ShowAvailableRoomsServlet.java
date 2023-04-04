package com.example.ehotel.servlets;

import com.example.ehotel.connections.HotelServer;
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
@WebServlet(name = "showAvailableRoomsServlet", value = "/show-rooms-servlet")
public class ShowAvailableRoomsServlet extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(ShowAvailableRoomsServlet.class.getName()); //logger


    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        doPost(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // VARIABLE DECLARATION
        HotelServer con = new HotelServer(); //new connection
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

        // READ THE FORM DATA

        // hotel chain chosen
        String hotelChain;
        if (req.getParameter("hotel chain") == null) { // no hotel chain was chosen
            hotelChain = "any";
        } else {
            hotelChain = req.getParameter("hotel chain");
        }

        // city chosen
        String city;
        if (req.getParameter("city") == null) { // no city was chosen
            city = "any";
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
        String capacity;
        String roomType = req.getParameter("room type");
        if (roomType == null) { // no room type was chosen
            capacity = "any";
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
        } else {
            capacity = "any";
        }

        // hotel category (number of stars)
        int category;
        if (req.getParameter("category") == null) { // no hotel category was chosen
            category = 0;
        } else if (Integer.parseInt(req.getParameter("category")) == 5) {
            category = 5;
        } else if (Integer.parseInt(req.getParameter("category")) == 4) {
            category = 4;
        } else if (Integer.parseInt(req.getParameter("category")) == 3) {
            category = 3;
        } else {
            category = 0;
        }

        // view type of room
        String viewType;
        if (req.getParameter("view type") == null) { // no view type was chosen
            viewType = "any";
        } else if (req.getParameter("view type").equals("city-view")) {
            viewType = "city";
        } else if (req.getParameter("view type").equals("sea-view")) {
            viewType = "sea";
        } else if (req.getParameter("view type").equals("mountain-view")) {
            viewType = "mountain";
        } else if (req.getParameter("view type").equals("river-view")) {
            viewType = "river";
        } else {
            viewType = "any";
        }

        // number of rooms in hotel
        int numRooms;
        if (req.getParameter("num of rooms") == null) { // no number of rooms was chosen
            numRooms = 0;
        } else if (Integer.parseInt(req.getParameter("num of rooms")) == 1) {
            numRooms = 1;
        } else if (Integer.parseInt(req.getParameter("num of rooms")) == 2) {
            numRooms = 2;
        } else if (Integer.parseInt(req.getParameter("num of rooms")) == 3) {
            numRooms = 3;
        } else if (Integer.parseInt(req.getParameter("num of rooms")) == 4) {
            numRooms = 4;
        } else if (Integer.parseInt(req.getParameter("num of rooms")) == 5) {
            numRooms = 5;
        } else {
            numRooms = 0; // no number of rooms was chosen
        }

        // max price
        int price = Integer.parseInt(req.getParameter("price"));

        // PROCESS: filter booking of room available
        ArrayList<Room> roomNum = con.filterRoom(hotelChain, city, checkInDate, checkOutDate, capacity, category, viewType, numRooms, price);

        // SEND THE DATA TO THE JSP
        req.setAttribute("roomNum", roomNum);
        req.getRequestDispatcher("ListOfRooms.jsp").forward(req, resp);
        resp.sendRedirect("ListOfRooms.jsp");
    }
}
