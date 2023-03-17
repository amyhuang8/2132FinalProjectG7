package ehotel;

import java.sql.*;

public class ConnectionDB {

    public static void main(String[] args) throws SQLException{
        System.out.println("Hello welcome to hell!");

        Connection db = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres", "password");

        if (!db.equals(null)) {
            String query = "SELECT * FROM ehotels.address";
            Statement statement = db.createStatement();
            ResultSet rs = statement.executeQuery(query);
            rs.next();
            System.out.println(rs.getString(1)); // prints out only the city
            rs.next(); // goes to the next tuple
            System.out.println(rs.getString(1));
        }
    }
}
