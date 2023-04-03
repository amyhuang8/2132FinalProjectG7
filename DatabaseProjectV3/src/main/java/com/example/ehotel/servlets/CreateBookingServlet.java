package com.example.ehotel.servlets;

import com.example.ehotel.connections.HotelServer;
import com.example.ehotel.entities.Room;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

/**
 * This servlet is used to create a new booking in the database.
 */
public class CreateBookingServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        doPost(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // VARIABLE DECLARATION
        HotelServer con = new HotelServer(); //new connection
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

        // READ THE FORM DATA

        /**
         * DO LATER: get the hotel chain/hotel the user puts in the form
         */

        // check in and check out dates
        Date checkInDate, checkOutDate = null;
        try { // parse the dates
            checkInDate = dateFormat.parse(req.getParameter("check in date"));
            checkOutDate = dateFormat.parse(req.getParameter("check out date"));
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }

        // room capacity
        String capacity;
        if (req.getParameter("room type").equals("single")) {
            capacity = "single";
        } else if (req.getParameter("room type").equals("double")) {
            capacity = "double";
        } else if (req.getParameter("room type").equals("triple")) {
            capacity = "triple";
        } else if (req.getParameter("room type").equals("quad")) {
            capacity = "quad";
        } else if (req.getParameter("room type").equals("joint")) {
            capacity = "joint";
        } else {
            capacity = "any"; // not room type was chosen
        }

        // hotel category (number of stars)
        int category;
        if (req.getParameter("category").equals("five-stars-and-up")) {
            category = 5;
        } else if (req.getParameter("category").equals("four-stars-and-up")) {
            category = 4;
        } else if (req.getParameter("category").equals("three-stars-and-up")) {
            category = 3;
        } else {
            category = 0; // not hotel category was chosen
        }

        // view type of room
        String viewType;
        if (req.getParameter("view type").equals("city-view")) {
            viewType = "city";
        } else if (req.getParameter("view type").equals("sea-view")) {
            viewType = "sea";
        } else if (req.getParameter("view type").equals("mountain-view")) {
            viewType = "mountain";
        } else if (req.getParameter("view type").equals("river-view")) {
            viewType = "river";
        } else {
            viewType = "any"; // not view type was chosen
        }

        // max price
        int price = Integer.parseInt(req.getParameter("price"));

        // PROCESS: filter booking of room available
        ArrayList<Room> roomNum = con.filterRoom(checkInDate, checkOutDate, capacity, category, viewType, price);
    }
}
