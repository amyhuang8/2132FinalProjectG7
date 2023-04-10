package com.example.ehotel.servlets;

import com.example.ehotel.connections.CustomerServer;
import com.example.ehotel.connections.RoomServer;
import com.example.ehotel.entities.Room;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.logging.Logger;

@WebServlet(name = "View2Servlet", value = "/show-view2-servlet")
public class View2Servlet extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(CustomerServer.class.getName()); // logger

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        doPost(req, resp);
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
        resp.sendRedirect("View2.jsp");

    }
}
