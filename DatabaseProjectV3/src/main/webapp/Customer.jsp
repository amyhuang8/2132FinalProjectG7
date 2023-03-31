<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Language" content="ch-cn">
        <link rel = "stylesheet" href="css/styles.css">

        <!--TITLE-->
        <title>eHotel Customers</title>

        <!--SCRIPT CODE-->
        <script>
            /** REGISTRATION VALIDATION:
             * This function checks for null input in all the registration forms and checks
             * if the inputted passwords match. It validates every form, based on database constraints.
             * It returns a boolean for this check. */
            function validateRegistration() {
                // VARIABLE DECLARATION: login vars
                let fName = document.getElementById("fname");
                let lName = document.getElementById("lname");
                let email = document.getElementById("email");
                let phoneNum = document.getElementById("phone_num");
                let street = document.getElementById("street_address");
                let city = document.getElementById("city");
                let province = document.getElementById("provincestate");
                let country = document.getElementById("country");
                let ssn = document.getElementById("ssn");
                let ccNum = document.getElementById("cc_num");

                // PROCESS: checking for null registration forms
                if(fName.value === "" || lName.value === "" || email.value === ""
                    || phoneNum.value === "" || street.value === ""
                    || ssn.value === "" || ccNum.value === "") { //has null
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

                    // PROCESS: validating SSN
                    if (isNaN(ssn.value) || ssn.value.length !== 9) { //invalid chars or length
                        alert("Please enter a valid SSN (9 digits)!") //error-handling

                        // OUTPUT
                        return false;
                    }

                    // PROCESS: validating credit card
                    if (isNaN(ccNum.value) || ccNum.value.length !== 16) { //invalid chars or length
                        alert("Please enter a valid credit card number (16 digits)!") //error-handling

                        // OUTPUT
                        return false;
                    }

                    // OUTPUT
                    return true;
                }
            }

            /** LOGIN VALIDATION:
             * This function checks for null input in the username and password forms of the login.
             * It returns a boolean for this check. */
            function validateLogin() {
                // VARIABLE DECLARATION: login vars
                let username = document.getElementById("uid");
                let password = document.getElementById("upwd");

                // PROCESS: checking for null logins
                if(username.value == "") { //null username
                    alert("Customer email cannot be null!"); //error-handling

                    // OUTPUT
                    return false;
                }
                else if(password.value == "") { //null password
                    alert("Password cannot be null!"); //error-handling

                    // OUTPUT
                    return false;
                }
                else { //non-null login
                    if (isNaN(password.value) || (password.value.length != 9)) {
                        alert("Invalid SIN number (9 digits)!"); //error-handling
                        return false;
                    }
                    // OUTPUT
                    return true; // passed all checks
                }
            }

            /** SHOW SIGN-UP/LOGIN:
             * This function determines whether to show the sign-up or login forms, given the
             * isLogin boolean parameter. Then, it updates the site's display accordingly. */
            function showForms(isLogin) {
                // VARIABLE DECLARATION: form vars
                let loginForms = document.getElementById("loginForms");
                let signUpForms = document.getElementById("signUpForms");

                // PROCESS: checking which forms to show
                if (isLogin === true) { //show login
                    if (loginForms.style.display === "none") { //currently hidden
                        loginForms.style.display = "block"; //updating display to visible
                    }

                    if (signUpForms.style.display === "block") { //currently displayed
                        signUpForms.style.display = "none"; //hiding forms
                        signUpForms.reset(); //clearing forms
                    }
                }
                else { //show registration
                    if (signUpForms.style.display === "none") { //currently hidden
                        signUpForms.style.display = "block"; //updating display to visible
                    }

                    if (loginForms.style.display === "block") { //currently displayed
                        loginForms.style.display = "none"; //hiding forms
                        loginForms.reset(); //clearing forms
                    }
                }
            }
        </script>
    </head>

    <body>
        <!--HEADINGS-->
        <h1>Welcome to eHotels!</h1>
        <hr style="background-color: rosybrown; height: 1.5px">
        <h2>As a customer:</h2>

        <!--BUTTONS-->
        <div style="text-align: center; padding-bottom: 20px">
            <button class="buttons" onclick="showForms(false)"
                    style="margin-right: 5px; font-size: 25px">SIGN UP</button>
            <button class="buttons" onclick="showForms(true)"
                    style="margin-left: 5px; font-size: 25px">LOG IN</button>
        </div>

        <br><br>

        <!--REGISTRATION FORMS-->
        <form method="post" action="customer-registration-servlet" id="signUpForms"
              style="font-size: 20px; text-align: center; display: none">
            FIRST NAME: <input class="labels" type="text" id="fname" name="first name">
            <br><br>
            LAST NAME: <input class="labels" type="text" id="lname" name="last name">
            <br><br>
            EMAIL: <input class="labels" type="email" id="email" name="email">
            <br><br>
            PHONE NUMBER: <input class="labels" type="tel" id="phone_num" name="phone number">
            <br><br>
            STREET ADDRESS: <input class="labels" type="text" id="street_address" name="street address">
            <br><br>
            <label class="labels" for="city">CITY: </label>
            <select name="city" id="city" style="font-size: 18px">
                <option value="default">SELECT...</option>
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
            <label class="labels" for="province_state">PROVINCE/STATE: </label>
            <select name="provincestate" id="province_state" style="font-size: 18px">
                <option value="default">SELECT...</option>
                <option value="alberta">Alberta</option>
                <option value="bajacalifornia">Baja California</option>
                <option value="britishcolumbia">British Columbia</option>
                <option value="chihuahua">Chihuahua</option>
                <option value="hawaii">Hawaii</option>
                <option value="mexicocity_city">Mexico City</option>
                <option value="newyork">New York</option>
                <option value="ohio">Ohio</option>
                <option value="ontario">Ontario</option>
                <option value="quebec">Quebec</option>
                <option value="wisconsin">Wisconsin</option>
            </select>
            <br><br>
            <label class="labels" for="country">COUNTRY: </label>
            <select name="country" id="country" style="font-size: 18px">
                <option value="default">SELECT...</option>
                <option value="canada">Canada</option>
                <option value="mexico">Mexico</option>
                <option value="usa">United States of America</option>
            </select>
            <br><br>
            SOCIAL SECURITY NUMBER (SSN): <input class="labels" type="password" id="ssn" name="ssn">
            <br><br>
            CREDIT CARD NUMBER: <input class="labels" type="text" id="cc_num" name="credit card number">
            <br><br>

            <!--BUTTONS-->
            <button type="submit" class="buttons" value="register"
                    style="margin-right: 2px"
                    onclick="return validateRegistration()">REGISTER</button>
            <button type="reset" class="buttons" value="reset" style="margin-left: 2px">RESET</button>
        </form>

        <!--LOGIN FORMS-->
        <form method="post" action="customer-login-servlet" id="loginForms"
              style="font-size: 20px; text-align: center; display: none">
            CUSTOMER EMAIL: <input class="labels" type="text" id="uid" name="email">
            <br><br>
            PASSWORD (SIN #): <input class="labels" type="password" id="upwd" name="password">
            <br><br>

            <!--BUTTONS-->
            <button type="submit" class="buttons" value="submit" style="margin-right: 2px"
                    onclick="return validateLogin()">LOG IN</button>
            <button type="reset" class="buttons" value="reset" style="margin-left: 2px">RESET</button>
        </form>
    </body>
</html>