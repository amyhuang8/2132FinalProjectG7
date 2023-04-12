<%@ page import="com.example.ehotel.entities.Room" %>
<%@ page import="java.util.ArrayList" %>
<%--
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
    <link rel="stylesheet" href="css/search-results.css">
    <script src="js/search-results.js"></script>

    <!-- TITLE -->
    <title>Search Results</title>

    <!-- HEADER BUTTONS-->
    <!-- HOME BUTTON-->
    <form action="index.jsp">
        <button type="submit" id="home_button" class="header-buttons"
                style="float: left; border-radius: 30%;
                background-image: url('css/resources/homeicon.png');"></button>
    </form>

    <!-- LOGOUT BUTTON -->
    <form action="logout-servlet">
        <button type="submit" id="logout_button" class="header-buttons"
                style="float: right; border-radius: 30%; margin-left: 2vh;
                    background-image: url('css/resources/logouticon.png');"></button>
    </form>

    <!-- PROFILE BUTTON -->
    <button id="profile_button" class="header-buttons"
            onclick="window.location.href='CustomerProfile.jsp'"
            style="float: right; border-radius: 50%;
                    background-image: url('css/resources/profileicon.png');"></button>

    <script>
        /**
         * LOGIN CHECK: This function checks whether the user is still logged in
         * and displays the page normally if so. Otherwise, it takes the user to the homepage.
         */
        function checkLogin() {
            // VARIABLE DECLARATION
            let uid = '<%= session.getAttribute("uid") %>'; //retrieving session user ID

            // PROCESS: checking if id is null
            if (uid === "null") { //no longer logged in
                if (confirm("You have been logged out. Please log in again.")) {
                    window.location.href = 'index.jsp'; //redirecting to homepage
                }
            }
        }
    </script>
</head>

<!-- ENTIRE SCREEN -->
<body onload="checkLogin()">
<!-- HEADER -->
<h1 style="margin-top: 30px">Here are the results of your search!</h1>
<hr style="background-color: rosybrown; height: 1.5px">

<!-- SEARCH RESULTS -->
<div id="results-table" style="margin-top: 30px">
    <table border="1" >
        <!-- TABLE HEADERS -->

        <thead>
        <tr>
            <th>Hotel ID</th>
            <th>Hotel</th>
            <th>Category</th>
            <th>Location</th>
            <th>View Type</th>
            <th>Amenities</th>
            <th>Price</th>
            <th>Extendable?</th>
            <th>Damages (Reduced on Price)</th>
        </tr>
        </thead>

        <!-- FORM -->
        <form action="create-booking-servlet" id="booking-form">
            <tbody>
            <%
                for (Room room : rooms) { %>

            <!-- TABLE ROWS -->
            <tr class="options" onclick="confirmBooking(this)">
                <td>
                    <input type="hidden" name="choice" id="hotel-id" value="<%= room.getHotelID() %>">
                    <%= room.getHotelID() %>
                </td>
                <td>
                    <input type="hidden" name="choice" id="hotel-name" value="<%= room.getHotelName() %>">
                    <%= room.getHotelName() %>
                </td>
                <td>
                    <input type="hidden" name="choice" id="rating"  value="<%= room.getRating() %>">
                    <%=room.getRating()%>
                </td>
                <td>
                    <input type="hidden" name="choice" id="address" value="<%= room.getAddress() %>">
                    <%=room.getAddress()%>
                </td>
                <td>
                    <input type="hidden" name="choice" id="view-type"  value="<%= room.getViewType() %>">
                    <%= room.getViewType() %>
                </td>
                <td>
                    <input type="hidden" name="choice" id="amenities"  value="<%= room.getAmenities() %>">
                    <%= room.getAmenities() %>
                </td>
                <td>
                    <input type="hidden" name="price" id="price" value="<%= room.getPrice() %>">
                    $ <%= room.getPrice() %>
                </td>
                <td>
                    <input type="hidden" name="choice" id="extendable"  value="<%= room.isExtendable() %>">
                    <%= room.isExtendable() %>
                </td>
                <td>
                    <input type="hidden" name="damages" id="damages" value="<%= room.getDamages() %>">
                    -$<%= room.getDamages() %>
                </td>
                <input type="hidden" name="room-id" id="room-id" value="<%= room.getRoomID() %>">
            </tr>
            <%
                } %>
            </tbody>

        </form>

    </table>
</div>
</body>
</html>