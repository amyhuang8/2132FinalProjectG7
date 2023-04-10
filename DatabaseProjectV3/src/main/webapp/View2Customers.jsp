<%--
  Created by IntelliJ IDEA.
  User: kkris
  Date: 4/10/2023
  Time: 12:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!-- SET UP -->
    <meta charset="ISO-8859-1">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta http-equiv="Content-Language" content="ch-cn">
    <link rel="stylesheet" href="css/styles.css">
    <title>View Capacity of Hotel</title>
</head>
<body>

<!-- View -->
<div class="for-view-2-search" style="text-align: center">
  <!-- HEADER -->
  <h1 style="margin-top: 30px">Want to View the Capacity of All Rooms in a Specific Hotel?</h1>
  <hr style="background-color: rosybrown; height: 1.5px">
  <h2>Please enter the hotel number that you would wish to view (hotel numbers can be found when you search)</h2>

  <form action="show-view2-servlet" id="view-2-form" method="get">
    <input type="number" id="hotel-num-input" name="hotel-id" min="1" placeholder="Enter Hotel Number...">
    <button class="buttons" id="view-2" type="button" name="view-2" onclick="submitFormForView2()" >View</button>
  </form>
  <br>
</div>

</body>

<!-- SCRIPT -->
<script>
  /**
   * This function will submit the form for view 2
   */
  function submitFormForView2() {
    const hotelNumInput = document.getElementById("hotel-num-input").value;
    if (hotelNumInput === "") {
      alert("Please enter a hotel number");
      return;
    }
    document.getElementById("view-2-form").submit();
  }
</script>

</html>
