<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Language" content="ch-cn">
        <link rel="stylesheet" href="css/styles.css">
        <link rel="stylesheet" href="css/viewrooms.css">
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
    <button id="logout_button" class="header-buttons"
            onclick="window.location.href='index.jsp'"
            style="float: right; border-radius: 30%;
                background-image: url('css/resources/logouticon.png');"></button>
    </head>
        <!--TITLE-->
        <title>eHotels Room Search</title>

<body>
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

    <!--CAPACITY DROPDOWN MENU-->
    <div class="capacity">
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
    <div class="view_type">
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
    <div class="price-range-slider">
        <br>
        <div class="prices">
            <small>Price / night:</small>
            <small>$100 - $750+</small>
        </div>
        <br><br>
        <div class="range-slider">
            <input type="range" class="min-price" value="200" min="10" max="750" step="10">
            <input type="range" class="max-price" value="375" min="10" max="750" step="10">
        </div>
        <br><br>
    </div>
    </form>
</body>

</html>