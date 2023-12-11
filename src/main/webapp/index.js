
document.addEventListener('DOMContentLoaded', function () {
    const menuIcon = document.getElementById('menu-icon');
    const menuItems = document.querySelectorAll('.navbar a');
    const checkPackagesButton = document.querySelector('.btn-box .btn');

    // Adding click event listener to menu items
    menuItems.forEach(item => {
        item.addEventListener('click', function () {
            resetActiveClasses();
            item.classList.add('active');
        });
    });

    // Adding click event listener to "Check Packages" button
    checkPackagesButton.addEventListener('click', function () {
        const packagesSection = document.getElementById('packages');
        packagesSection.scrollIntoView({ behavior: 'smooth' });
    });

    // Function to reset active classes on menu items
    function resetActiveClasses() {
        menuItems.forEach(item => {
            item.classList.remove('active');
        });
    }
});
