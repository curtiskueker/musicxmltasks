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

function toggleSublist(element) {
    if (element == null) return;

    var listElement = closestParentListItem(element).querySelector(".hide-list");
    if (listElement != null) listElement.classList.toggle("show-list");
    element.classList.toggle("open-selection");
}

var selections = document.getElementsByClassName("selection");
var selectionCount;

for (selectionCount = 0; selectionCount < selections.length; selectionCount++) {
    selections[selectionCount].addEventListener("click", function() {
        toggleSublist(this);
    });
}

if(pageNumber != null) {
    var pageParts = pageNumber.split("_");
    while (pageParts.length > 0) {
        var navElementId = pageParts.join("_");
        var navElement = document.getElementById(navElementId);
        toggleSublist(navElement);
        pageParts.pop();
    }
}
