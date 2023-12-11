document.addEventListener('DOMContentLoaded', () => {
    const sideLinks = document.querySelectorAll('.sidebar .side-menu li a:not(.logout)');
    const menuBar = document.querySelector('.content nav .bx.bx-menu');
    const searchBtn = document.querySelector('.content nav form .form-input button');
    const searchForm = document.querySelector('.content nav form');

    // Function to show the selected section
    const showSection = (sectionId) => {
        const sections = document.querySelectorAll('.content main');
        sections.forEach(section => {
            section.style.display = 'none';
        });

        const selectedSection = document.getElementById(sectionId);
        if (selectedSection) {
            selectedSection.style.display = 'block';
        }
    };

    // Set the default section to Insights
    showSection('insights');

    // Event listeners for menu items
    sideLinks.forEach(item => {
        item.addEventListener('click', () => {
            sideLinks.forEach(i => i.parentElement.classList.remove('active'));
            item.parentElement.classList.add('active');

            // Extract the target section ID from the href attribute
            const sectionId = item.getAttribute('href').substring(1);
            showSection(sectionId);
        });
    });

    // Event listener for the menu bar
    menuBar.addEventListener('click', () => {
        document.querySelector('.sidebar').classList.toggle('close');
    });

    // Event listener for the search button
    searchBtn.addEventListener('click', (e) => {
        if (window.innerWidth < 576) {
            e.preventDefault();
            searchForm.classList.toggle('show');
        }
    });
});
