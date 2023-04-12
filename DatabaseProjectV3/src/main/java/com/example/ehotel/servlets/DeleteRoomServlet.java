package com.example.ehotel.servlets;

import com.example.ehotel.connections.RoomServer;

import java.io.*;
import java.util.ArrayList;

import com.example.ehotel.entities.Room;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

@WebServlet(name = "deleteRoomServlet", value = "/delete-room-servlet")
public class DeleteRoomServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        // VARIABLE DECLARATION
        RoomServer con = new RoomServer();

        // get session
        HttpSession session = req.getSession();

        // get the hotel id
        int hotelID = Integer.parseInt((String) session.getAttribute("hotel_id"));

        // get the data from room server
        ArrayList<Room> allRooms = con.getAllRooms(hotelID);

        //setting the attribute
        req.setAttribute("allRooms", allRooms);

        // forward to the view2 page
        req.setAttribute("allRooms", allRooms);
        req.getRequestDispatcher("DeleteRoom.jsp").forward(req, resp);
       // resp.sendRedirect("DeleteRoom.jsp");
    }

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

        // VARIABLE DECLARATION
        RoomServer con = new RoomServer();

        System.out.println("room ID: " + req.getParameter("room_id"));

        // PROCESS: deleting hotel
        con.deleteRoom(req.getParameter("room_id"));

        resp.sendRedirect("ViewBookings.jsp"); //redirecting

    }

}