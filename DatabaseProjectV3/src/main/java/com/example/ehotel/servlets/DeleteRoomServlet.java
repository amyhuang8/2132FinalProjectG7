package com.example.ehotel.servlets;

import com.example.ehotel.connections.RoomServer;

import java.io.*;

import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

@WebServlet(name = "deleteRoomServlet", value = "/delete-room-servlet")
public class DeleteRoomServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        doPost(req, resp);
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