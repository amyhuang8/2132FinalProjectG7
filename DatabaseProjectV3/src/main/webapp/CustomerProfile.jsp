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
        <link rel = "stylesheet" href="css/styles.css">
        <link rel = "stylesheet" href="css/user-profile.css">

        <!--TITLE-->
        <title>Customer Profile</title>

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

        <!--SCRIPT CODE-->
        <script>
            /** PROFILE CHANGES VALIDATION:
             * This function checks for null input in all the forms and validates every form,
             * based on database constraints. It returns a boolean for this check. */
            function validateProfileSave() {
                // VARIABLE DECLARATION: login vars
                let fName = document.getElementById("fname");
                let lName = document.getElementById("lname");
                let email = document.getElementById("email");
                let phoneNum = document.getElementById("phone_num");
                let street = document.getElementById("street_address");
                let sin = document.getElementById("sin");
                let ccNum = document.getElementById("cc_num");

                // PROCESS: checking for null registration forms
                if(fName.value === "" || lName.value === "" || email.value === ""
                    || phoneNum.value === "" || street.value === ""
                    || sin.value === "" || ccNum.value === "") { //has null
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

                    // PROCESS: validating email
                    if (!/^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/.test(email.value)) { //invalid chars
                        alert("Please enter a valid email address!") //error-handling

                        // OUTPUT
                        return false;
                    }

                    // PROCESS: validating phone number
                    if (isNaN(phoneNum.value) || phoneNum.value.length !== 10) { //contains invalid chars
                        alert("Please enter a valid phone number (10 digits)!") //error-handling

                        // OUTPUT
                        return false;
                    }

                    // PROCESS: validating address
                    if (street.value.length > 50) { //too long
                        alert("Please enter a valid street address (50 characters max)!") //error-handling

                        // OUTPUT
                        return false;
                    }

                    // PROCESS: validating SIN
                    if (isNaN(sin.value) || sin.value.length !== 9) { //invalid chars or length
                        alert("Please enter a valid SIN (9 digits)!") //error-handling

                        // OUTPUT
                        return false;
                    }

                    // PROCESS: validating credit card
                    if (isNaN(ccNum.value) || ccNum.value.length !== 16) { //invalid chars or length
                        alert("Please enter a valid credit card number (16 digits)!") //error-handling

                        // OUTPUT
                        return false;
                    }
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
        <!--HEADINGS-->
        <h1>Customer Profile</h1>
        <hr style="background-color: rosybrown; height: 1.5px">

        <!--INFORMATION FORMS-->
        <form method="post" action="customer-update-profile-servlet" id="profileForms"
              style="font-size: 20px; text-align: center; display: block">
            <label class="labels" for="fname">FIRST NAME: </label>
            <input class="labels" type="text" id="fname" name="first name" value='<%= session.getAttribute("fname") %>'>
            <br><br>
            <label class="labels" for="lname">LAST NAME: </label>
            <input class="labels" type="text" id="lname" name="last name" value='<%= session.getAttribute("lname") %>'>
            <br><br>
            <label class="labels" for="email">EMAIL: </label>
            <input class="labels" type="email" id="email" name="email" value=${sessionScope.email}>
            <br><br>
            <label class="labels" for="phone_num">PHONE NUMBER: </label>
            <input class="labels" type="tel" id="phone_num" name="phone number" value=${sessionScope.phone_num}>
            <br><br>
            <label class="labels" for="street_address">STREET ADDRESS: </label>
            <input class="labels" type="text" id="street_address" name="street address"
                   value='<%= session.getAttribute("street_address") %>'>
            <br><br>
            <label class="labels" for="city">CITY: </label>
            <select name="city" id="city" style="font-size: 18px">
                <option value='<%= session.getAttribute("city") %>'><%= session.getAttribute("city") %></option>
                <option value="Calgary">Calgary</option>
                <option value="Cancun">Cancun</option>
                <option value="Chihuahua City">Chihuahua City</option>
                <option value="Columbus">Columbus</option>
                <option value="Gatineau">Gatineau</option>
                <option value="Mexico City">Mexico City</option>
                <option value="Milwaukee">Milwaukee</option>
                <option value="Montreal">Montreal</option>
                <option value="New York City">New York City</option>
                <option value="Ottawa">Ottawa</option>
                <option value="Tijuana">Tijuana</option>
                <option value="Toronto">Toronto</option>
                <option value="Volcano">Volcano</option>
                <option value="Winnipeg">Winnipeg</option>
                <option value="Vancouver">Vancouver</option>
            </select>
            <br><br>
            <label class="labels" for="province_state">PROVINCE/STATE: </label>
            <select name="province-state" id="province_state" style="font-size: 18px">
                <option value='<%= session.getAttribute("province_state") %>'><%= session.getAttribute("province_state") %></option>
                <option value="Alberta">Alberta</option>
                <option value="Baja California">Baja California</option>
                <option value="British Columbia">British Columbia</option>
                <option value="Chihuahua">Chihuahua</option>
                <option value="Hawaii">Hawaii</option>
                <option value="Manitoba">Manitoba</option>
                <option value="Mexico City">Mexico City</option>
                <option value="New York">New York</option>
                <option value="Ohio">Ohio</option>
                <option value="Ontario">Ontario</option>
                <option value="Quebec">Quebec</option>
                <option value="Wisconsin">Wisconsin</option>
            </select>
            <br><br>
            <label class="labels" for="country">COUNTRY: </label>
            <select name="country" id="country" style="font-size: 18px">
                <option value='<%= session.getAttribute("country") %>'><%= session.getAttribute("country") %></option>
                <option value="Canada">Canada</option>
                <option value="Mexico">Mexico</option>
                <option value="United States of America">United States of America</option>
            </select>
            <br><br>
            <label class="labels" for="sin">SOCIAL SECURITY NUMBER (SIN): </label>
            <input class="labels" type="password" id="sin" name="sin" value=${sessionScope.sin}>
            <br><br>
            <label class="labels" for="cc_num">CREDIT CARD NUMBER: </label>
            <input class="labels" type="text" id="cc_num" name="credit card number" value=${sessionScope.cc_num}>
            <br><br>

            <!--BUTTONS-->
            <button type="submit" class="buttons" value="save-changes" style="margin-right: 2px"
                    onclick="return validateProfileSave()">SAVE CHANGES</button>
            <button type="reset" class="buttons" value="reset"
                    style="margin-left: 2px">RESET CHANGES</button>
        </form>

        <!--SAVED CHANGES SNACKBAR-->
        <div id="changes_snackbar">All changes saved!</div>

    </body>
</html>