<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Language" content="ch-cn">
        <link rel = "stylesheet" href="css/styles.css">

        <!--TITLE-->
        <title>${status}</title>
    </head>

    <body>
        <!--HEADINGS-->
        <h1>${heading}</h1>
        <hr style="background-color: rosybrown; height: 1.5px">
        <br>
        <h2>${error_msg}</h2>
        <br>

        <!--RETURN BUTTON-->
        <form style="text-align: center">
            <button class="buttons" type="button" value="return"
                    style="font-size: 30px" onclick="history.back()">RETURN</button>
        </form>
    </body>
</html>