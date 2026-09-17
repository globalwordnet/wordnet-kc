// Temporary password gate for sharing the draft site with colleagues.
// This is NOT real security -- the password below is visible to anyone who
// views this file's source. It only keeps out casual visitors/search engines
// until the site is ready to go public.
//
// To change the password: edit the string below.
// To remove the gate entirely: delete this file and the <!-- Temporary
// password gate --> block (style + script + overlay div) in _layouts/default.html.
(function () {
    var PASSWORD = 'wordnetkc2026';

    var overlay = document.getElementById('gk-overlay');
    var input = document.getElementById('gk-password');
    var button = document.getElementById('gk-submit');
    var error = document.getElementById('gk-error');

    function tryUnlock() {
        if (input.value === PASSWORD) {
            localStorage.setItem('gk_auth', 'ok');
            document.documentElement.classList.remove('gk-locked');
            error.style.display = 'none';
        } else {
            error.style.display = 'block';
        }
    }

    button.addEventListener('click', tryUnlock);
    input.addEventListener('keydown', function (e) {
        if (e.key === 'Enter') tryUnlock();
    });

    if (!document.documentElement.classList.contains('gk-locked')) {
        overlay.style.display = 'none';
    } else {
        input.focus();
    }
})();
