package com.example.ehotel.servlets;

import com.example.ehotel.connections.HotelServer;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;

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
        HotelServer con = new HotelServer(); //new connection

        ArrayList<String> numOfRooms = con.getView1(); //calling the view1 method

        req.setAttribute("numOfRooms", numOfRooms); //setting the attribute
        req.getRequestDispatcher("View1.jsp").forward(req, resp); //forwarding to the view1 page
        resp.sendRedirect("View1.jsp"); //redirecting to the view1 page
    }
}
