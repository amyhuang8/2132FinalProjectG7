package com.example.ehotel.servlets;

import com.example.ehotel.connections.EmployeeServer;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "deleteHotelServlet", value = "/delete-hotel-servlet")
public class DeleteHotelServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        doPost(req, resp);
    }

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

        // VARIABLE DECLARATION
        HttpSession session = req.getSession(); //getting current session

        EmployeeServer con = new EmployeeServer();

        // PROCESS: deleting hotel
        con.deleteHotel((String) session.getAttribute("hotel_id"));

        session.invalidate(); //logging out

        resp.sendRedirect("Unemployed.jsp"); //redirecting to home page

    }

}
