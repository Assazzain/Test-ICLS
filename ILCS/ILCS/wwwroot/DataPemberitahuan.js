function showSection(sectionId) {
    var sections = document.querySelectorAll('.section');
    sections.forEach(function (section) {
        section.style.display = 'none';
    });

    var sectionToShow = document.getElementById(sectionId);
    if (sectionToShow) {
        sectionToShow.style.display = 'block';
    }
}

document.addEventListener('DOMContentLoaded', function () {
    showSection('section1');
});