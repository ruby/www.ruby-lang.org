// Navigation and TOC toggle functionality
(function() {
  'use strict';

  // Navigation toggle
  const navToggle = document.getElementById('nav-toggle');
  const navMobilePanel = document.getElementById('nav-mobile-panel');

  if (navToggle && navMobilePanel) {
    navToggle.addEventListener('click', function() {
      navMobilePanel.classList.toggle('hidden');
    });

    // Use event delegation to handle close button inside the mobile panel
    navMobilePanel.addEventListener('click', function(e) {
      if (e.target.closest('#nav-close-btn')) {
        navMobilePanel.classList.add('hidden');
      }
    });
  }

  // TOC toggle
  const tocToggle = document.getElementById('toc-toggle');
  const tocMobilePanel = document.getElementById('toc-mobile-panel');

  if (tocToggle && tocMobilePanel) {
    tocToggle.addEventListener('click', function() {
      tocMobilePanel.classList.toggle('hidden');
    });

    // Use event delegation to handle close button inside the mobile panel
    tocMobilePanel.addEventListener('click', function(e) {
      if (e.target.closest('#toc-close-btn')) {
        tocMobilePanel.classList.add('hidden');
      }
    });
  }

  // Close on Escape key
  document.addEventListener('keydown', function(e) {
    if (e.key === 'Escape') {
      if (navMobilePanel && !navMobilePanel.classList.contains('hidden')) {
        navMobilePanel.classList.add('hidden');
      }
      if (tocMobilePanel && !tocMobilePanel.classList.contains('hidden')) {
        tocMobilePanel.classList.add('hidden');
      }
    }
  });
})();
