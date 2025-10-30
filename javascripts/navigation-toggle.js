// Navigation and TOC toggle functionality
(function() {
  'use strict';

  // Navigation toggle
  const navToggle = document.getElementById('nav-toggle');
  const navMobilePanel = document.getElementById('nav-mobile-panel');
  const navChevron = document.getElementById('nav-chevron');
  const navSectionTitle = document.getElementById('nav-section-title');

  if (navToggle && navMobilePanel) {
    // Get the section title from the navigation content
    if (navSectionTitle && navMobilePanel) {
      const titleElement = navMobilePanel.querySelector('h3');
      if (titleElement) {
        navSectionTitle.textContent = titleElement.textContent;
      }
    }

    navToggle.addEventListener('click', function() {
      const isHidden = navMobilePanel.classList.toggle('hidden');

      // Rotate chevron icon
      if (navChevron) {
        if (isHidden) {
          navChevron.style.transform = 'rotate(0deg)';
        } else {
          navChevron.style.transform = 'rotate(180deg)';
        }
      }
    });
  }

  // TOC toggle
  const tocToggle = document.getElementById('toc-toggle');
  const tocMobilePanel = document.getElementById('toc-mobile-panel');
  const tocChevron = document.getElementById('toc-chevron');

  if (tocToggle && tocMobilePanel) {
    tocToggle.addEventListener('click', function() {
      const isHidden = tocMobilePanel.classList.toggle('hidden');

      // Rotate chevron icon
      if (tocChevron) {
        if (isHidden) {
          tocChevron.style.transform = 'rotate(0deg)';
        } else {
          tocChevron.style.transform = 'rotate(180deg)';
        }
      }
    });
  }

  // Close on Escape key
  document.addEventListener('keydown', function(e) {
    if (e.key === 'Escape') {
      if (navMobilePanel && !navMobilePanel.classList.contains('hidden')) {
        navMobilePanel.classList.add('hidden');
        // Reset chevron when closed
        if (navChevron) {
          navChevron.style.transform = 'rotate(0deg)';
        }
      }
      if (tocMobilePanel && !tocMobilePanel.classList.contains('hidden')) {
        tocMobilePanel.classList.add('hidden');
        // Reset chevron when closed
        if (tocChevron) {
          tocChevron.style.transform = 'rotate(0deg)';
        }
      }
    }
  });
})();
