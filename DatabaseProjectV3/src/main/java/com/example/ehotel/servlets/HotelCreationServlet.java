package com.example.ehotel.servlets;

import com.example.ehotel.connections.RoomServer;
import com.example.ehotel.entities.Room;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.logging.Logger;

@WebServlet(name = "hotelDeletionServlet", value = "/hotel-deletion-servlet")
public class HotelCreationServlet {
    private static final Logger LOGGER = Logger.getLogger(SearchResultsServlet.class.getName()); //logger

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        doPost(req, resp);
    }

    /**
     * This method creates a hotel, given all the data a hotel requires
     * @param req the request sent from the JSP file
     * @param resp the response to be sent to the JSP file
     * @throws IOException if there is an error with the input/output
     */
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

        // VARIABLE DECLARATION
        HttpSession session = req.getSession();
        RoomServer con = new RoomServer(); //new connection
        // RETRIEVE ALL ROOMS
        ArrayList<Room> rooms = null;
        try{
            rooms = con.getAvailableRooms(Integer.parseInt(session.getAttribute("hotel_id").toString()));
        }
        catch (ClassCastException e){
            System.out.println(session.getAttribute("hotel_id").toString());
        }


        // SEND THE DATA TO THE JSP
        req.setAttribute("rooms", rooms); //sending bookings arraylist
        req.getRequestDispatcher("ViewBookings.jsp").forward(req, resp); //forwarding response

    }
}

