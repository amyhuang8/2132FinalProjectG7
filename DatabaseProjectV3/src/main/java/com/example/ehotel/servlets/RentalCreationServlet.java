package com.example.ehotel.servlets;

import com.example.ehotel.connections.CustomerServer;
import com.example.ehotel.connections.RentalServer;
import com.example.ehotel.connections.RoomServer;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.text.ParseException;
import java.util.Date;
import java.text.SimpleDateFormat;

@WebServlet(name = "roomCreationServlet", value = "/room-creation-servlet")
public class RentalCreationServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        doPost(req, resp);
    }
    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        // VARIABLE DECLARATION: new session
        HttpSession session = req.getSession();

        int id = Integer.parseInt(req.getParameter("rental id"));
        int bookingID = Integer.parseInt(req.getParameter("booking id"));
        Date checkOut = null;
        try {
            checkOut = new SimpleDateFormat("dd/MM/yyyy").parse(req.getParameter("check out date"));
            int roomID = Integer.parseInt(req.getParameter("room id"));
            int employeeID = Integer.parseInt(req.getParameter("check in date"));
            String customerEmail = req.getParameter("customer email");
            // VARIABLE DECLARATION: new connection
            RentalServer con = new RentalServer();

            // PROCESS: inserting new rental to database
            con.createRental(checkOut,customerEmail,roomID,employeeID); //success
        } catch (ParseException e) {
            //TODO Exception Error Message
        }



        /*
        else { //failure
            resp.setStatus(400); //setting error status
            req.setAttribute("status", "CREG-DB-400"); //setting error status attribute
            req.setAttribute("heading", "REGISTRATION ERROR"); //setting heading attribute
            req.setAttribute("error_msg", "An account with either this email or SIN already exists. " +
                    "Please return to the previous page, and try again."); //setting error msg attribute
            req.getRequestDispatcher("ErrorPage.jsp").forward(req, resp); //forwarding response attributes to error page
            resp.sendRedirect("ErrorPage.jsp"); //redirecting to error page
            //TODO ??
        }

         */



    }
}
