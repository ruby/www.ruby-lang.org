// Table of Contents Generator
(function() {
  'use strict';

  // Generate TOC from content headings
  function generateTOC() {
    const content = document.getElementById('content');
    const tocContainers = document.querySelectorAll('.toc-content');

    if (!content || tocContainers.length === 0) return;

    // Find all h2 and h3 headings with IDs
    const headings = content.querySelectorAll('h2[id], h3[id], h4[id], h5[id], h6[id]');

    if (headings.length === 0) {
      // Hide TOC wrappers if no headings found
      document.querySelectorAll('.toc-wrapper').forEach(el => el.style.display = 'none');
      return;
    }

    // Build TOC HTML
    const tocHTML = buildTOCHTML(headings);

    // Insert TOC into all containers
    tocContainers.forEach(container => {
      container.innerHTML = tocHTML;
    });

    // Set up scroll tracking
    setupScrollTracking(headings);
  }

  function buildTOCHTML(headings) {
    const pageLang = document.documentElement.lang;
    let html = '<ul class="space-y-3 text-sm list-disc pl-5 marker:text-stone-400 dark:marker:text-stone-500">';
    let currentLevel = 2;

    headings.forEach(heading => {
      const level = parseInt(heading.tagName.substr(1));
      const text = heading.textContent;
      const id = heading.id;

      // Check for lang attribute on heading or its ancestors
      const lang = heading.getAttribute('lang') || heading.closest('[lang]')?.getAttribute('lang');
      const langAttr = (lang && lang !== pageLang) ? ` lang="${lang}"` : '';

      if (level > currentLevel) {
        html += '<ul class="space-y-3 pl-4 mt-2 list-disc marker:text-stone-400 dark:marker:text-stone-500">';
      } else if (level < currentLevel) {
        html += '</ul>';
      }

      html += `<li class="mb-3"${langAttr}><a href="#${id}" class="toc-link text-stone-700 dark:text-stone-300 no-underline transition-colors" data-heading-id="${id}">${text}</a></li>`;
      currentLevel = level;
    });

    // Close any open ul tags
    while (currentLevel > 2) {
      html += '</ul>';
      currentLevel--;
    }

    html += '</ul>';
    return html;
  }

  // Set up scroll tracking
  function setupScrollTracking(headings) {
    // Convert NodeList to Array for easier manipulation
    const headingsArray = Array.from(headings);

    // Update active heading on scroll
    function updateActiveHeading() {
      // Threshold: top of viewport + small offset (e.g., 100px for header)
      const scrollOffset = 100;

      // Find the heading closest to the top of the viewport
      let activeHeading = null;

      for (let i = headingsArray.length - 1; i >= 0; i--) {
        const heading = headingsArray[i];
        const rect = heading.getBoundingClientRect();

        // Check if heading is above or at the scroll offset
        if (rect.top <= scrollOffset) {
          activeHeading = heading;
          break;
        }
      }

      // If no heading is above the offset, use the first one if it's visible
      if (!activeHeading && headingsArray.length > 0) {
        const firstRect = headingsArray[0].getBoundingClientRect();
        if (firstRect.top > scrollOffset) {
          // We're above the first heading, no active heading
          clearActiveLink();
          return;
        }
      }

      if (activeHeading) {
        setActiveLink(activeHeading.id);
      } else {
        clearActiveLink();
      }
    }

    // Update on scroll with throttling for performance
    let ticking = false;
    window.addEventListener('scroll', function() {
      if (!ticking) {
        window.requestAnimationFrame(function() {
          updateActiveHeading();
          ticking = false;
        });
        ticking = true;
      }
    });

    // Update on page load and hash change
    updateActiveHeading();
    window.addEventListener('hashchange', function() {
      setTimeout(updateActiveHeading, 100);
    });
  }

  // Set active link in TOC
  function setActiveLink(id) {
    // Remove active class from all links first
    document.querySelectorAll('.toc-link').forEach(link => {
      link.classList.remove('toc-active');
    });

    // Add active class to current link
    const links = document.querySelectorAll(`.toc-link[data-heading-id="${id}"]`);
    links.forEach(link => {
      link.classList.add('toc-active');
    });
  }

  // Clear active link
  function clearActiveLink() {
    document.querySelectorAll('.toc-link').forEach(link => {
      link.classList.remove('toc-active');
    });
  }

  // Run on page load
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', generateTOC);
  } else {
    generateTOC();
  }
})();
