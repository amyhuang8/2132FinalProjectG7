<!--SCRIPT CODE-->
/** LOGIN VALIDATION:
 * This function checks for null input in the username and password forms of the login.
 * It returns a boolean for this check. */
function validate() {
    // VARIABLE DECLARATION: login vars
    let username = document.getElementById("uid");
    let password = document.getElementById("upwd");

    // PROCESS: checking for null logins
    if (username.value === "") { //null username
        alert("Employee ID cannot be null!"); //error-handling

        // OUTPUT
        return false;
    } else if (password.value === "") { //null password
        alert("Password cannot be null!"); //error-handling

        // OUTPUT
        return false;
    } else { //non-null login
        if (isNaN(username.value)) {
            alert("Invalid employee ID!"); //error-handling
            return false;
        } else if (isNaN(password.value) || (password.value.length !== 9)) {
            alert("Invalid SIN number (9 digits)!"); //error-handling
            return false;
        }
        // OUTPUT
        return true; // passes validation
    }
}