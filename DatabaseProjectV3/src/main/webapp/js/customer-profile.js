<!--SCRIPT CODE-->
/** PROFILE CHANGES VALIDATION:
 * This function checks for null input in all the forms and validates every form,
 * based on database constraints. It returns a boolean for this check. */
function validateProfileSave() {
    // VARIABLE DECLARATION: login vars
    let fName = document.getElementById("fname");
    let lName = document.getElementById("lname");
    let email = document.getElementById("email");
    let phoneNum = document.getElementById("phone_num");
    let street = document.getElementById("street_address");
    let sin = document.getElementById("sin");
    let ccNum = document.getElementById("cc_num");

    // PROCESS: checking for null registration forms
    if (fName.value === "" || lName.value === "" || email.value === ""
        || phoneNum.value === "" || street.value === ""
        || sin.value === "" || ccNum.value === "") { //has null
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

        // PROCESS: validating email
        if (!/^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/.test(email.value)) { //invalid chars
            alert("Please enter a valid email address!") //error-handling

            // OUTPUT
            return false;
        }

        // PROCESS: validating phone number
        if (isNaN(phoneNum.value) || phoneNum.value.length !== 10) { //contains invalid chars
            alert("Please enter a valid phone number (10 digits)!") //error-handling

            // OUTPUT
            return false;
        }

        // PROCESS: validating address
        if (street.value.length > 50) { //too long
            alert("Please enter a valid street address (50 characters max)!") //error-handling

            // OUTPUT
            return false;
        }

        // PROCESS: validating SIN
        if (isNaN(sin.value) || sin.value.length !== 9) { //invalid chars or length
            alert("Please enter a valid SIN (9 digits)!") //error-handling

            // OUTPUT
            return false;
        }

        // PROCESS: validating credit card
        if (isNaN(ccNum.value) || ccNum.value.length !== 16) { //invalid chars or length
            alert("Please enter a valid credit card number (16 digits)!") //error-handling

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