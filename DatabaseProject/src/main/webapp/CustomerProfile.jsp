<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Language" content="ch-cn">
        <link rel = "stylesheet" href="css/styles.css">

        <!--TITLE-->
        <title>Customer Profile</title>

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
                let city = document.getElementById("city");
                let ssn = document.getElementById("ssn");
                let ccNum = document.getElementById("cc_num");
                let pwd = document.getElementById("new_upwd");

                // PROCESS: checking for null registration forms
                if(fName.value == "" || lName.value == "" || email.value == ""
                    || phoneNum.value == "" || street.value == "" || city.value == ""
                    || ssn.value == "" || ccNum.value == "" || pwd.value == "") { //has null
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

                    // PROCESS: validating SSN
                    if (isNaN(ssn.value) || ssn.value.length != 9) { //invalid chars or length
                        alert("Please enter a valid SSN (9 digits)!") //error-handling

                        // OUTPUT
                        return false;
                    }

                    // PROCESS: validating credit card
                    if (isNaN(ccNum.value) || ccNum.value.length != 16) { //invalid chars or length
                        alert("Please enter a valid credit card number (16 digits)!") //error-handling

                        // OUTPUT
                        return false;
                    }

                    // OUTPUT
                    return true;
                }
            }
        </script>
    </head>

    <body>
        <!--HEADINGS-->
        <h1>Customer Profile</h1>
        <hr style="background-color: rosybrown; height: 1.5px">

        <!--INFORMATION FORMS-->
        <form method="post" action="CustomerProfile.jsp" id="signUpForms"
              style="text-align: center; display: block">
            FIRST NAME: <input type="text" id="fname" name="first name"
                               value="RETRIEVE FIRST NAME HERE">
            <br><br>
            LAST NAME: <input type="text" id="lname" name="last name"
                              value="RETRIEVE LAST NAME HERE">
            <br><br>
            EMAIL: <input type="email" id="email" name="email"
                          value="RETRIEVE EMAIL HERE">
            <br><br>
            PHONE NUMBER: <input type="tel" id="phone_num" name="phone number"
                                 value="RETRIEVE PHONE NUMBER">
            <br><br>
            STREET ADDRESS: <input type="text" id="street_address" name="street address"
                                   value="RETRIEVE ADDRESS HERE">
            <br><br>

            <label for="city">CITY: </label>
            <select name="city" id="city">
                <option value="RETRIEVE CITY HERE">RETRIEVE CITY HERE</option>
                <option value="calgary">Calgary</option>
                <option value="cancun">Cancun</option>
                <option value="chihuahuacity">Chihuahua City</option>
                <option value="columbus">Columbus</option>
                <option value="gatineau">Gatineau</option>
                <option value="mexicocity">Mexico City</option>
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
            SOCIAL SECURITY NUMBER (SSN): <input type="password" id="ssn" name="ssn"
                                                 value="RETRIEVE SIN # HERE">
            <br><br>
            CREDIT CARD NUMBER: <input type="text" id="cc_num" name="credit card number"
                                       value="RETRIEVE CARD # HERE">
            <br><br>
            PASSWORD: <input type="password" id="new_upwd" name="new password"
                                        value="RETRIEVE PW HERE">
            <br><br>

            <!--BUTTONS-->
            <button type="submit" value="savechanges"
                    onclick="return validateProfileSave();">SAVE CHANGES</button>
            <button type="reset" value="reset">RESET CHANGES</button>
        </form>

        <!--SAVED CHANGES SNACKBAR-->
        <!--<div id="changes_snackbar">All changes saved!</div>-->

    </body>
</html>