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
             * if the inputted passwords match.
             * It returns a boolean for this check. */
            function validateRegistration() {
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
                let confirmPwd = document.getElementById("confirm_new_upwd");

                // PROCESS: checking for null registration forms
                if(fName.value == "" || lName.value == "" || email.value == ""
                    || phoneNum.value == "" || street.value == "" || city.value == ""
                    || ssn.value == "" || ccNum.value == ""
                    || pwd.value == "" || confirmPwd.value == "") { //has null
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
                    if (city.options[city.selectedIndex].value == "default") { //invalid selection
                        alert("Please select a city!") //error-handling

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

                    // PROCESS: validating password
                    if (pwd.value != confirmPwd.value) {
                        alert("Passwords do not match! Please try again.") //error-handling

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
                    alert("Customer ID cannot be null!"); //error-handling

                    // OUTPUT
                    return false;
                }
                else if(password.value == "") { //null password
                    alert("Password cannot be null!"); //error-handling

                    // OUTPUT
                    return false;
                }
                else { //non-null login
                    // OUTPUT
                    return true;
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
                if (isLogin == true) { //show login
                    if (loginForms.style.display == "none") { //currently hidden
                        loginForms.style.display = "block"; //updating display to visible
                    }

                    if (signUpForms.style.display == "block") { //currently displayed
                        signUpForms.style.display = "none"; //hiding forms
                        signUpForms.reset(); //clearing forms
                    }
                }
                else { //show registration
                    if (signUpForms.style.display == "none") { //currently hidden
                        signUpForms.style.display = "block"; //updating display to visible
                    }

                    if (loginForms.style.display == "block") { //currently displayed
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
            <button style = "font-size: 25px; font-family:'Courier New'" onclick="showForms(false);"}>SIGN UP</button>
        </div>
        <div style="text-align: center;">
            <button style = "font-size: 25px; font-family:'Courier New'" onclick="showForms(true)">LOG IN</button>
        </div>

        <br><br>

        <!--REGISTRATION FORMS-->
        <form method="post" action="NEXTPAGEHERE" id="signUpForms" style="text-align: center; display: none">
            FIRST NAME: <input type="text" id="fname" name="first name">
            <br><br>
            LAST NAME: <input type="text" id="lname" name="last name">
            <br><br>
            EMAIL: <input type="email" id="email" name="email">
            <br><br>
            PHONE NUMBER: <input type="tel" id="phone_num" name="phone number">
            <br><br>
            STREET ADDRESS: <input type="text" id="street_address" name="street address">
            <br><br>
            <label for="city">CITY: </label>

            <select name="city" id="city">
                <option value="default">SELECT...</option>
                <option value="ottawa">Ottawa</option>
                <option value="toronto">Toronto</option>
                <option value="vancouver">Vancouver</option>
                <option value="montreal">Montreal</option>
                <option value="gatineau">Gatineau</option>
                <option value="winnipeg">Winnipeg</option>
                <option value="calgary">Calgary</option>
            </select>
            <br><br>
            SOCIAL SECURITY NUMBER (SSN): <input type="password" id="ssn" name="ssn">
            <br><br>
            CREDIT CARD NUMBER: <input type="text" id="cc_num" name="credit card number">
            <br><br>
            NEW PASSWORD: <input type="password" id="new_upwd" name="new password">
            <br><br>
            CONFIRM NEW PASSWORD: <input type="password" id="confirm_new_upwd" name="new password confirmation">
            <br><br>

            <!--BUTTONS-->
            <button type="submit" value="register" onclick="return validateRegistration();">REGISTER</button>
            <button type="reset" value="reset">RESET</button>
        </form>

        <!--LOGIN FORMS-->
        <form method="post" action="NEXTPAGEHERE" id="loginForms" style="text-align: center; display: none">
            CUSTOMER ID: <input type="text" id="uid" name="user id">
            <br><br>
            PASSWORD: <input type="password" id="upwd" name="password">
            <br><br>

            <!--BUTTONS-->
            <button type="submit" value="submit" onclick="return validateLogin();">LOG IN</button>
            <button type="reset" value="reset">RESET</button>
        </form>
    </body>
</html>