function closestParentListItem(element) {
    while (element) {
        var tagName = element.tagName;
        if (tagName === "LI") {
            return element;
        } else {
            element = element.parentElement;
        }
    }
    return null;
}

var selections = document.getElementsByClassName("selection");
var selectionCount;

for (selectionCount = 0; selectionCount < selections.length; selectionCount++) {
    selections[selectionCount].addEventListener("click", function() {
        closestParentListItem(this).querySelector(".hide-list").classList.toggle("show-list");
        this.classList.toggle("open-selection");
    });
}
