<!--NOT STORING CACHE-->
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
    response.setDateHeader("Expires", 0); // Proxies.
%>

<!--IMPORTING JAVA PACKAGES-->
<%@ page import="java.time.LocalDate" %>



<!DOCTYPE html>
<html>
<head>
    <!-- SET UP -->
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
</head>

<!-- THE SCREEN -->
<body onload="checkLogin()">
<!--HEADING-->
<h1>Deals from your favourite hotels!</h1>
<hr style="background-color: rosybrown; height: 1.5px">
<br>

<form action="show-view1-servlet" id="view-1-form" style="display: inline">
    <!--VIEW 1 BUTTON-->
    <button class="buttons" id="view-1" type="submit" name="view-1">View All Currently Available Rooms In Any Area</button>
</form>

<button class="buttons" id="view-2" onclick="location.href = 'http://localhost:8080/DatabaseProjectV3/View2Customers.jsp';">View Capacity of Rooms in a Hotel</button>

<br><br>

<form action="show-rooms-servlet" method="POST" id="search-form" style="display: inline">
    <!--HOTEL CHAIN SEARCH BAR-->
    <div class="searchMenu" style="padding-right: 20px">
        <!--SEARCH BUTTON-->
        <button onclick="showDropdown('chainDropdown', 'areaDropdown')"
                class="buttons" id="hotel-chain" type="button" name="hotel chain">HOTEL CHAINS
        </button>

        <!--SEARCH MENU-->
        <div id="chainDropdown" class="dropdown-content">
            <input type="text" placeholder="Search Hotel Chains..."
                   class="dropdown-list" id="chainSearchInput" name="hotel chain"
                   onkeyup="filterSearchInput('chainSearchInput', 'chainDropdown')">

            <!--CHAINS LIST (may need to become buttons to enable SQL querying later)-->
            <a href="#hiltonhotels" onclick="changeButtonNameDropdown('hotel-chain','Hilton Worldwide', 'chainSearchInput')">Hilton Worldwide</a>
            <a href="#omnihotels" onclick="changeButtonNameDropdown('hotel-chain','Omni Hotels & Resorts', 'chainSearchInput')">Omni Hotels & Resorts</a>
            <a href="#fourseasonshotels" onclick="changeButtonNameDropdown('hotel-chain','Four Seasons Hotels & Resorts', 'chainSearchInput')">Four Seasons Hotels & Resorts</a>
            <a href="#shangrilahotels" onclick="changeButtonNameDropdown('hotel-chain','Shangri-La Hotels & Resorts', 'chainSearchInput')">Shangri-La Hotels & Resorts</a>
            <a href="#bestwesternhotels" onclick="changeButtonNameDropdown('hotel-chain','Best Western', 'chainSearchInput')">Best Western</a>
        </div>
    </div>

    <!--AREA SEARCH BAR-->
    <div class="searchMenu">
        <!-- AREA SEARCH BUTTON -->
        <button onclick="showDropdown('areaDropdown', 'chainDropdown')"
                class="buttons" id="hotel-city" type="button">HOTEL LOCATIONS
        </button>

        <!--SEARCH MENU-->
        <div id="areaDropdown" class="dropdown-content">
            <input type="text" placeholder="Search Cities..."
                   class="dropdown-list" id="areaSearchInput" name="location"
                   onkeyup="filterSearchInput('areaSearchInput', 'areaDropdown')">

            <!--CITIES LIST (may need to become buttons to enable SQL querying later)-->
            <a href="#calgaryhotels" onclick="changeButtonNameDropdown('hotel-city','Calgary', 'areaSearchInput')">Calgary</a>
            <a href="#cancunhotels" onclick="changeButtonNameDropdown('hotel-city','Cancun', 'areaSearchInput')">Cancun</a>
            <a href="#chihuahuacityhotels" onclick="changeButtonNameDropdown('hotel-city','Chihuahua City', 'areaSearchInput')">Chihuahua City</a>
            <a href="#columbushotels" onclick="changeButtonNameDropdown('hotel-city','Columbus', 'areaSearchInput')">Columbus</a>
            <a href="#gatineauhotels" onclick="changeButtonNameDropdown('hotel-city','Gatineau', 'areaSearchInput')">Gatineau</a>
            <a href="#mexicocityhotels" onclick="changeButtonNameDropdown('hotel-city','Mexico City', 'areaSearchInput')">Mexico City</a>
            <a href="#milwaukeehotels" onclick="changeButtonNameDropdown('hotel-city','Milwaukee', 'areaSearchInput')">Milwaukee</a>
            <a href="#montrealhotels" onclick="changeButtonNameDropdown('hotel-city','Montreal', 'areaSearchInput')">Montreal</a>
            <a href="#nychotels" onclick="changeButtonNameDropdown('hotel-city','New York City', 'areaSearchInput')">New York City</a>
            <a href="#ottawahotels" onclick="changeButtonNameDropdown('hotel-city','Ottawa', 'areaSearchInput')">Ottawa</a>
            <a href="#tijuanahotels" onclick="changeButtonNameDropdown('hotel-city','Tijuana', 'areaSearchInput')">Tijuana</a>
            <a href="#torontohotels" onclick="changeButtonNameDropdown('hotel-city','Toronto', 'areaSearchInput')">Toronto</a>
            <a href="#volcanohotels" onclick="changeButtonNameDropdown('hotel-city','Volcano', 'areaSearchInput')">Volcano</a>
            <a href="#winnipeghotels" onclick="changeButtonNameDropdown('hotel-city','Winnipeg', 'areaSearchInput')">Winnipeg</a>
        </div>
    </div>

    <br><br><br>

    <!--BOOKING DATE PICKERS-->
    <div class="date-booking">

        <!--START DATE-->
        <label for="checkin" class="labels">Check in:</label>
        <input type="date" id="checkin" name="check in date" min="<%= LocalDate.now() %>" style="font-size: 18px">

        <!--END DATE-->
        <label for="checkout" class="labels" style="padding-left: 20px">Check out:</label>
        <input type="date" id="checkout" name="check out date" min="<%= LocalDate.now() %>" style="font-size: 18px">

        <!-- SEARCH BUTTON -->
        <input type="button" class="buttons" value="SEARCH" id="search-button" style="margin-left: 20px">

    </div>

    <br><br>

    <!--CAPACITY DROPDOWN MENU-->
    <div class="capacity">
        <label for="capacity" class="labels">Capacity:</label>
        <select name="capacity" id="capacity" style="font-size: 18px">
            <option value="default">SELECT...</option>
            <option value="Single">Single</option>
            <option value="Double">Double</option>
            <option value="Triple">Triple</option>
            <option value="Quad">Quad</option>
            <option value="Joint">Joint</option>
        </select>
    </div>

    <!--CATEGORY INPUT -->
    <div class="category">
        <br><br>
        <small>Category:</small>
        <br><br>
        <input type="radio" id="five-stars-and-up" name="category" value=5>
        <span class="fa fa-star checked"></span>
        <span class="fa fa-star checked"></span>
        <span class="fa fa-star checked"></span>
        <span class="fa fa-star checked"></span>
        <span class="fa fa-star checked"></span>
        <br><br>
        <input type="radio" id="four-stars-and-up" name="category" value=4>
        <span class="fa fa-star checked"></span>
        <span class="fa fa-star checked"></span>
        <span class="fa fa-star checked"></span>
        <span class="fa fa-star checked"></span>
        <span class="fa fa-star"></span>
        <small>& up</small>
        <br><br>
        <input type="radio" id="three-stars-and-up" name="category" value=3>
        <span class="fa fa-star checked"></span>
        <span class="fa fa-star checked"></span>
        <span class="fa fa-star checked"></span>
        <span class="fa fa-star"></span>
        <span class="fa fa-star"></span>
        <small>& up</small>
    </div>

    <!-- NUMBER OF ROOMS IN HOTEL INPUT -->
    <div class="num of rooms">
        <br>
        <small>Number of Rooms In Hotel:</small>
        <br><br>
        <input type="radio" id="one-room" name="num of rooms" value=1>
        <small>1+</small>
        <input type="radio" id="two-rooms" name="num of rooms" value=2>
        <small>2+</small>
        <input type="radio" id="three-rooms" name="num of rooms" value=3>
        <small>3+</small>
        <input type="radio" id="four-rooms" name="num of rooms" value=4>
        <small>4+</small>
        <input type="radio" id="five-rooms" name="num of rooms" value=5>
        <small>5+</small>
    </div>

    <!-- MAX PRICE INPUT -->
    <div class="price-range-container">
        <br><br>
        <!-- Output price text -->
        <div class="prices">
            <small>Max price per night:</small>
            <small>$ <span id="max-price"></span></small>
        </div>
        <br>
        <!-- Slider -->
        <input type="range" class="slider" value="150" id="slider-range" name = "price" min="150" max="750" step="1">
        <br><br>
    </div>
</form>
</body>

<!-- JAVASCRIPT -->
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

    const filterLinks = document.querySelectorAll('.filter-link');

    filterLinks.forEach(function(link) {
        link.addEventListener('click', function(event) {
            event.preventDefault();
            const filter = this.getAttribute('data-filter');
            displayFilterSelection(filter);
        });
    });


    function displayFilterSelection(filter) {
        const searchResults = document.getElementById('search-results');
        searchResults.innerHTML = `You selected the "${filter}" filter.`;
    }

    <!-- Max Price Slider -->
    let slider = document.getElementById("slider-range");
    let output = document.getElementById("max-price");
    output.innerHTML = slider.value; // Display the default slider value

    // Update the current slider value (each time you drag the slider handle)
    slider.oninput = function () {
        output.innerHTML = this.value;
    }

</script>
</html>