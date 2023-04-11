<!--SCRIPT CODE-->
/** PROFILE CHANGES VALIDATION:
 * This function checks for null input in all the forms and validates every form,
 * based on database constraints. It returns a boolean for this check. */
function validateProfileSave() {
    // VARIABLE DECLARATION: login vars
    let fName = document.getElementById("fname");
    let lName = document.getElementById("lname");
    let street = document.getElementById("street_address");

    // PROCESS: checking for null registration forms
    if (fName.value === "" || lName.value === "" || street.value === "") { //has null
        alert("Please fill out all forms!"); //error-handling

        // OUTPUT
        return false;
    } else { //all filled
        // PROCESS: validating first name
        if (!/^[a-zA-Z]/.test(fName.value) || fName.value.length > 25) { //invalid chars or length
            alert("Please enter a valid first name (25 characters max)!") //error-handling

            // OUTPUT
            return false;
        }

        // PROCESS: validating last name
        if (!/^[a-zA-Z]/.test(lName.value) || lName.value.length > 25) { //invalid chars or length
            alert("Please enter a valid last name (25 characters max)!") //error-handling

            // OUTPUT
            return false;
        }

        // PROCESS: validating address
        if (street.value.length > 50) { //too long
            alert("Please enter a valid street address (50 characters max)!") //error-handling

            // OUTPUT
            return false;
        }

        // VARIABLE DECLARATION: save success snackbar
        let success = document.getElementById("changes_snackbar");

        success.className = "show"; //updating class name

        // PROCESS: removing show class from element after 3 secs
        setTimeout(function () {
            success.className = success.className.replace("show", "");
        }, 3000);

        // OUTPUT
        return true;
    }
}