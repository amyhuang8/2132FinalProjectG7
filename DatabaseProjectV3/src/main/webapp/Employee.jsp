<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Language" content="ch-cn">
        <link rel = "stylesheet" href="css/styles.css">
        <script src="js/employee-login.js"></script>

        <!--TITLE-->
        <title>Employee Login</title>

    </head>

    <body>
        <!--HEADING-->
        <h1>Employee Login</h1>
        <hr style="background-color: rosybrown; height: 1.5px">
        <br>

        <!--LOGIN FORMS-->
        <form method="post" action="employee-login-servlet" style="font-size: 20px; text-align: center">
            <label class="labels" for="uid">EMPLOYEE ID: </label>
            <input class="labels" type="text" id="uid" name="user id">
            <br><br>
            <label class="labels" for="upwd">PASSWORD (SIN #): </label>
            <input class="labels" type="password" id="upwd" name="password">
            <br><br>

            <!--BUTTONS-->
            <button class="buttons" type="submit" value="submit" style="margin-right: 2px"
                    onclick="return validate()">LOG IN</button>
            <button class="buttons" type="reset" value="reset" style="margin-left: 2px">RESET</button>
        </form>
    </body>
</html>