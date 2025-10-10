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
      // Hide TOC if no headings found
      document.querySelectorAll('[id*="toc"]').forEach(el => el.style.display = 'none');
      return;
    }

    // Build TOC HTML
    const tocHTML = buildTOCHTML(headings);

    // Insert TOC into all containers
    tocContainers.forEach(container => {
      container.innerHTML = tocHTML;
    });
  }

  function buildTOCHTML(headings) {
    let html = '<ul class="space-y-2 text-sm list-none pl-0">';
    let currentLevel = 2;

    headings.forEach(heading => {
      const level = parseInt(heading.tagName.substr(1));
      const text = heading.textContent;
      const id = heading.id;

      if (level > currentLevel) {
        html += '<ul class="pl-4 mt-1">';
      } else if (level < currentLevel) {
        html += '</ul>';
      }

      html += `<li class="mb-1"><a href="#${id}" class="text-ruby-600 dark:text-ruby-400 hover:text-ruby-700 dark:hover:text-ruby-300 no-underline">${text}</a></li>`;
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

  // Run on page load
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', generateTOC);
  } else {
    generateTOC();
  }
})();
