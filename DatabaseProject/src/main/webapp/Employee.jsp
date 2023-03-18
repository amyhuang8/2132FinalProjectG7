<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Language" content="ch-cn">
        <link rel = "stylesheet" href="css/styles.css">

        <!--TITLE-->
        <title>Employee Login</title>

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
                    alert("Employee ID cannot be null!"); //error-handling

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
        </script>
    </head>

    <body>
        <!--HEADING-->
        <h1>Employee Login</h1>
        <hr style="background-color: rosybrown; height: 1.5px">
        <br>

        <!--LOGIN FORMS-->
        <form method="post" action="" style="text-align: center;">
            EMPLOYEE ID: <input type="text" id="uid" name="user id">
            <br><br>
            PASSWORD: <input type="password" id="upwd" name="password">
            <br><br>

            <!--BUTTONS-->
            <button type="submit" value="submit" onclick="return validate();">LOG IN</button>
            <button type="reset" value="reset">RESET</button>
        </form>
    </body>
</html>