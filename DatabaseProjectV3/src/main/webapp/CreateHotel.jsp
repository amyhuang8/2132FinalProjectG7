<%--
  Created by IntelliJ IDEA.
  User: Natalie Meigh Colman
  Date: 2023-04-11
  Time: 9:56 p.m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create a hotel!!</title>
</head>
<body>
<!-- RENTAL FORM BOX -->
<div class="box box-2" id="rentalBox">

    <form action="hotel-creation-servlet" style="padding: 15px">
        <label class="labels" for="hotel_name">HOTEL NAME: </label>
        <input class="labels" type="text" id="hotel_name" name="hotel name">
        <br><br>
        <label class="labels" for="number_of_rooms">NUMBER OF ROOMS: </label>
        <input class="labels" type="number" id="number_of_rooms" name="number of rooms">
        <br><br>
        <label class="labels" for="street_address">STREET ADDRESS: </label>
        <input class="labels" type="text" id="street_address" name="street address">
        <br><br>
        <label class="labels" for="city">CITY: </label>
        <input class="labels" type="text" id="city" name="city">
        <br><br>
        <label class="labels" for="province">STATE/PROVINCE: </label>
        <input class="labels" type="text" id="province" name="province">
        <br><br>
        <label class="labels" for="country">COUNTRY: </label>
        <input class="labels" type="text" id="country" name="country">
        <br><br>
        <label class="labels" for="phone">CHECK-OUT DATE: </label>
        <input class="labels" type="date" id="phone" name="check out date"
               min="<%=LocalDate.now()%>">
        <br><br>
        <button class="buttons" id="reset_button" type="reset" onclick="enableForms()"
                style="margin-right: 3px">RESET FORMS</button>
        <button class="buttons" id="rental_button" type="submit"
                onclick="return createRental()"
                style="margin-left: 3px">CREATE RENTAL</button>
    </form>
</div>
</body>
</html>
