<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.ehotel.entities.Archive" %>

<!--NOT STORING CACHE-->
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
    response.setDateHeader("Expires", 0); // Proxies.
%>

<%
    // VARIABLE DECLARATION: retrieving ArrayList of archive entries from servlet
    ArrayList<Archive> archive = (ArrayList<Archive>) request.getAttribute("archive");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Language" content="ch-cn">
        <link rel ="stylesheet" href="css/styles.css">
        <link rel ="stylesheet" href="css/view-bookings.css">

        <!--TITLE-->
        <title>Hotel Archives</title>

        <!-- HEADER BUTTONS-->
        <!--HOME BUTTON-->
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
                onclick="window.location.href='EmployeeProfile.jsp'"
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

    <body onload="checkLogin()">
        <!--HEADING-->
        <h1>Booking/Rental Archive</h1>
        <hr style="background-color: rosybrown; height: 1.5px">
        <br>
        <!-- BOOKINGS BOX TABLE -->
        <table border="1" style="font-size: 20px; margin: 0px auto">
            <!--TABLE HEADERS-->
            <thead>
                <tr>
                    <th>Archive ID</th>
                    <th>Booking/Rental ID</th>
                    <th>Type of Booking</th>
                    <th>Check-in Date</th>
                    <th>Check-out Date</th>
                    <th>Room ID</th>
                    <th>Final Price</th>
                    <th>Customer Email</th>
                    <th>Employee ID</th>
                </tr>
            </thead>
            <tbody>
                <%
                    if (archive != null && !archive.isEmpty()) { //not null and not empty

                        // PROCESS: looping through arraylist
                        for (Archive archiveEntry : archive) {
                %>
                <tr style="text-align: center">
                    <td><%=archiveEntry.getID()%></td>
                    <td><%=archiveEntry.getBookingID()%></td>
                    <td><%=archiveEntry.getBookingType()%></td>
                    <td><%=archiveEntry.getCheckIn()%></td>
                    <td><%=archiveEntry.getCheckOut()%></td>
                    <td><%=archiveEntry.getRoomID()%></td>
                    <td>$<%=archiveEntry.getFinalPrice()%></td>
                    <td><%=archiveEntry.getCustomerEmail()%></td>
                    <td><%=archiveEntry.getEmployeeID()%></td>
                </tr>
                <%
                        }
                    }
                %>
            </tbody>
        </table>
    </body>
</html>