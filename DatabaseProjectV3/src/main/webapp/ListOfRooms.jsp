LIST OF ROOMS JSP

<%@ page import="com.example.ehotel.entities.Room" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.lang.reflect.Array" %><%--
  Created by IntelliJ IDEA.
  User: kkris
  Date: 4/4/2023
  Time: 12:17 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    ArrayList<Room> rooms;

%>


<html>
<head>
    <!-- SET UP -->
    <meta charset="ISO-8859-1">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta http-equiv="Content-Language" content="ch-cn">
    <link rel="stylesheet" href="css/styles.css">

    <!-- TITLE -->
    <title>Search Results</title>

    <!-- ENTIRE SCREEN -->
<body>
<!-- HEADER -->
<h1 style="margin-top: 30px">Here are the results of your search!</h1>
<hr style="background-color: rosybrown; height: 1.5px">

<!-- SEARCH RESULTS -->
<div id="results-table" style="margin-top: 30px">
    <table styles="width: 100%;">
        <!-- TABLE HEADERS -->
        <tr>
            <th>Hotel</th>
            <th>Category</th>
            <th>Location</th>
            <th>View Type</th>
            <th>Amenities</th>
            <th>Price</th>
            <th>Extendable?</th>
        </tr>
        <!-- TABLE ROWS -->
        <tr>
            <td>
                <!-- WILL CHANGE LINK LATER (but will keep a link? that when clicked will create a booking) -->
                <!-- TO DO: ITERATE THROUGH ARRAY LIST CONTAINING THE ROOMS THAT FIT THE FILTER CRITERIA FROM PREVIOUS PAGE -->
                <a href="hotel.html">Hotel 1</a>
            </td>
        </tr>
    </table>
</div>
</body>
</head>
</html>
