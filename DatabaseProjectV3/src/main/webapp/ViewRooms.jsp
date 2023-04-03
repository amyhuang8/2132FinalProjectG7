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
                    class="buttons" id="hotel-chain">HOTEL CHAINS
            </button>

            <!--SEARCH MENU-->
            <div id="chainDropdown" class="dropdown-content">
                <input type="text" placeholder="Search Hotel Chains..."
                       class="dropdown-list" id="chainSearchInput"
                       onkeyup="filterSearchInput('chainSearchInput', 'chainDropdown')">

                <!--CHAINS LIST (may need to become buttons to enable SQL querying later)-->
                <a href="#hiltonhotels" onclick="changeButtonNameDropdown('hotel-chain','Hilton Worldwide')">Hilton Worldwide</a>
                <a href="#omnihotels" onclick="changeButtonNameDropdown('hotel-chain','Omni Hotels & Resorts')">Omni Hotels & Resorts</a>
                <a href="#fourseasonshotels" onclick="changeButtonNameDropdown('hotel-chain','Four Seasons Hotels & Resorts')">Four Seasons Hotels & Resorts</a>
                <a href="#shangrilahotels" onclick="changeButtonNameDropdown('hotel-chain','Shangri-La Hotels & Resorts')">Shangri-La Hotels & Resorts</a>
                <a href="#bestwesternhotels" onclick="changeButtonNameDropdown('hotel-chain','Best Western')">Best Western</a>
            </div>
        </div>

        <!--AREA SEARCH BAR-->
        <div class="searchMenu">
            <!--SEARCH BUTTON-->
            <button onclick="showDropdown('areaDropdown', 'chainDropdown')"
                    class="buttons" id="hotel-city">HOTEL LOCATIONS
            </button>


            <!--SEARCH MENU-->
            <div id="areaDropdown" class="dropdown-content">
                <input type="text" placeholder="Search Cities..."
                       class="dropdown-list" id="areaSearchInput"
                       onkeyup="filterSearchInput('areaSearchInput', 'areaDropdown')">

                <!--CITIES LIST (may need to become buttons to enable SQL querying later)-->
                <a href="#calgaryhotels" onclick="changeButtonNameDropdown('hotel-city','Calgary')">Calgary</a>
                <a href="#cancunhotels" onclick="changeButtonNameDropdown('hotel-city','Cancun')">Cancun</a>
                <a href="#chihuahuacityhotels" onclick="changeButtonNameDropdown('hotel-city','Chihuahua City')">Chihuahua City</a>
                <a href="#columbushotels" onclick="changeButtonNameDropdown('hotel-city','Columbus')">Columbus</a>
                <a href="#gatineauhotels" onclick="changeButtonNameDropdown('hotel-city','Gatineau')">Gatineau</a>
                <a href="#mexicocityhotels" onclick="changeButtonNameDropdown('hotel-city','Mexico City')">Mexico City</a>
                <a href="#milwaukeehotels" onclick="changeButtonNameDropdown('hotel-city','Milwaukee')">Milwaukee</a>
                <a href="#montrealhotels" onclick="changeButtonNameDropdown('hotel-city','Montreal')">Montreal</a>
                <a href="#nychotels" onclick="changeButtonNameDropdown('hotel-city','New York City')">New York City</a>
                <a href="#ottawahotels" onclick="changeButtonNameDropdown('hotel-city','Ottawa')">Ottawa</a>
                <a href="#tijuanahotels" onclick="changeButtonNameDropdown('hotel-city','Tijuana')">Tijuana</a>
                <a href="#torontohotels" onclick="changeButtonNameDropdown('hotel-city','Toronto')">Toronto</a>
                <a href="#volcanohotels" onclick="changeButtonNameDropdown('hotel-city','Volcano')">Volcano</a>
                <a href="#winnipeghotels" onclick="changeButtonNameDropdown('hotel-city','Winnipeg')">Winnipeg</a>
            </div>
        </div>

        <br><br><br>

        <form action="create-booking-servlet" style="display: inline">
            <!--BOOKING DATE PICKERS-->
            <div class="date-booking">

                <!--START DATE-->
                <label for="checkin" class="labels">Check in:</label>
                <input type="date" id="checkin" name="check in date" style="font-size: 18px">

                <!--END DATE-->
                <label for="checkout" class="labels" style="padding-left: 20px">Check out:</label>
                <input type="date" id="checkout" name="check out date" style="font-size: 18px">

                <!-- SEARCH BUTTON -->
                <input type="submit" class="buttons" value="SEARCH" onclick="checkDate('checkin', 'checkout')" style="margin-left: 20px">
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
                <small>& up</small>
                <br><br>
                <input type="radio" id="four-stars-and-up" name="category" value="four-stars-and-up">
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star"></span>
                <small>& up</small>
                <br><br>
                <input type="radio" id="three-stars-and-up" name="category" value="three-stars-and-up">
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star checked"></span>
                <span class="fa fa-star"></span>
                <span class="fa fa-star"></span>
                <small>& up</small>
            </div>

            <!-- VIEW TYPE INPUT -->
            <div class="view-type">
                <br><br>
                <small>View Type:</small>
                <br><br>
                <input type="checkbox" id="city-view" name="view type" value="city-view">
                <small>Cityscape View</small>
                <input type="checkbox" id="sea-view" name="view type" value="sea-view">
                <small>Sea View</small>
                <input type="checkbox" id="mountain-view" name="view type" value="mountain-view">
                <small>Mountain View</small>
                <input type="checkbox" id="river-view" name="view type" value="river-view">
                <small>Garden View</small>
                <br><br>
            </div>

            <!-- MAX PRICE INPUT -->
            <div class="price-range-container">
                <br>
                <div class="prices">
                    <small>Max price per night:</small>
                    <small>$ <span id="price"></span></small>
                </div>
                <br>
                <input type="range" class="slider" value="100" id="slider-range" name = "price" min="100" max="750" step="1">
                <br><br>
            </div>

            <!-- JavaScript for price slider -->
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