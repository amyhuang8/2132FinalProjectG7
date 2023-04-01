/** REVEALING AREA DROPDOWN:
 * This function toggles the dropdown list's visibility for the search dropdowns. */
function showDropdown(showName, hideName) {
    // VARIABLE DECLARATION: the dropdown menus
    let shown = document.getElementById(showName);
    let hidden = document.getElementById(hideName);
    if (shown.style.display == "none") { //needs to be shown
        shown.style.display = "block"; //updating dropdown visibility
    }
    else { //needs to be hidden
        shown.style.display = "none"; //updating dropdown visibility
    }
    hidden.style.display = "none"; //updating dropdown visibility of hidden menu
}
/** SEARCH FILTERING:
 * This function filters the search results when the user types by checking for matching
 * text in each of the dropdown options. The list display updates as the user types. */
function filterSearchInput(input, dropdownList) {
    // VARIABLE DECLARATION: user input & cities result list
    let userInput = document.getElementById(input).value.toUpperCase();
    let resultsList = document.getElementById(dropdownList).getElementsByTagName("a");
    // PROCESS: looping through cities list
    for (let i = 0; i < resultsList.length; i++) {
        // VARIABLE DECLARATION: each city
        let txtValue = resultsList[i].textContent || resultsList[i].innerText;
        if (txtValue.toUpperCase().indexOf(userInput) > -1) { //found
            resultsList[i].style.display = ""; //updating display
        }
        else { //not found
            resultsList[i].style.display = "none"; //updating display
        }
    }
}