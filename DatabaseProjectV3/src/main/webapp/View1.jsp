<%--
  Created by IntelliJ IDEA.
  User: kkris
  Date: 4/5/2023
  Time: 7:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<html>
<head>
    <title>Rooms Available Per City</title>
    <link rel="stylesheet" href="css/styles.css">
  <!-- HEADER BUTTONS-->
  <!-- GOES BACK BUTTON-->
  <button type="button" id="home_button" class="header-buttons"
          style="float: left; border-radius: 30%;
            background-image: url('css/resources/backicon.png')"
          onclick=history.back();></button>

  <!-- LOGOUT BUTTON -->
  <form action="logout-servlet">
    <button type="submit" id="logout_button" class="header-buttons"
            style="float: right; border-radius: 30%; margin-left: 2vh;
                    background-image: url('css/resources/logouticon.png');"></button>
  </form>
</head>
<body>

<!--HEADING-->
<h1 style="margin-top: 30px">Rooms Available In Each City!</h1>
<hr style="background-color: rosybrown; height: 1.5px">
<br>

<!-- TABLE (VIEW 1) -->
<table for="view_1" border=" 1" style="margin: 0px auto; background: lightyellow">
  <tr style="text-align: center">
    <th>Number of Rooms Currently Available</th>
    <th>Area (City)</th>
  </tr>

  <%
    ArrayList<String> numOfRooms = (ArrayList<String>) request.getAttribute("numOfRooms");
    int count = 0;
    for (String rooms : numOfRooms) {
      if (count % 2 == 0) {
        // start a new row
  %>
  <tr style="text-align: center">
    <% }
      // add a new column
    %>
    <td><%= rooms %></td>
    <%
      if (count % 2 == 1) {
        // close the row
    %>
  </tr>
  <% }
    count++;
  }
    // close the last row if there is an odd number of elements
    if (count % 2 == 1) { %>
  <td></td></tr>
  <% }
  %>
</table>
</body>
</html>