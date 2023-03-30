package com.example.ehotel.connections;

import java.sql.*;

public class ConnectionDB {

    // VARIABLE DECLARATION: INSTANCE VARS.
    Connection db = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    Statement st = null;

    public void getConn(){

        try {
            Class.forName("org.postgresql.Driver");
            db = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres", "password");
        }
        catch(Exception e) {
            System.out.print("ERROR MSG HERE");
        }

    }

    public void closeDB() {

        try {
            if(rs != null) {
                rs.close();
            }
            if(ps != null) {
                ps.close();
            }
            if(st != null) {
                st.close();
            }
            if(db != null) {
                db.close();
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public int getESINByUser(String id) throws SQLException, ClassNotFoundException {
        Class.forName("org.postgresql.Driver");
        Connection db = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres", "password");
        int SIN = 0;

        try{
            ps = db.prepareStatement("select SIN from ehotels.employee where cast(employee_id as varchar)=?");

            ps.setString(1, id);
            rs = ps.executeQuery();

            while(rs.next()) {
                SIN = Integer.parseInt(rs.getString(1));
            }
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        finally {
            closeDB();
        }

        return SIN;
    }

    public int getCSINByEmail(String email) throws SQLException, ClassNotFoundException {
        Class.forName("org.postgresql.Driver");
        Connection db = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres", "password");

        int SIN = 0;

        try{
            ps = db.prepareStatement("select SIN from ehotels.customer where customer_email=?");

            ps.setString(1, email);
            rs = ps.executeQuery();

            while(rs.next()) {
                SIN = Integer.parseInt(rs.getString(1));
            }
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        finally {
            closeDB();
        }

        return SIN;
    }

    public static void main(String[] args) throws SQLException, ClassNotFoundException {

        // nat's connection
        //Connection db = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres", "3634859648");

        // amy & kristen's connections
        Connection db = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres", "password");

        ConnectionDB con = new ConnectionDB();
        con.getConn();
        int SIN = con.getCSINByEmail("bobthebuilder@email.com");
        System.out.println(SIN);
    }
}
