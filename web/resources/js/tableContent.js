var contentSections = document.getElementsByClassName("table-content");

var sectionCount;

for (sectionCount = 0; sectionCount < contentSections.length; sectionCount++) {
    var contentSection = contentSections[sectionCount];
    var sectionId = contentSection.id;
    sectionId === includeSection ? contentSection.style.display = "block" : contentSection.style.display = "none";
}
