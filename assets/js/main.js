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
        link.classList.toggle('active', current !== '' && link.hash === `#${current}`);
    });
}

window.addEventListener('scroll', updateActiveNav, { passive: true });
document.addEventListener('DOMContentLoaded', updateActiveNav);

// Contact Form Handling
const contactForm = document.querySelector('.contact-form form');
if (contactForm) {
    contactForm.addEventListener('submit', function(e) {
        e.preventDefault();
        
        // Get form data
        const formData = new FormData(this);
        const name = formData.get('name');
        const email = formData.get('email');
        const message = formData.get('message');
        
        // Simple validation
        if (!name || !email || !message) {
            alert('Please fill in all fields.');
            return;
        }
        
        // Email validation
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailRegex.test(email)) {
            alert('Please enter a valid email address.');
            return;
        }
        
        // Here you would typically send the form data to your server
        // For now, we'll just show a success message
        alert('Thank you for your message! We will get back to you soon.');
        this.reset();
    });
}
