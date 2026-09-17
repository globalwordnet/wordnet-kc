const header = document.querySelector('[data-header]');
const menuToggle = document.querySelector('[data-menu-toggle]');
const menu = document.querySelector('[data-menu]');
const navLinks = [...document.querySelectorAll('.nav-link')];

function setMenu(open) {
  if (!menuToggle || !menu) return;

  menuToggle.setAttribute('aria-expanded', String(open));
  menuToggle.setAttribute('aria-label', open ? 'Close navigation' : 'Open navigation');
  menu.classList.toggle('is-open', open);
  document.body.classList.toggle('menu-open', open);
}

if (menuToggle && menu) {
  menuToggle.addEventListener('click', () => {
    setMenu(menuToggle.getAttribute('aria-expanded') !== 'true');
  });

  navLinks.forEach((link) => link.addEventListener('click', () => setMenu(false)));

  document.addEventListener('keydown', (event) => {
    if (event.key === 'Escape' && menuToggle.getAttribute('aria-expanded') === 'true') {
      setMenu(false);
      menuToggle.focus();
    }
  });
}

let scrollFrame;
function updateHeader() {
  if (header) header.classList.toggle('is-scrolled', window.scrollY > 20);
  scrollFrame = null;
}

window.addEventListener('scroll', () => {
  if (!scrollFrame) scrollFrame = requestAnimationFrame(updateHeader);
}, { passive: true });
updateHeader();

const sectionLinks = new Map();
navLinks.forEach((link) => {
  const hash = new URL(link.href, window.location.href).hash;
  if (hash.length > 1) sectionLinks.set(hash.slice(1), link);
});

const trackedSections = [...document.querySelectorAll('section[id]')]
  .filter((section) => sectionLinks.has(section.id));

if ('IntersectionObserver' in window && trackedSections.length) {
  const sectionObserver = new IntersectionObserver((entries) => {
    const visible = entries
      .filter((entry) => entry.isIntersecting)
      .sort((a, b) => b.intersectionRatio - a.intersectionRatio)[0];

    if (!visible) return;

    navLinks.forEach((link) => link.removeAttribute('aria-current'));
    sectionLinks.get(visible.target.id)?.setAttribute('aria-current', 'true');
  }, { rootMargin: '-25% 0px -60% 0px', threshold: [0, 0.1, 0.4] });

  trackedSections.forEach((section) => sectionObserver.observe(section));
}

const revealItems = [...document.querySelectorAll('.reveal')];
const reducedMotion = window.matchMedia('(prefers-reduced-motion: reduce)').matches;

if (!reducedMotion && 'IntersectionObserver' in window) {
  const revealObserver = new IntersectionObserver((entries, observer) => {
    entries.forEach((entry) => {
      if (!entry.isIntersecting) return;
      entry.target.classList.add('is-visible');
      observer.unobserve(entry.target);
    });
  }, { rootMargin: '0px 0px -8% 0px', threshold: 0.08 });

  revealItems.forEach((item, index) => {
    item.classList.add('reveal-ready');
    item.style.transitionDelay = `${Math.min(index % 4, 3) * 70}ms`;
    revealObserver.observe(item);
  });
} else {
  revealItems.forEach((item) => item.classList.add('is-visible'));
}
