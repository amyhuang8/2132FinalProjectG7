<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Language" content="ch-cn">
        <link rel = "stylesheet" href="css/styles.css">

        <!--TITLE-->
        <title>Employee Login</title>

        <script>
            function validate() {
                <!--VARIABLE DECLARATION: login vars-->
                let username = document.getElementById("uid");
                let password = document.getElementById("upwd");

                <!--PROCESS: checking for null logins-->
                if(username.value == "") { <!--null username-->
                    <!--error-handling-->
                    alert("Employee ID cannot be null!");
                    return false;
                }
                else if(password.value == "") { <!--null password-->
                    <!--error-handling-->
                    alert("Password cannot be null!");
                    return false;
                }
                else { <!--non-null login-->
                    return true;
                }
            }
        </script>
    </head>

    <body>
        <h1>Employee Login</h1>
        <hr style="background-color: rosybrown; height: 1.5px">
        <br>
        <form method="post" action="logintest" style="text-align: center;">
            EMPLOYEE ID: <input type="text" id="uid" name="user id">
            <br><br>
            PASSWORD: <input type="password" id="upwd" name="password">
            <br><br>
            <button type="submit" value="submit" onclick="return validate();">LOG IN</button>
            <button type="reset" value="reset">RESET</button>
        </form>
    </body>
</html>