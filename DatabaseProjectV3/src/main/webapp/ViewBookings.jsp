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
        <link rel ="stylesheet" href="css/view-bookings.css">

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

            /**
             * BOOKINGS DISPLAY: This function displays all the bookings for today's date.
             */
            function displayBookings() {
                // VARIABLE DECLARATION
                let bookingsBox = document.getElementById("bookingsBox");
                let form = document.getElementById("display_bookings");

                bookingsBox.style.backgroundColor = "lightsalmon"; //updating background style
                form.submit(); //submitting form
                form.style.display = "block";
            }

            /**
             * AVAILABLE ROOMS DISPLAY: This function displays all the available rooms in
             * the employee's hotel.
             */
            function displayRooms() {
                // VARIABLE DECLARATION
                let bookingsBox = document.getElementById("bookingsBox");
                let form = document.getElementById("display_bookings");

                bookingsBox.style.backgroundColor = "lightcoral"; //updating background style
                form.style.display = "none";
            }
        </script>
    </head>

    <body onload="checkLogin()">
        <!--HEADING-->
        <h1>Pending Bookings</h1>
        <hr style="background-color: rosybrown; height: 1.5px">
        <br>

        <div class="container">
            <div class="box-container">
                <div class="buttons-wrapper">
                    <div class="button-box">
                        <button id="bookingsButton" class="buttons"
                                style="background-color: lightsalmon; color: black; border: none"
                                onclick="displayBookings()">Bookings</button>
                    </div>
                    <div class="button-box-2">
                        <button id="availableButton" class="buttons"
                                style="background-color: lightcoral; color: black; border: none"
                                onclick="displayRooms()">Available Rooms</button>
                    </div>
                </div>
                <div class="box box-1" id="bookingsBox">
                    <form id="display_bookings" action="booking-servlet" style="font-size: 1em">
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
                                    <td><button class="buttons" style="padding: 0px">FILL RENTAL FORM</button></td>
                                </tr>
                                <%
                                        }
                                    }
                                %>
                            </tbody>
                        </table>
                    </form>
                </div>
            </div>
            <div class="box box-2" id="rentalBox">
                <form style="padding: 15px">
                    <label class="labels" for="fname">FIRST NAME: </label>
                    <input class="labels" type="text" id="fname" name="first name">
                    <br><br>
                    <label class="labels" for="lname">LAST NAME: </label>
                    <input class="labels" type="text" id="lname" name="last name">
                    <br><br>
                    <label class="labels" for="email">EMAIL: </label>
                    <input class="labels" type="email" id="email" name="email">
                    <br><br>
                    <label class="labels" for="room_id">ROOM ID: </label>
                    <input class="labels" type="number" id="room_id" name="room id">
                    <br><br>
                    <label class="labels" for="check_in_date">CHECK-IN DATE: </label>
                    <input class="labels" type="date" id="check_in_date" name="check in date">
                    <br><br>
                    <label class="labels" for="check_out_date">CHECK-OUT DATE: </label>
                    <input class="labels" type="date" id="check_out_date" name="check out date">
                    <br><br>
                    <button class="buttons" id="rentalButton" type="submit">Create Rental</button>
                </form>
            </div>
        </div>

        <script>
            // Get references to the button elements
            const bookingsButton = document.getElementById("bookingsButton");
            const availableButton = document.getElementById("availableButton");
            const bookingsBox = document.getElementById("bookingsBox");
            const rentalBox = document.getElementById("rentalBox");

            const rentalButton = document.getElementById("rentalButton");
            const fName = document.getElementById("fName");
            const lName = document.getElementById("lName");
            const sin = document.getElementById("sin");
            const email = document.getElementById("email");
            const roomID = document.getElementById("roomID");
            const chkIn = document.getElementById("chkIn");
            const chkOut = document.getElementById("chkOut");

            rentalButton.addEventListener("click", function () {
                //query for email in customers
                //if no match then create account
                //if no Name / SIN then error
                //create rental (Servlet??)
            })
        </script>
    </body>
</html>