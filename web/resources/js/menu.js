var selections = document.getElementsByClassName("selection");
var selectionCount;

for (selectionCount = 0; selectionCount < selections.length; selectionCount++) {
    selections[selectionCount].addEventListener("click", function() {
        this.classList.toggle("open-selection");
    });
}
