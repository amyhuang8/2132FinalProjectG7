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