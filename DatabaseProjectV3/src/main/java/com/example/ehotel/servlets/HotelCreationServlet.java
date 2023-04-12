package com.example.ehotel.servlets;

import com.example.ehotel.connections.CustomerServer;
import com.example.ehotel.connections.EmployeeServer;
import com.example.ehotel.connections.RoomServer;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.logging.Logger;

@WebServlet(name = "hotelCreationServlet", value = "/hotel-creation-servlet")
public class HotelCreationServlet {
    private static final Logger LOGGER = Logger.getLogger(SearchResultsServlet.class.getName()); //logger

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        doPost(req, resp);
    }

    /**
     * This method creates a hotel, given all the data a hotel requires
     * @param req the request sent from the JSP file
     * @param resp the response to be sent to the JSP file
     * @throws IOException
     */
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

        // VARIABLE DECLARATION
        HttpSession session = req.getSession();

        String hotelName = req.getParameter("hotel name");
        int roomNum = Integer.parseInt(req.getParameter("number of rooms"));
        String streetAddress = req.getParameter("street address");
        String city = req.getParameter("city");
        String province = req.getParameter("province-state");
        String country = req.getParameter("country");
        int phoneNum = Integer.parseInt(req.getParameter("phone number"));
        String email = req.getParameter("email");
        int rating = Integer.parseInt(req.getParameter("rating"));

        // VARIABLE DECLARATION: new connection
        EmployeeServer con = new EmployeeServer();

        // PROCESS: inserting new hotel to database
        con.createHotel(hotelName,roomNum,streetAddress,city,province,country,email,phoneNum,rating);
    }
}

