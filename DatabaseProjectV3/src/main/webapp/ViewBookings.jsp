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
    ArrayList<Room> rooms = (ArrayList<Room>) request.getAttribute("rooms");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Language" content="ch-cn">
        <link rel ="stylesheet" href="css/styles.css">
        <link rel ="stylesheet" href="css/view-bookings.css">
        <script src="js/view-bookings.js"></script>

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
                                style="background-color: lightsalmon; border: none"
                                onclick="displayBookings()">Bookings</button>
                    </div>
                    <div class="button-box-2">
                        <button id="availableButton" class="buttons"
                                style="background-color: lightcoral; border: none"
                                onclick="displayRooms()">Available Rooms</button>
                    </div>
                </div>
                <div class="box box-1" id="bookingsBox">
                    <form id="display_bookings" action="booking-servlet">
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
                    <form id="display_rooms" action="room-servlet">
                        <!--TABLE FOR AVAILABLE ROOMS-->
                        <table border="1" style="font-size: 20px">
                            <!--TABLE HEADERS-->
                            <thead>
                            <tr>
                                <th>Room ID</th>
                                <th>Room Number</th>
                                <th>Next Booking Start</th>
                                <th>Price</th>
                                <th>Amenities</th>
                                <th>Capacity</th>
                                <th>Extendable</th>
                                <th>Damages</th>
                            </tr>
                            </thead>

                            <!--TABLE ROWS-->
                            <tbody>
                            <%
                                for (Room room : rooms) {
                            %>
                            <tr>
                                <td><%=room.getRoomID()%></td>
                                <td><%=room.getRoomNumber()%></td>
                                <td><%=room.getNextBooking()%></td>
                                <td><%=room.getPrice()%></td>
                                <td><%=room.getAmenities()%></td>
                                <td><%=room.getCapacity()%></td>
                                <td><%=room.isExtendable()%></td>
                                <td><%=room.getDamages()%></td>
                                <td><button class="buttons" type="button"
                                            style="padding: 2px; background-color: indianred"
                                            onclick="fillForms('<%=room.getRoomID()%>')">FILL RENTAL FORM</button></td>
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
                    <button class="buttons" id="rental_button" type="submit" action="rental-creation-servlet"
                            style="margin-left: 3px">CREATE RENTAL</button>
                </form>
            </div>
        </div>
    </body>
</html>