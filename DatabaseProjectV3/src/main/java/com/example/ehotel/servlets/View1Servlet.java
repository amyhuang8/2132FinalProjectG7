package com.example.ehotel.servlets;

import com.example.ehotel.connections.RoomServer;

import java.io.*;
import java.util.*;

import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

@WebServlet(name = "View1Servlet", value = "/show-view1-servlet")
public class View1Servlet extends HttpServlet  {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        doPost(req, resp);
    }

    /**
     * This method takes the data in the rooms_in_area view and displays it in a table
     *
     * @param req the request sent from the JSP file
     * @param resp the response to be sent to the JSP file
     * @throws IOException
     */
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        RoomServer con = new RoomServer(); //new connection

        ArrayList<String> numOfRooms = con.getView1(); //calling the view1 method

        req.setAttribute("numOfRooms", numOfRooms); //setting the attribute
        req.getRequestDispatcher("View1.jsp").forward(req, resp); //forwarding to the view1 page
        resp.sendRedirect("View1.jsp"); //redirecting to the view1 page
    }

}
