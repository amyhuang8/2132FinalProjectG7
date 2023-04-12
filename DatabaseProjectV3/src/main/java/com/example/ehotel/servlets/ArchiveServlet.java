package com.example.ehotel.servlets;

import com.example.ehotel.connections.ArchiveServer;
import com.example.ehotel.entities.Archive;

import java.io.*;
import java.util.*;

import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

@WebServlet(name = "archiveServlet", value = "/archive-servlet")
public class ArchiveServlet extends HttpServlet  {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        doPost(req, resp);
    }

    /**
     * This method retrieves an arraylist of archive entries and forwards the attribute to
     * the page requested.
     * @param req the request sent from the JSP file
     * @param resp the response to be sent to the JSP file
     * @throws IOException
     */
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

        // VARIABLE DECLARATION
        HttpSession session = req.getSession();
        ArchiveServer con = new ArchiveServer(); //new connection

        // RETRIEVE ALL PENDING BOOKINGS
        ArrayList<Archive> archive = con.getArchive((String) session.getAttribute("hotel_id"));

        // SEND THE DATA TO THE JSP
        req.setAttribute("archive", archive); //sending bookings arraylist
        req.getRequestDispatcher("ViewArchive.jsp").forward(req, resp); //forwarding response

       // resp.sendRedirect("ViewArchive.jsp"); //redirecting

    }

}