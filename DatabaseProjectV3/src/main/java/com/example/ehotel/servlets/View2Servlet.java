package com.example.ehotel.servlets;

import com.example.ehotel.connections.RoomServer;
import com.example.ehotel.entities.Room;

import java.io.*;
import java.util.*;

import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

@WebServlet(name = "View2Servlet", value = "/show-view2-servlet")
public class View2Servlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

        // new connection
        RoomServer con = new RoomServer();

        // READ THE FORM DATA
        int hotelID = Integer.parseInt(req.getParameter("hotel-id"));

        // set the session attribute
        req.setAttribute("hotel_id", hotelID);

        // get the data from view2
        try {
            ArrayList<Room> capacityOfRooms = con.getView2(hotelID);
            //setting the attribute
            req.setAttribute("capacityOfRooms", capacityOfRooms);

            // forward to the view2 page
            req.setAttribute("capacityOfRooms", capacityOfRooms);
            req.getRequestDispatcher("View2.jsp").forward(req, resp);
            resp.sendRedirect("View2.jsp");
        }
        catch (Exception e) { // failure
            //e.printStackTrace();
            resp.setStatus(401); //setting error status
            req.setAttribute("status", "CLOG-DB-401"); //setting error status attribute
            req.setAttribute("heading", "INPUT ERROR"); //setting heading attribute
            req.setAttribute("error_msg", "The hotel number provided is incorrect. Please return to the previous page, and try again."); //setting error msg attribute
            req.getRequestDispatcher("ErrorPage.jsp").forward(req, resp); //forwarding response attributes to error page
            resp.sendRedirect("ErrorPage.jsp"); //redirecting to error page
        }

    }

    /**
     * This method takes the data in the capacity_of_all_rooms view and displays it in a table
     * @param req the request sent from the JSP file
     * @param resp the response to be sent to the JSP file
     */
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        RoomServer con = new RoomServer(); //new connection

        // get session
        HttpSession session = req.getSession();

        // get the hotel id
        int hotelID = Integer.parseInt((String) session.getAttribute("hotel_id"));

        // get the data from view2
        ArrayList<Room> capacityOfRooms = con.getView2(hotelID);

        //setting the attribute
        req.setAttribute("capacityOfRooms", capacityOfRooms);

        // forward to the view2 page
        req.setAttribute("capacityOfRooms", capacityOfRooms);
        req.getRequestDispatcher("View2.jsp").forward(req, resp);
       // resp.sendRedirect("View2.jsp");

    }

}
