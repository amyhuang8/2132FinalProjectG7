package com.example.ehotel.servlets;

import java.io.*;
import java.sql.SQLException;

import com.example.ehotel.connections.ConnectionDB;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "customerRegistrationServlet", value = "/customer-registration-servlet")

public class CustomerRegistrationServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        //doPost(req, resp);
    }

    //@Override
    /*public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        // TODO Auto-generated method stub
        HttpSession session = req.getSession();
//		employee account = new employee();
        String custSSN = req.getParameter("custSSN");
        String custName = req.getParameter("custName");
        String custPwd = req.getParameter("custPwd");

        String[] param = new String[] {custSSN,custName,custPwd};

        PostgreSqlConn con = new PostgreSqlConn();
        boolean pwdfromdb = con.insertNewCustomer(param);

        System.out.println(pwdfromdb);

        if (pwdfromdb) {
            System.out.println("success");

            ArrayList<Room> bookedRooms = con.getbookedRooms(custSSN);

            ArrayList<Room> allRooms = con.getAllAvailRooms();

            System.out.println(allRooms);

            req.setAttribute("CustName", custName);
            req.setAttribute("bookedRooms", bookedRooms);
            req.setAttribute("allRooms", allRooms);

            req.getRequestDispatcher("booking.jsp").forward(req, resp);
            return;
        }
        resp.sendRedirect("register_failure.jsp");
        return;
    }*/

}