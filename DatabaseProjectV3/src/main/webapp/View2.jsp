<%--
  Created by IntelliJ IDEA.
  User: kkris
  Date: 4/9/2023
  Time: 8:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.ehotel.entities.Room" %>
<%
    ArrayList<Room> capacityOfRooms = (ArrayList<Room>) request.getAttribute("capacityOfRooms");

%>
<html>
<head>
    <title>Capacity of All Rooms In Hotel</title>
  <link rel="stylesheet" href="css/styles.css">
</head>
<body>

<div class="container">
    <div class="row">
        <div class="col-md-12">

            <!--HEADING-->
            <h1 style="margin-top: 30px">Your Results</h1>
            <hr style="background-color: rosybrown; height: 1.5px">
            <br>

            <!-- HEADING MESSAGE -->
            <h2 style="margin-top: 30px">Capacity of All Rooms At <%= capacityOfRooms.get(0).getHotelName() %></h2>
            <h2 style="margin-top: 30px">Located at Hotel: <%= capacityOfRooms.get(0).getAddress() %></h2>

            <!--TABLE-->
            <table class="table table-striped" border="1" style="margin: 0px auto; background: lightyellow">
                <thead>
                <tr>
                    <th>Room Number</th>
                    <th>Capacity</th>
                </tr>
                </thead>
                <tbody>
                <%
                    for (Room room : capacityOfRooms) {
                %>
                <tr style="text-align: center">
                    <td><%= room.getRoomNumber() %></td>
                    <td><%= room.getCapacity() %></td>
                </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
