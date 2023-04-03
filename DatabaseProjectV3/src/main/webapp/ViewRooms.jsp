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
        <link rel="stylesheet" href="css/styles.css">
        <link rel="stylesheet" href="css/view-rooms.css">
        <script src="js/viewrooms.js"></script>
        <!-- Add icon library -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <!--TITLE-->
        <title>eHotels Room Search</title>

        <!--HEADER BUTTONS-->
        <button id="profile_button" class="header-buttons"
                onclick="window.location.href='CustomerProfile.jsp'"
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
        <h1>Deals from your favourite hotels!</h1>
        <hr style="background-color: rosybrown; height: 1.5px">
        <br>

        <!--HOTEL CHAIN SEARCH BAR-->
        <div class="searchMenu" style="padding-right: 20px">
            <!--SEARCH BUTTON-->
            <button onclick="showDropdown('chainDropdown', 'areaDropdown')"
                    class="buttons">HOTEL CHAINS
            </button>

            <!--SEARCH MENU-->
            <div id="chainDropdown" class="dropdown-content">
                <input type="text" placeholder="Search Hotel Chains..."
                       class="dropdown-list" id="chainSearchInput"
                       onkeyup="filterSearchInput('chainSearchInput', 'chainDropdown')">

                <!--CHAINS LIST (may need to become buttons to enable SQL querying later)-->
                <a href="#hiltonhotels">Hilton Worldwide</a>
                <a href="#omnihotels">Omni Hotels & Resorts</a>
                <a href="#fourseasonshotels">Four Seasons Hotels & Resorts</a>
                <a href="#shangrilahotels">Shangri-La Hotels & Resorts</a>
                <a href="#bestwesternhotels">Best Western</a>
            </div>
        </div>

        <!--AREA SEARCH BAR-->
        <div class="searchMenu">
            <!--SEARCH BUTTON-->
            <button onclick="showDropdown('areaDropdown', 'chainDropdown')"
                    class="buttons">HOTEL LOCATIONS
            </button>

            <!--SEARCH MENU-->
            <div id="areaDropdown" class="dropdown-content">
                <input type="text" placeholder="Search Cities..."
                       class="dropdown-list" id="areaSearchInput"
                       onkeyup="filterSearchInput('areaSearchInput', 'areaDropdown')">

                <!--CITIES LIST (may need to become buttons to enable SQL querying later)-->
                <a href="#calgaryhotels">Calgary</a>
                <a href="#cancunhotels">Cancun</a>
                <a href="#chihuahuacityhotels">Chihuahua City</a>
                <a href="#columbushotels">Columbus</a>
                <a href="#gatineauhotels">Gatineau</a>
                <a href="#mexicocityhotels">Mexico City</a>
                <a href="#milwaukeehotels">Milwaukee</a>
                <a href="#montrealhotels">Montreal</a>
                <a href="#nychotels">New York City</a>
                <a href="#ottawahotels">Ottawa</a>
                <a href="#tijuanahotels">Tijuana</a>
                <a href="#torontohotels">Toronto</a>
                <a href="#volcanohotels">Volcano</a>
                <a href="#winnipeghotels">Winnipeg</a>
            </div>
        </div>

        <br><br><br>

        <form action="ACTIONHERE" style="display: inline">
            <!--BOOKING DATE PICKERS-->
            <div class="date-booking">

                <!--START DATE-->
                <label for="checkin" class="labels">Check in:</label>
                <input type="date" id="checkin" name="check in date" style="font-size: 18px">

                <!--END DATE-->
                <label for="checkout" class="labels" style="padding-left: 20px">Check out:</label>
                <input type="date" id="checkout" name="check out date" style="font-size: 18px">
                <input type="submit" class="buttons" value="SEARCH" style="margin-left: 20px">
            </div>

            <br><br>

            <div class="capacity">
                <!--CAPACITY DROPDOWN MENU-->
                <label for="capacity" class="labels">Capacity:</label>
                <select name="capacity" id="capacity" style="font-size: 18px">
                    <option value="default">SELECT...</option>
                    <option value="single">Single</option>
                    <option value="double">Double</option>
                    <option value="triple">Triple</option>
                    <option value="quad">Quad</option>
                    <option value="joint">Joint</option>
                </select>
            </div>

            <!--CATEGORY INPUT -->
            <div class="category">
                <br><br>
                <small>Category:</small>
                <br><br>
                <input type="radio" id="five-stars-and-up" name="category" value="five-stars-and-up">
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star checked"></span>
                <label for="five-stars-and-up" class="labels">& up</label>
                <br><br>
                <input type="radio" id="four-stars-and-up" name="category" value="four-stars-and-up">
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star"></span>
                <label for="four-stars-and-up" class="labels">& up</label>
                <br><br>
                <input type="radio" id="three-stars-and-up" name="category" value="four-stars-and-up">
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star"></span>
                <span class="fa fa-star"></span>
                <label for="three-stars-and-up" class="labels">& up</label>
            </div>

            <!-- VIEW TYPE INPUT -->
            <div class="view-type">
                <br><br>
                <small>View Type:</small>
                <br><br>
                <input type="checkbox" id="city-view" name="city-view" value="city-view">
                <label for="city-view" class="labels">Cityscape View</label>
                <input type="checkbox" id="sea-view" name="sea-view" value="sea-view">
                <label for="sea-view" class="labels">Sea View</label>
                <input type="checkbox" id="mountain-view" name="mountain-view" value="mountain-view">
                <label for="mountain-view" class="labels">Mountain View</label>
                <input type="checkbox" id="river-view" name="river-view" value="river-view">
                <label for="river-view" class="labels">Garden View</label>
                <br><br>
            </div>

            <!-- MAX PRICE INPUT -->
            <div class="price-range-container">
                <br>
                <div class="prices">
                    <small>Price per night:</small>
                    <small>$ <span id="price"></span></small>
                </div>
                <br>
                <input type="range" class="slider" value="100" id="slider-range" min="100" max="750" step="1">
                <br><br>
            </div>

            <!-- JS for price slider -->
            <script>
                let slider = document.getElementById("slider-range");
                let output = document.getElementById("price");
                output.innerHTML = slider.value; // Display the default slider value

                // Update the current slider value (each time you drag the slider handle)
                slider.oninput = function () {
                    output.innerHTML = this.value;
                }
            </script>

        </form>
    </body>
</html>