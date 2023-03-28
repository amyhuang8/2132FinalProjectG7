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

    </body>
</html>