<!--NOT STORING CACHE-->
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
    response.setDateHeader("Expires", 0); // Proxies.
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Language" content="ch-cn">
        <link rel = "stylesheet" href="css/styles.css">
        <link rel = "stylesheet" href="css/user-profile.css">
        <script src="js/employee-profile.js"></script>

        <!--TITLE-->
        <title>Employee Profile</title>

        <!--HOME BUTTON-->
        <form action="index.jsp">
            <button type="submit" id="home_button" class="header-buttons"
                    style="float: left; border-radius: 30%;
                background-image: url('css/resources/homeicon.png');"></button>
        </form>

        <!-- LOGOUT BUTTON -->
        <form action="logout-servlet">
            <button type="submit" id="logout_button" class="header-buttons"
                    style="float: right; border-radius: 30%; margin-left: 2vh;
                    background-image: url('css/resources/logouticon.png');"></button>
        </form>

    </head>

    <body onload="checkLogin()">
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
            <input class="labels" type="text" id="fname" name="first name" value='<%= session.getAttribute("fname") %>'>
            <br><br>
            <label class="labels" for="lname">LAST NAME: </label>
            <input class="labels" type="text" id="lname" name="last name" value='<%= session.getAttribute("lname") %>'>
            <br><br>
            <label class="labels" for="street_address">STREET ADDRESS: </label>
            <input class="labels" type="text" id="street_address" name="street address"
                   value='<%= session.getAttribute("street_address") %>'>
            <br><br>
            <label class="labels" for="city">CITY: </label>
            <select name="city" id="city" style="font-size: 18px">
                <option value='<%= session.getAttribute("city") %>'><%= session.getAttribute("city") %></option>
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
                <option value='<%= session.getAttribute("province_state") %>'><%= session.getAttribute("province_state") %></option>
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
                <option value='<%= session.getAttribute("country") %>'><%= session.getAttribute("province_state") %></option>
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
                   value='<%= session.getAttribute("position") %>' disabled style="cursor: not-allowed">
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

        <br>
        <hr style="background-color: rosybrown; height: 1.5px">
        <br>

        <form action="delete-hotel-servlet" style="text-align: center" id="delete_hotel">
            <button type="submit" class="buttons" value="delete-hotel"
                    onclick='return confirm("WARNING: THIS IS A FATAL ACTION AND CANNOT BE REVERSED.")'>DELETE HOTEL</button>
        </form>

        <!--SAVED CHANGES SNACKBAR-->
        <div id="changes_snackbar">All changes saved!</div>

    </body>
</html>