<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Language" content="ch-cn">
        <link rel ="stylesheet" href="css/areasearch.css">
        <link rel ="stylesheet" href="css/styles.css">

        <!--TITLE-->
        <title>eHotels Home</title>
    </head>

    <script>
        /* When the user clicks on the button,
        toggle between hiding and showing the dropdown content */
        function myFunction() {
            document.getElementById("areaDropdown").classList.toggle("show");
        }

        function filterFunction() {
            let input, filter, ul, li, a, i;
            input = document.getElementById("areaSearchInput");
            filter = input.value.toUpperCase();
            let div = document.getElementById("areaDropdown");
            a = div.getElementsByTagName("a");
            for (i = 0; i < a.length; i++) {
                let txtValue = a[i].textContent || a[i].innerText;
                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                    a[i].style.display = "";
                } else {
                    a[i].style.display = "none";
                }
            }
        }
    </script>

    <body>
    <!--HEADING-->
    <h1>Deals from your favourite hotels!</h1>
    <hr style="background-color: rosybrown; height: 1.5px">
    <br>

    <!--AREA SEARCH BAR-->
    <div class="areaSearch">
        <button onclick="myFunction()" class="areaSearchBtn">Dropdown</button>
        <div id="areaDropdown" class="dropdown-content">
            <input type="text" placeholder="Search..." id="areaSearchInput" onkeyup="filterFunction()">
            <a href="#calgaryhotels">Calgary</a>
            <a href="#cancunhotels">Cancun</a>
            <a href="#chihuahuacityhotels">Chihuahua City</a>
            <a href="#columbushotels">Columbus</a>
            <a href="#gatineauhotels">Gatineau</a>
            <a href="#mexicocityhotels">Mexico City</a>
            <a href="#milwaukeehotels">Milwaukee</a>
            <a href="#montrealhotels">Montreal</a>
            <a href="#nychotels">New York City</a>
            <a href="#ottawahotels">Ottawa</a>
            <a href="#tijuanahotels">Tijuana</a>
            <a href="#torontohotels">Toronto</a>
            <a href="#volcanohotels">Volcano</a>
            <a href="#winnipeghotels">Winnipeg</a>
        </div>
    </div>



    </body>

</html>