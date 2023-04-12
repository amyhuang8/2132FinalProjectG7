<%@ page import="com.example.ehotel.entities.Room" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: kkris
  Date: 4/11/2023
  Time: 9:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    ArrayList<Room> allRooms = (ArrayList<Room>) request.getAttribute("allRooms");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta http-equiv="Content-Language" content="ch-cn">
    <link rel ="stylesheet" href="css/styles.css">

    <!-- TITLE -->
    <title>Delete Rooms </title>


    <!-- HEADER BUTTONS-->
    <!-- GOES BACK BUTTON-->
    <form action="ViewBookings.jsp">
        <button type="submit" id="home_button" class="header-buttons"
                style="float: left; border-radius: 30%;
                background-image: url('css/resources/homeicon.png');"></button>
    </form>

    <!-- HEADING -->
    <h1 style="margin-top: 30px">Delete any Room In any Hotel!</h1>
    <hr style="background-color: rosybrown; height: 1.5px">
    <br>

    <!-- Heading Message -->
    <h2 style="margin-top: 30px">Please type in the room ID you want to delete</h2>
    <h2 style="margin-top: 30px">IDs can be found in the table below!</h2>

    <!-- DELETE ROOM FORM -->
    <form action="delete-room-servlet" method="post">
        <label for="roomID">Room ID:</label>
        <input type="number" id="roomID" name="room_id">
        <br>
        <br>
        <input type="submit" value="Delete Room">
    </form>

</head>

<body>
<!--TABLE-->
<table class="table table-striped" border="1" style="margin: 0px auto; background: lightyellow">
    <thead>
    <tr>
        <th>Room ID</th>
        <th>Room Number</th>
        <th>Capacity</th>
        <th>View Type</th>
        <th>Price</th>
    </tr>
    </thead>
    <tbody>
    <%
        for (Room room : allRooms) {
    %>
    <tr style="text-align: center">
        <td><%= room.getRoomID() %></td>
        <td><%= room.getRoomNumber() %></td>
        <td><%= room.getCapacity() %></td>
        <td><%= room.getViewType() %></td>
        <td><%= room.getPrice()%></td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>
</body>
</html>
