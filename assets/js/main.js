// Mobile Navigation Toggle
document.addEventListener('DOMContentLoaded', function() {
    const mobileMenu = document.getElementById('mobile-menu');
    const navMenu = document.getElementById('nav-menu');

    if (mobileMenu && navMenu) {
        const setOpen = open => {
            navMenu.classList.toggle('active', open);
            mobileMenu.setAttribute('aria-expanded', String(open));
        };

        mobileMenu.addEventListener('click', () => {
            setOpen(!navMenu.classList.contains('active'));
        });

        // Close mobile menu when clicking on a link
        navMenu.querySelectorAll('.nav-link').forEach(link => {
            link.addEventListener('click', () => setOpen(false));
        });
    }
});

// Navigation Active State on Scroll
function updateActiveNav() {
    const offset = 100;
    let current = '';

    document.querySelectorAll('section[id]').forEach(section => {
        const rect = section.getBoundingClientRect();
        if (rect.top <= offset && rect.bottom > offset) {
            current = section.id;
        }
    });

    document.querySelectorAll('.nav-link').forEach(link => {
        if (link.pathname !== window.location.pathname || !link.hash) {
            return;
        }
        link.classList.toggle('active', current !== '' && link.hash === `#${current}`);
    });
}

window.addEventListener('scroll', updateActiveNav, { passive: true });
document.addEventListener('DOMContentLoaded', updateActiveNav);
