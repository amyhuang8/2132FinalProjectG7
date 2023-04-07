<%@ page import="com.example.ehotel.entities.Booking" %>
<%@ page import="java.util.ArrayList" %>

<!--NOT STORING CACHE-->
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
    response.setDateHeader("Expires", 0); // Proxies.
%>

<%
    // VARIABLE DECLARATION: retrieving ArrayList of bookings from servlet
    ArrayList<Booking> bookings = (ArrayList<Booking>) request.getAttribute("bookings");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Language" content="ch-cn">
        <link rel ="stylesheet" href="css/styles.css">

        <!--TITLE-->
        <title>Pending Bookings</title>

        <!--HEADER BUTTONS-->
        <button id="profile_button" class="header-buttons"
                onclick="window.location.href='EmployeeProfile.jsp'"
                style="float: left; border-radius: 50%;
                background-image: url('css/resources/profileicon.png');"></button>

        <form action="logout-servlet">
            <button type="submit" id="logout_button" class="header-buttons"
                    style="float: right; border-radius: 30%;
                background-image: url('css/resources/logouticon.png');"></button>
        </form>

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
        <h1>Pending Bookings</h1>
        <hr style="background-color: rosybrown; height: 1.5px">
        <br>

        <form action="booking-servlet">
            <!--BUTTON FOR DISPLAY-->
            <button class="buttons" type="submit">DISPLAY TODAY'S BOOKINGS</button>

            <br><br>

            <!--TABLE FOR PENDING BOOKINGS-->
            <table border="1" >
                <!--TABLE HEADERS-->
                <thead>
                    <tr>
                        <th>Booking ID</th>
                        <th>Check In Date</th>
                        <th>Check Out Date</th>
                        <th>Confirmation Date</th>
                        <th>Customer ID</th>
                        <th>Room ID</th>
                    </tr>
                </thead>

                <!--TABLE ROWS-->
                <tbody>
                    <%
                        if ( bookings != null && !bookings.isEmpty()) { // not null and not empty

                            // PROCESS: looping through arraylist
                            for (Booking booking : bookings) {
                    %>
                        <tr>
                            <td><%=booking.getId()%></td>
                            <td><%=booking.getCheckIn()%></td>
                            <td><%=booking.getCheckOut()%></td>
                            <td><%=booking.getConfirmationDate()%></td>
                            <td><%=booking.getCustomerID()%></td>
                            <td><%=booking.getRoomNum()%></td>
                        </tr>
                    <%
                            }
                        }
                    %>
                </tbody>
            </table>
        </form>
    </body>
</html>