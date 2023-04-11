/**
 * This function is called when the user clicks on the hotel name in the search results page
 * It will book the room for the user
 */
function confirmBooking(row) {
    const response = confirm("Are you sure you want to make a booking here?");

    console.log(response);

    if (response) {

        // get the hidden inputs
        let price = document.getElementById("price");
        let room_id = document.getElementById("room-id");
        let damages = document.getElementById("damages");

        // get the values of the hidden inputs
        var price_value = row.querySelector("#price").value
        var room_id_value = row.querySelector("#room-id").value
        var damages_value = row.querySelector("#damages").value

        // change the values of the hidden inputs
        price.value = price_value;
        room_id.value = room_id_value;
        damages.value = damages_value;

        // confirmation message
        alert("Booking confirmed!");

        // Redirect to the index page
        document.getElementById("booking-form").submit();
    }
}