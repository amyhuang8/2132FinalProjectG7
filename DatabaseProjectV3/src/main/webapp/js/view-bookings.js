/**
 * LOGIN CHECK: This function checks whether the user is still logged in
 * and displays the page normally if so. Otherwise, it takes the user to the homepage.
 */
function checkLogin() {
    // VARIABLE DECLARATION
    let uid = '<%= session.getAttribute("uid") %>'; //retrieving session user ID

    // PROCESS: checking if id is null
    if (uid === "null") { //no longer logged in
        if (confirm("You have been logged out. Please log in again.")) {
            window.location.href = 'index.jsp'; //redirecting to homepage
        }
    }
}

/**
 * BOOKINGS DISPLAY: This function displays all the bookings for today's date.
 */
function displayBookings() {
    // VARIABLE DECLARATION
    let bookingsBox = document.getElementById("bookingsBox");
    let form = document.getElementById("display_bookings");

    bookingsBox.style.backgroundColor = "lightsalmon"; //updating background style
    form.submit(); //submitting form
    form.style.display = "block";
}

/**
 * AVAILABLE ROOMS DISPLAY: This function displays all the available rooms in
 * the employee's hotel.
 */
function displayRooms() {
    // VARIABLE DECLARATION
    let bookingsBox = document.getElementById("bookingsBox");
    let form = document.getElementById("display_bookings");

    bookingsBox.style.backgroundColor = "lightcoral"; //updating background style
    form.style.display = "none";
}

/**
 * This function sets all the rental forms to the given booking data and disables the
 * input fields.
 * @param booking_id the booking ID
 * @param email the customer email
 * @param roomID the room ID
 * @param checkInDate the check-in date
 * @param checkOutDate the check-out date
 */
function fillForms(booking_id, email, roomID, checkInDate, checkOutDate) {
    // VARIABLE DECLARATION: the forms
    let formBookingID = document.getElementById("booking_id");
    let formEmail = document.getElementById("customer_email");
    let formRoomID = document.getElementById("room_id");
    let formCheckInDate = document.getElementById("check_in_date");
    let formCheckOutDate = document.getElementById("check_out_date");

    // INITIALIZATION: setting form values to booking info
    formBookingID.value = booking_id;
    formEmail.value = email;
    formRoomID.value = roomID;
    formCheckInDate.value = checkInDate;
    formCheckOutDate.value = checkOutDate;

    // PROCESS: disabling all form fields
    formEmail.disabled = true;
    formRoomID.disabled = true;
    formCheckInDate.disabled = true;
    formCheckOutDate.disabled = true;

    // PROCESS: changing cursor icon
    formEmail.style.cursor = "not-allowed";
    formRoomID.style.cursor = "not-allowed";
    formCheckInDate.style.cursor = "not-allowed";
    formCheckOutDate.style.cursor = "not-allowed";
}

/**
 * This function enables specific input fields in the rental forms.
 */
function enableForms() {
    // VARIABLE DECLARATION: the forms
    let formEmail = document.getElementById("customer_email");
    let formRoomID = document.getElementById("room_id");
    let formCheckInDate = document.getElementById("check_in_date");
    let formCheckOutDate = document.getElementById("check_out_date");

    // PROCESS: enabling all form fields
    formEmail.disabled = false;
    formRoomID.disabled = false;
    formCheckInDate.disabled = false;
    formCheckOutDate.disabled = false;

    // PROCESS: changing cursor icon
    formEmail.style.cursor = "default";
    formRoomID.style.cursor = "default";
    formCheckInDate.style.cursor = "default";
    formCheckOutDate.style.cursor = "default";
}

function createRental() {
    //query for email in customers
    //if no match then create account
    //if no Name / SIN then error
    //create rental (Servlet??)
}