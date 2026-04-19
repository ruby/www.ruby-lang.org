// Header Navigation functionality
(function() {
  'use strict';

  // Mobile menu toggle
  const mobileMenuToggle = document.getElementById('mobile-menu-toggle');
  const mobileMenu = document.getElementById('mobile-menu');

  if (mobileMenuToggle && mobileMenu) {
    mobileMenuToggle.addEventListener('click', function() {
      mobileMenu.classList.toggle('hidden');

      // Toggle icon between menu and close
      const icon = this.querySelector('.material-icons');
      if (icon) {
        icon.textContent = mobileMenu.classList.contains('hidden') ? 'menu' : 'close';
      }
    });
  }

  // Mobile navigation accordion toggles
  const mobileNavToggles = document.querySelectorAll('.mobile-nav-toggle');

  mobileNavToggles.forEach(function(toggle) {
    toggle.addEventListener('click', function(e) {
      e.stopPropagation();

      const submenu = this.nextElementSibling;
      if (submenu && submenu.classList.contains('mobile-nav-submenu')) {
        submenu.classList.toggle('hidden');

        // Rotate the expand icon
        const icon = this.querySelector('.material-icons');
        if (icon && icon.textContent === 'expand_more') {
          icon.style.transform = submenu.classList.contains('hidden') ? 'rotate(0deg)' : 'rotate(180deg)';
        }
      }
    });
  });

  // Close mobile menu when clicking outside
  document.addEventListener('click', function(e) {
    if (mobileMenu && !mobileMenu.classList.contains('hidden')) {
      const isClickInsideMenu = mobileMenu.contains(e.target);
      const isClickOnToggle = mobileMenuToggle && mobileMenuToggle.contains(e.target);

      if (!isClickInsideMenu && !isClickOnToggle) {
        mobileMenu.classList.add('hidden');
        const icon = mobileMenuToggle.querySelector('.material-icons');
        if (icon) {
          icon.textContent = 'menu';
        }
      }
    }
  });

  // Close mobile menu on Escape key
  document.addEventListener('keydown', function(e) {
    if (e.key === 'Escape' && mobileMenu && !mobileMenu.classList.contains('hidden')) {
      mobileMenu.classList.add('hidden');
      const icon = mobileMenuToggle.querySelector('.material-icons');
      if (icon) {
        icon.textContent = 'menu';
      }
    }
  });
})();
