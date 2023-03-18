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
            /** LOGIN VALIDATION:
             * This function checks for null input in the username and password forms of the login.
             * It returns a boolean for this check. */
            function validate() {
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
            NEW CUSTOMER ID: <input type="text" id="new_uid" name="new user id">
            <br><br>
            NEW PASSWORD: <input type="password" id="new_upwd" name="new password">
            <br><br>

            <!--BUTTONS-->
            <button type="submit" value="register" onclick="return validate();">REGISTER</button>
            <button type="reset" value="reset">RESET</button>
        </form>

        <!--LOGIN FORMS-->
        <form method="post" action="NEXTPAGEHERE" id="loginForms" style="text-align: center; display: none">
            CUSTOMER ID: <input type="text" id="uid" name="user id">
            <br><br>
            PASSWORD: <input type="password" id="upwd" name="password">
            <br><br>

            <!--BUTTONS-->
            <button type="submit" value="submit" onclick="return validate();">LOG IN</button>
            <button type="reset" value="reset">RESET</button>
        </form>
    </body>
</html>