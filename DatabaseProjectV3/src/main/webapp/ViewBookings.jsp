<%@ page import="com.example.ehotel.entities.Booking" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="com.example.ehotel.entities.Room" %>

<!--NOT STORING CACHE-->
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
    response.setDateHeader("Expires", 0); // Proxies.
%>

<%
    // VARIABLE DECLARATION: retrieving ArrayList of bookings from servlet
    ArrayList<Booking> bookings = (ArrayList<Booking>) request.getAttribute("bookings");
    ArrayList<Room> availableRooms = (ArrayList<Room>) request.getAttribute("availableRooms");
    String displayBookings = (String) request.getAttribute("displayBookings");
    String displayRooms = (String) request.getAttribute("displayRooms");

    // PROCESS: setting displayBookings to block if null or displayRooms to block if null
    if (displayRooms == null || displayBookings.equals("block")) {
    displayRooms = "none";
    displayBookings = "block";
    }
    if (displayBookings == null || displayRooms.equals("block")) {
    displayBookings = "none";
    displayRooms = "block";
    }
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

    </head>

    <body onload="checkLogin()">
        <!--HEADING-->
        <h1>Pending Bookings</h1>
        <hr style="background-color: rosybrown; height: 1.5px">
        <br>

        <!--VIEW 1 BUTTON-->
        <form action="show-view1-servlet" id="view-1-form" style="display: inline">
            <button class="buttons" id="view-1" type="submit" name="view-1">View All Currently Available Rooms In Any Area</button>
        </form>

        <!-- VIEW 2 BUTTON -->
        <form action="show-view2-servlet" id="view-2-form" method="post" style="display: inline">
            <!--VIEW 2 BUTTON-->
            <button class="buttons" id="view-2" type="submit" name="view-1">View Capacity of All Rooms in Hotel</button>
            <br><br>
        </form>

        <div class="container">
            <div class="box-container">
                <div class="buttons-wrapper">

                    <!-- CURRENT BOOKINGS BOX -->
                    <div class="button-box">
                        <button id="bookingsButton" class="buttons"
                                style="background-color: lightsalmon; border: none"
                                onclick="displayBookings()">Bookings</button>
                    </div>

                    <!-- AVAILABLE ROOMS BOX -->
                    <div class="button-box-2">
                        <button id="availableButton" class="buttons"
                                style="background-color: lightcoral; border: none"
                                onclick="displayRooms()">Available Rooms</button>
                    </div>
                </div>

                <!-- AVAILABLE ROOMS BOX TABLE -->


                <!-- BOOKINGS BOX TABLE -->
                <div class="box box-1" id="bookingsBox">
                    <form action="show-rooms-servlet" method="get" id="display_rooms" style="display: <%=displayRooms%>; background: lightcoral">
                        <table border="1" style="font-size: 20px">
                            <!--TABLE HEADERS-->
                            <thead>
                                <tr>
                                    <th>Room Number</th>
                                    <th>Amenities</th>
                                    <th>View Type</th>
                                    <th>Capacity</th>
                                    <th>Extendable?</th>
                                    <th>Price</th>
                                    <th>Damages</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    if (availableRooms != null && !availableRooms.isEmpty()) { //not null and not empty

                                        // PROCESS: looping through arraylist
                                        for (Room room : availableRooms) {
                                %>
                                <tr style="text-align: center">
                                    <td><%=room.getRoomNumber()%></td>
                                    <td><%=room.getAmenities()%></td>
                                    <td><%=room.getViewType()%></td>
                                    <td><%=room.getCapacity()%></td>
                                    <td><%=room.isExtendable()%></td>
                                    <td>$ <%=room.getPrice()%></td>
                                    <td>-$ <%=room.getDamages()%></td>
                                </tr>
                                <%
                                        }
                                    }
                                %>
                            </tbody>
                        </table>
                    </form>


                    <!-- BOOKINGS BOX TABLE -->
                    <form id="display_bookings" action="booking-servlet" style="display: <%=displayBookings%>">
                        <!--TABLE FOR PENDING BOOKINGS-->
                        <table border="1" style="font-size: 20px">
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
                                    if (bookings != null && !bookings.isEmpty()) { //not null and not empty

                                        // PROCESS: looping through arraylist
                                        for (Booking booking : bookings) {
                                %>
                                <tr>
                                    <td><%=booking.getId()%></td>
                                    <td><%=booking.getCheckIn()%></td>
                                    <td><%=booking.getCheckOut()%></td>
                                    <td><%=booking.getConfirmationDate()%></td>
                                    <td><%=booking.getEmail()%></td>
                                    <td><%=booking.getRoomNum()%></td>
                                    <td><button class="buttons" type="button"
                                                style="padding: 2px; background-color: indianred"
                                                onclick="fillForms('<%=booking.getId()%>',
                                                    '<%=booking.getEmail()%>',
                                                    '<%=booking.getRoomNum()%>',
                                                    '<%=booking.getCheckIn()%>',
                                                    '<%=booking.getCheckOut()%>')">FILL RENTAL FORM</button></td>
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

            <!-- RENTAL FORM BOX -->
            <div class="box box-2" id="rentalBox">
                <form style="padding: 15px">
                    <label class="labels" for="booking_id">BOOKING ID: </label>
                    <input class="labels" type="number" id="booking_id"
                           style="cursor: not-allowed" name="booking id"
                           disabled placeholder="N/A">
                    <br><br>
                    <label class="labels" for="employee_id">EMPLOYEE ID: </label>
                    <input class="labels" type="number" id="employee_id"
                           style="cursor: not-allowed" name="booking id"
                           disabled value=${sessionScope.uid}>
                    <br><br>
                    <label class="labels" for="customer_email">CUSTOMER EMAIL: </label>
                    <input class="labels" type="email" id="customer_email" name="email">
                    <br><br>
                    <label class="labels" for="cc_num">CREDIT CARD #: </label>
                    <input class="labels" type="text" id="cc_num" name="credit card number"
                           style="display: inline-block">
                    <br><br>
                    <label class="labels" for="room_id">ROOM ID: </label>
                    <input class="labels" type="number" id="room_id" name="room id" min="1">
                    <br><br>
                    <label class="labels" for="check_in_date">CHECK-IN DATE: </label>
                    <input class="labels" type="date" id="check_in_date" name="check in date"
                           min="<%=LocalDate.now()%>">
                    <br><br>
                    <label class="labels" for="check_out_date">CHECK-OUT DATE: </label>
                    <input class="labels" type="date" id="check_out_date" name="check out date"
                           min="<%=LocalDate.now()%>">
                    <br><br>
                    <button class="buttons" id="reset_button" type="reset" onclick="enableForms()"
                            style="margin-right: 3px">RESET FORMS</button>
                    <button class="buttons" id="rental_button" type="submit"
                            style="margin-left: 3px">CREATE RENTAL</button>
                </form>
            </div>
        </div>

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

                let div = document.getElementById("display_rooms");

                bookingsBox.style.backgroundColor = "lightsalmon"; //updating background style
                form.submit(); //submitting form
                form.style.display = "block"; //displaying booking form
                div.style.display = "none"; //hiding room display
            }

            /**
             * AVAILABLE ROOMS DISPLAY: This function displays all the available rooms in
             * the employee's hotel.
             */
            function displayRooms() {
                // VARIABLE DECLARATION
                let bookingForm = document.getElementById("display_bookings");
                let bookingsBox = document.getElementById("bookingsBox");
                let div = document.getElementById("display_rooms");

                bookingsBox.style.backgroundColor = "lightcoral"; //updating background style
                div.style.display = "block"; //displaying room display
                bookingForm.style.display = "none"; //hiding booking form
                div.submit(); //submitting form

            }

            /**
             * This function sets all the rental forms to the given booking data and disables the
             * input fields.
             * @param booking_id the booking ID
             * @param email the customer email
             * @param ccNum the credit card number
             * @param roomID the room ID
             * @param checkInDate the check-in date
             * @param checkOutDate the check-out date
             */
            function fillForms(booking_id, email, roomID, checkInDate, checkOutDate) {
                // VARIABLE DECLARATION: the forms
                let formBookingID = document.getElementById("booking_id");
                let formEmail = document.getElementById("customer_email");
                let formCcNum = document.getElementById("cc_num");
                let formRoomID = document.getElementById("room_id");
                let formCheckInDate = document.getElementById("check_in_date");
                let formCheckOutDate = document.getElementById("check_out_date");

                // INITIALIZATION: setting form values to booking info
                formBookingID.value = booking_id;
                formEmail.value = email;
                formCcNum.value = 1111111111111111; //placeholder value
                formRoomID.value = roomID;
                formCheckInDate.value = checkInDate;
                formCheckOutDate.value = checkOutDate;

                // PROCESS: disabling all form fields
                formEmail.disabled = true;
                formCcNum.disabled = true;
                formRoomID.disabled = true;
                formCheckInDate.disabled = true;
                formCheckOutDate.disabled = true;

                // PROCESS: changing cursor icon
                formEmail.style.cursor = "not-allowed";
                formCcNum.style.cursor = "not-allowed";
                formRoomID.style.cursor = "not-allowed";
                formCheckInDate.style.cursor = "not-allowed";
                formCheckOutDate.style.cursor = "not-allowed";

                formCcNum.type = "password"; //hiding cc num
            }

            /**
             * This function enables specific input fields in the rental forms.
             */
            function enableForms() {
                // VARIABLE DECLARATION: the forms
                let formEmail = document.getElementById("customer_email");
                let formRoomID = document.getElementById("room_id");
                let formCcNum = document.getElementById("cc_num");
                let formCheckInDate = document.getElementById("check_in_date");
                let formCheckOutDate = document.getElementById("check_out_date");

                // PROCESS: enabling all form fields
                formEmail.disabled = false;
                formRoomID.disabled = false;
                formCcNum.disabled = false;
                formCheckInDate.disabled = false;
                formCheckOutDate.disabled = false;

                // PROCESS: changing cursor icon
                formEmail.style.cursor = "default";
                formRoomID.style.cursor = "default";
                formCcNum.style.cursor = "default";
                formCheckInDate.style.cursor = "default";
                formCheckOutDate.style.cursor = "default";

                formCcNum.type = "text"; //showing cc num
            }

            function createRental() {
                //query for email in customers
                //if no match then create account
                //if no Name / SIN then error
                //create rental (Servlet??)
            }
        </script>
    </body>
</html>