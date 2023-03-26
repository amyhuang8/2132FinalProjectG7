<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Language" content="ch-cn">
        <link rel ="stylesheet" href="css/styles.css">
        <link rel ="stylesheet" href="css/viewrooms.css">

        <!--TITLE-->
        <title>eHotels Home</title>
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
                <input type="text" placeholder="Search Cities..."
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

        <div>
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

            <br><br>

            <!--CAPACITY DROPDOWN MENU-->
            <label for="capacity" class="labels">Capacity:</label>
            <select name="capacity" id="capacity" style="font-size: 18px">
                <option value="default">SELECT...</option>
                <option value="single">Single</option>
                <option value="double">Double</option>
                <option value="triple">Triple</option>
                <option value="joint">Joint</option>
                <option value="queen">Queen</option>
                <option value="king">King</option>
                <option value="deluxe">Deluxe</option>
            </select>
        </div>
    </body>

</html>