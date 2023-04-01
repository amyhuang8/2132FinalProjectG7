<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Language" content="ch-cn">
        <link rel = "stylesheet" href="css/styles.css">
        <link rel = "stylesheet" href="css/user-profile.css">

        <!--TITLE-->
        <title>Employee Profile</title>

        <!--HEADER BUTTONS-->
        <button id="logout_button" class="header-buttons"
                onclick="window.location.href='index.jsp'"
                style="float: right; border-radius: 30%;
                background-image: url('css/resources/logouticon.png');"></button>

        <!--SCRIPT CODE-->
        <script>
            /** PROFILE CHANGES VALIDATION:
             * This function checks for null input in all the forms and validates every form,
             * based on database constraints. It returns a boolean for this check. */
            function validateProfileSave() {
                // VARIABLE DECLARATION: login vars
                let fName = document.getElementById("fname");
                let lName = document.getElementById("lname");
                let phoneNum = document.getElementById("phone_num");
                let street = document.getElementById("street_address");
                let city = document.getElementById("city");
                let province = document.getElementById("province_state");
                let country = document.getElementById("country");
                let sin = document.getElementById("sin");

                // PROCESS: checking for null registration forms
                if(fName.value === "" || lName.value === "" || phoneNum.value === ""
                    || street.value === "" || sin.value === "") { //has null
                    alert("Please fill out all forms!"); //error-handling

                    // OUTPUT
                    return false;
                }
                else { //all filled
                    // PROCESS: validating first name
                    if (!/^[a-zA-Z]/.test(fName.value) || fName.value.length > 25) { //invalid chars or length
                        alert("Please enter a valid first name (25 characters max)!") //error-handling

                        // OUTPUT
                        return false;
                    }

                    // PROCESS: validating last name
                    if (!/^[a-zA-Z]/.test(lName.value) || lName.value.length > 25) { //invalid chars or length
                        alert("Please enter a valid last name (25 characters max)!") //error-handling

                        // OUTPUT
                        return false;
                    }

                    // PROCESS: validating phone number
                    if (isNaN(phoneNum.value)) { //contains invalid chars
                        alert("Please enter a valid phone number (ex: 123-123-1234)!") //error-handling

                        // OUTPUT
                        return false;
                    }

                    // PROCESS: validating address
                    if (street.value.length > 50) { //too long
                        alert("Please enter a valid street address (50 characters max)!") //error-handling

                        // OUTPUT
                        return false;
                    }
                    if (city.options[city.selectedIndex].value === "default") { //invalid selection
                        alert("Please select a city!") //error-handling

                        // OUTPUT
                        return false;
                    }
                    if (province.options[province.selectedIndex].value === "default") { //invalid selection
                        alert("Please select a province!") //error-handling

                        // OUTPUT
                        return false;
                    }
                    if (country.options[country.selectedIndex].value === "default") { //invalid selection
                        alert("Please select a country!") //error-handling

                        // OUTPUT
                        return false;
                    }

                    // PROCESS: validating SIN
                    if (isNaN(sin.value) || sin.value.length !== 9) { //invalid chars or length
                        alert("Please enter a valid SIN (9 digits)!") //error-handling

                        // OUTPUT
                        return false;
                    }

                    // THERE SHOULD BE SOME JAVA CALL HERE WHERE THE DATABASE ACTUALLY UPDATES!!

                    // VARIABLE DECLARATION: save success snackbar
                    let success = document.getElementById("changes_snackbar");

                    success.className = "show"; //updating class name

                    // PROCESS: removing show class from element after 3 secs
                    setTimeout(function() {
                        success.className = success.className.replace("show", "");
                    }, 3000);

                    // OUTPUT
                    return true;
                }
            }
        </script>
    </head>

    <body>
        <!--HEADINGS-->
        <h1>Employee Profile</h1>
        <hr style="background-color: rosybrown; height: 1.5px">

        <!--INFORMATION FORMS-->
        <form method="post" action="SERVLETHERE" id="signUpForms"
              style="font-size: 20px; text-align: center; display: block">
            <label class="labels" for="uid">EMPLOYEE ID: </label>
            <input class="labels" type="text" id="uid" name="user id" value="RETRIEVE EMPLOYEE ID HERE" disabled>
            <br><br>
            <label class="labels" for="fname">FIRST NAME: </label>
            <input class="labels" type="text" id="fname" name="first name" value="RETRIEVE FIRST NAME HERE">
            <br><br>
            <label class="labels" for="lname">LAST NAME: </label>
            <input class="labels" type="text" id="lname" name="last name" value="RETRIEVE LAST NAME HERE">
            <br><br>
            <label class="labels" for="email">EMAIL: </label>
            <input class="labels" type="email" id="email" name="email" value="RETRIEVE EMAIL HERE" disabled>
            <br><br>
            <label class="labels" for="phone_num">PHONE NUMBER: </label>
            <input class="labels" type="tel" id="phone_num" name="phone number"
                   value="RETRIEVE PHONE NUMBER">
            <br><br>
            <label class="labels" for="street_address">STREET ADDRESS: </label>
            <input class="labels" type="text" id="street_address" name="street address"
                   value="RETRIEVE ADDRESS HERE">
            <br><br>
            <label class="labels" for="city">CITY: </label>
            <select name="city" id="city" style="font-size: 18px">
                <option value="RETRIEVE CITY HERE">RETRIEVE CITY HERE</option>
                <option value="calgary">Calgary</option>
                <option value="cancun">Cancun</option>
                <option value="chihuahua-city">Chihuahua City</option>
                <option value="columbus">Columbus</option>
                <option value="gatineau">Gatineau</option>
                <option value="mexico-city">Mexico City</option>
                <option value="milwaukee">Milwaukee</option>
                <option value="montreal">Montreal</option>
                <option value="nyc">New York City</option>
                <option value="ottawa">Ottawa</option>
                <option value="tijuana">Tijuana</option>
                <option value="toronto">Toronto</option>
                <option value="volcano">Volcano</option>
                <option value="winnipeg">Winnipeg</option>
                <option value="vancouver">Vancouver</option>
            </select>
            <br><br>
            <label class="labels" for="province_state">PROVINCE/STATE: </label>
            <select name="province-state" id="province_state" style="font-size: 18px">
                <option value="RETRIEVE PROVINCE/STATE HERE">RETRIEVE PROVINCE/STATE HERE</option>
                <option value="alberta">Alberta</option>
                <option value="baja-california">Baja California</option>
                <option value="british-columbia">British Columbia</option>
                <option value="chihuahua">Chihuahua</option>
                <option value="hawaii">Hawaii</option>
                <option value="mexico-city-province">Mexico City</option>
                <option value="new-york">New York</option>
                <option value="ohio">Ohio</option>
                <option value="ontario">Ontario</option>
                <option value="quebec">Quebec</option>
                <option value="wisconsin">Wisconsin</option>
            </select>
            <br><br>
            <label class="labels" for="country">COUNTRY: </label>
            <select name="country" id="country" style="font-size: 18px">
                <option value="RETRIEVE COUNTRY HERE">RETRIEVE COUNTRY HERE</option>
                <option value="canada">Canada</option>
                <option value="mexico">Mexico</option>
                <option value="usa">United States of America</option>
            </select>
            <br><br>
            <label class="labels" for="sin">SOCIAL SECURITY NUMBER (SIN): </label>
            <input class="labels" type="password" id="sin" name="sin"
                   value="RETRIEVE SIN # HERE" disabled>
            <br><br>

            <!--BUTTONS-->
            <button type="button" class="buttons" value="save-changes" style="margin-right: 2px"
                    onclick="validateProfileSave()">SAVE CHANGES</button>
            <button type="reset" class="buttons" value="reset"
                    style="margin-left: 2px">RESET CHANGES</button>
        </form>

        <!--SAVED CHANGES SNACKBAR-->
        <div id="changes_snackbar">All changes saved!</div>

    </body>
</html>