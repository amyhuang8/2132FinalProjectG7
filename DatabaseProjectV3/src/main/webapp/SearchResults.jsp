<%@ page import="com.example.ehotel.entities.Room" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: kkris
  Date: 4/4/2023
  Time: 12:17 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    ArrayList<Room> rooms = (ArrayList<Room>) request.getAttribute("rooms");

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
    <table border="1" >
        <!-- TABLE HEADERS -->

        <thead>
        <tr>
            <th>Hotel</th>
            <th>Category</th>
            <th>Location</th>
            <th>View Type</th>
            <th>Amenities</th>
            <th>Price (CAD)</th>
            <th>Extendable?</th>
            <th>Damages(Reduction on Final Price)</th>
        </tr>
        </thead>

        <tbody>
        <%
            for (Room room : rooms) { %>
        <!-- TABLE ROWS -->
        <tr>
            <td><a href="#clicked"><%= room.getHotelName() %></a></td> <!-- CHANGE THIS TO HOTEL NAME -->
            <td><%=room.getCapacity()%></td> <!-- CHANGE THIS TO HOTEL RATING -->
            <td><%= room.getRoomNumber() %></td> <!-- CHANGE THIS TO ADDRESS OF HOTEL -->
            <td><%= room.getViewType() %></td>
            <td><%= room.getAmenities() %></td>
            <td>$ <%= room.getPrice() %></td>
            <td><%= room.isExtendable() %></td>
            <td>-$<%= room.getDamages() %></td>
        </tr>
        <% } %>
        </tbody>

    </table>
</div>
</body>
</head>
</html>
