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
 * This function is called when the user clicks on the hotel name in the search results page
 * It will book the room for the user
 */
function confirmBooking(row) {
    const response = confirm("Are you sure you want to make a booking here?");

    console.log(response);

    if (response) {
        var element = row.querySelector("#price")
        alert("Booking confirmed!");
        alert(element.value);
        // Redirect to the index page
        //document.getElementById("booking-form").submit();
    }
}