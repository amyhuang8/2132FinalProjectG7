package ehotel;

import java.sql.*;

public class ConnectionDB {

    public static void main(String[] args) throws SQLException{

        // nat's connection
        //Connection db = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres", "3634859648");

        // amy's connection
        //Connection db = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "user", "password");

        // kristen's connection
        Connection db = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres", "password");

        if (!db.equals(null)) {
            String query = "SELECT * FROM ehotels.address"; // get the data from the address table in the ehotels schema

            System.out.println("Printing values from address table:");

            Statement statement = db.createStatement();
            ResultSet rs = statement.executeQuery(query);

            // while there are tuples (rows) to read
            while (rs.next()) {
                StringBuilder rowString = new StringBuilder();                      // create a new string
                for (int i = 1; i <= rs.getMetaData().getColumnCount(); i++) {      // loop through all columns in table
                    rowString.append(rs.getString(i));                              // append the value in the column to the current string
                    if (i < rs.getMetaData().getColumnCount()) {
                        rowString.append(", ");                                     // separate the columns
                    }
                }
                System.out.println(rowString.toString());                           // print it
            }
        }
    }
}
