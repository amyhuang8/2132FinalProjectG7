<!--NOT STORING CACHE-->
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
    response.setDateHeader("Expires", 0); // Proxies.
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

        <style>
            body {
                margin: 1vh;
                padding: 0;
            }
            .container {
                display: flex;
                height: 75vh;
                align-items: flex-end;
            }
            .box-container {
                display: flex;
                flex-direction: column;
                justify-content: space-between;
                flex: 1;
                height: 100%;
            }
            .buttons-wrapper {
                display: inline-block;
            }
            .button-box {
                background-color: red;
                padding: 5px;
                display: inline-block;
            }
            .button-box-2 {
                background-color: darkred;
                padding: 5px;
                display: inline-block;
            }
            .buttons-wrapper .button-box:not(:last-child) {
                margin-left: 3vh;
            }
            .buttons button {
                margin-right: 2vh;
            }
            .box {
                height: 100%;
                flex:1;
            }
            .box-1 {
                height: 95%;
                background-color: red;
                margin-right: 4vh;
                margin-left: 3vh;
            }
            .box-2 {
                background-color: blue;
                margin-right: 3vh;
            }
        </style>
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
                        <button id="bookingsButton">Bookings</button>
                    </div>
                    <div class="button-box-2">
                        <button id="availableButton">Available Rooms</button>
                    </div>
                </div>
                <div class="box box-1" id="bookingsBox"></div>
            </div>
            <div class="box box-2" id="rentalBox"></div>
        </div>
    </body>

    <script>
        // Get references to the button elements
        const bookingsButton = document.getElementById("bookingsButton");
        const availableButton = document.getElementById("availableButton");
        const bookingsBox = document.getElementById("bookingsBox");
        const rentalBox = document.getElementById("rentalBox");

        // Add event listeners to the button elements
        bookingsButton.addEventListener("click", function() {
            bookingsBox.style.backgroundColor = "red";
        });

        availableButton.addEventListener("click", function() {
            bookingsBox.style.backgroundColor = "darkred";
        });
    </script>
</html>