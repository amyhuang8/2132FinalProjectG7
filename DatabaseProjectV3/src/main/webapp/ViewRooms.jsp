<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Language" content="ch-cn">
        <link rel ="stylesheet" href="css/styles.css">
        <link rel ="stylesheet" href="css/viewrooms.css">
        <!-- Add icon library -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <!--TITLE-->
        <title>eHotels Room Search</title>
        <button id="profile_button" onclick="window.location.href='CustomerProfile.jsp'"
                style="float: right; padding: 20px; border-radius: 50%; background-color: burlywood;
                background-image: url('css/resources/profileicon.png');
                background-size: contain; background-repeat: no-repeat;"></button>
    </head>

    <script>
        /** REVEALING AREA DROPDOWN:
         * This function toggles the dropdown list's visibility for the search dropdowns. */
        function showDropdown(showName, hideName) {
            // VARIABLE DECLARATION: the dropdown menus
            let shown = document.getElementById(showName);
            let hidden = document.getElementById(hideName);

            if (shown.style.display == "none") { //needs to be shown
                shown.style.display = "block"; //updating dropdown visibility
            }
            else { //needs to be hidden
                shown.style.display = "none"; //updating dropdown visibility
            }

            hidden.style.display = "none"; //updating dropdown visibility of hidden menu
        }

        /** SEARCH FILTERING:
         * This function filters the search results when the user types by checking for matching
         * text in each of the dropdown options. The list display updates as the user types. */
        function filterSearchInput(input, dropdownList) {
            // VARIABLE DECLARATION: user input & cities result list
            let userInput = document.getElementById(input).value.toUpperCase();
            let resultsList = document.getElementById(dropdownList).getElementsByTagName("a");

            // PROCESS: looping through cities list
            for (let i = 0; i < resultsList.length; i++) {
                // VARIABLE DECLARATION: each city
                let txtValue = resultsList[i].textContent || resultsList[i].innerText;

                if (txtValue.toUpperCase().indexOf(userInput) > -1) { //found
                    resultsList[i].style.display = ""; //updating display
                }
                else { //not found
                    resultsList[i].style.display = "none"; //updating display
                }
            }
        }
    </script>

    <body>
        <!--HEADING-->
        <h1>Deals from your favourite hotels!</h1>
        <hr style="background-color: rosybrown; height: 1.5px">
        <br>

        <!--HOTEL CHAIN SEARCH BAR-->
        <div class="searchMenu" style="padding-right: 20px">
            <!--SEARCH BUTTON-->
            <button onclick="showDropdown('chainDropdown', 'areaDropdown')"
                    class="buttons">HOTEL CHAINS</button>

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
                    class="buttons">HOTEL LOCATIONS</button>

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

        <div id = "room_date_booking">
            <!--BOOKING DATE PICKERS-->
            <!--START DATE-->
            <form style="display: inline; padding-right: 20px">
                <label for="checkin" class="labels">Check in:</label>
                <input type="date" id="checkin" name="check in date" style="font-size: 18px">
            </form>

            <!--END DATE-->
            <form action="ACTIONHERE" style="display: inline">
                <label for="checkout" class="labels">Check out:</label>
                <input type="date" id="checkout" name="check out date" style="font-size: 18px">
                <input type="submit" class="buttons" value="SEARCH">
            </form>

        </div>

            <br><br>

        <div id = "room_capacity">
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
        <div id="room_category">
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
        <div id="room_view_type">
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
        <div id="room_max_price">
            <br><br>
            Max Price: <input class="labels" type="text" id="max-price" name="max-price">
        </div>


    </body>

</html>