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
                let street = document.getElementById("street_address");

                // PROCESS: checking for null registration forms
                if(fName.value === "" || lName.value === "" || street.value === "") { //has null
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

                    // PROCESS: validating address
                    if (street.value.length > 50) { //too long
                        alert("Please enter a valid street address (50 characters max)!") //error-handling

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
        </script>
    </head>

    <body>
        <!--HEADINGS-->
        <h1>Employee Profile</h1>
        <hr style="background-color: rosybrown; height: 1.5px">

        <!--INFORMATION FORMS-->
        <form method="post" action="employee-update-profile-servlet" id="profileForms"
              style="font-size: 20px; text-align: center; display: block">
            <label class="labels" for="manager_id">MANAGER ID: </label>
            <input class="labels" type="text" id="manager_id" name="manager id"
                   disabled style="cursor: not-allowed" value=${sessionScope.manager_id}>
            <br><br>
            <label class="labels" for="uid">EMPLOYEE ID: </label>
            <input class="labels" type="text" id="uid" name="user id"
                   value=${sessionScope.uid} disabled style="cursor: not-allowed">
            <br><br>
            <label class="labels" for="hotel_id">HOTEL ID: </label>
            <input class="labels" type="text" id="hotel_id" name="hotel id"
                   value=${sessionScope.hotel_id} disabled style="cursor: not-allowed">
            <br><br>
            <label class="labels" for="fname">FIRST NAME: </label>
            <input class="labels" type="text" id="fname" name="first name" value=${sessionScope.fname}>
            <br><br>
            <label class="labels" for="lname">LAST NAME: </label>
            <input class="labels" type="text" id="lname" name="last name" value=${sessionScope.lname}>
            <br><br>
            <label class="labels" for="street_address">STREET ADDRESS: </label>
            <input class="labels" type="text" id="street_address" name="street address"
                   value=${sessionScope.street_address}>
            <br><br>
            <label class="labels" for="city">CITY: </label>
            <select name="city" id="city" style="font-size: 18px">
                <option value=${sessionScope.city}>${sessionScope.city}</option>
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
                <option value=${sessionScope.province_state}>${sessionScope.province_state}</option>
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
                <option value=${sessionScope.country}>${sessionScope.country}</option>
                <option value="Canada">Canada</option>
                <option value="Mexico">Mexico</option>
                <option value="United States of America">United States of America</option>
            </select>
            <br><br>
            <label class="labels" for="sin">SOCIAL SECURITY NUMBER (SIN): </label>
            <input class="labels" type="password" id="sin" name="sin"
                   value=${sessionScope.sin} disabled style="cursor: not-allowed">
            <br><br>
            <label class="labels" for="position">POSITION: </label>
            <input class="labels" type="text" id="position" name="position"
                   value=${sessionScope.position} disabled style="cursor: not-allowed">
            <br><br>
            <label class="labels" for="salary">SALARY: </label>
            <input class="labels" type="number" id="salary" name="salary"
                   value=${sessionScope.salary} disabled style="cursor: not-allowed">
            <br><br>

            <!--BUTTONS-->
            <button type="submit" class="buttons" value="save-changes" style="margin-right: 2px"
                    onclick="validateProfileSave()">SAVE CHANGES</button>
            <button type="reset" class="buttons" value="reset"
                    style="margin-left: 2px">RESET CHANGES</button>
        </form>

        <!--SAVED CHANGES SNACKBAR-->
        <div id="changes_snackbar">All changes saved!</div>

    </body>
</html>