<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Language" content="ch-cn">
        <link rel = "stylesheet" href="css/styles.css">
        <script src="js/customer.js"></script>

        <!--TITLE-->
        <title>eHotel Customers</title>

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
            <label class="labels" for="fname">FIRST NAME: </label>
            <input class="labels" type="text" id="fname" name="first name">
            <br><br>
            <label class="labels" for="lname">LAST NAME: </label>
            <input class="labels" type="text" id="lname" name="last name">
            <br><br>
            <label class="labels" for="email">EMAIL: </label>
            <input class="labels" type="email" id="email" name="email">
            <br><br>
            <label class="labels" for="phone_num">PHONE NUMBER: </label>
            <input class="labels" type="tel" id="phone_num" name="phone number">
            <br><br>
            <label class="labels" for="street_address">STREET ADDRESS: </label>
            <input class="labels" type="text" id="street_address" name="street address">
            <br><br>
            <label class="labels" for="city">CITY: </label>
            <select name="city" id="city" style="font-size: 18px">
                <option value="default">SELECT CITY...</option>
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
                <option value="default">SELECT PROVINCE/STATE...</option>
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
                <option value="default">SELECT COUNTRY...</option>
                <option value="Canada">Canada</option>
                <option value="Mexico">Mexico</option>
                <option value="United States of America">United States of America</option>
            </select>
            <br><br>
            <label class="labels" for="sin">SOCIAL SECURITY NUMBER (SIN): </label>
            <input class="labels" type="password" id="sin" name="sin">
            <br><br>
            <label class="labels" for="cc_num">CREDIT CARD NUMBER: </label>
            <input class="labels" type="text" id="cc_num" name="credit card number">
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
            <label class="labels" for="uid">CUSTOMER EMAIL: </label>
            <input class="labels" type="text" id="uid" name="email">
            <br><br>
            <label class="labels" for="upwd">PASSWORD (SIN #): </label>
            <input class="labels" type="password" id="upwd" name="password">
            <br><br>

            <!--BUTTONS-->
            <button type="submit" class="buttons" value="submit" style="margin-right: 2px"
                    onclick="return validateLogin()">LOG IN</button>
            <button type="reset" class="buttons" value="reset" style="margin-left: 2px">RESET</button>
        </form>
    </body>
</html>