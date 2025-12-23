"use strict";

var TryRubyExamples = {
  isReady: true, // Examples are inlined at build time, always ready

  extractCodeFromElement: function(element) {
    // Find the code element and extract its text content
    var codeElement = element.querySelector('code');
    if (!codeElement) {
      return '';
    }

    // Get the text content, which will include the Ruby code without HTML tags
    return codeElement.textContent || codeElement.innerText || '';
  },

  generateTryRubyUrl: function(code) {
    var encodedCode = encodeURIComponent(code);
    return 'https://try.ruby-lang.org/playground/#code=' + encodedCode;
  },

  // Set callback to be called when all examples are ready
  // Since examples are inlined, call immediately
  setOnReady: function(callback) {
    callback();
  },

  showAllExamples: function() {
    // Show the entire Try Ruby section with two-phase animation:
    // Phase 1: Show frames with height animation
    // Phase 2: Fade in content inside frames
    var section = document.getElementById('try-ruby-section');
    if (section) {
      // Temporarily remove max-h-0 to measure actual height
      section.classList.remove('max-h-0');
      section.style.maxHeight = 'none';
      var actualHeight = section.scrollHeight;

      // Reset to 0 and force reflow
      section.style.maxHeight = '0px';
      section.offsetHeight; // Force reflow

      // Phase 1: Animate section height (frames become visible)
      requestAnimationFrame(function() {
        section.style.maxHeight = actualHeight + 'px';
        section.classList.remove('opacity-0');
        section.classList.add('opacity-100');

        // Phase 2: After height animation starts, fade in content
        setTimeout(function() {
          // Remove max-height restriction
          section.style.maxHeight = 'none';
          section.classList.remove('overflow-hidden');

          // Fade in all content elements inside cards
          var contentElements = section.querySelectorAll('.try-ruby-content');
          contentElements.forEach(function(el, index) {
            // Stagger the fade-in slightly for each element
            setTimeout(function() {
              el.classList.remove('opacity-0');
              el.classList.add('opacity-100');
            }, index * 50);
          });
        }, 400);
      });
    }
  },

  // Set up TryRuby button URLs based on inlined code examples
  setupButtons: function() {
    for (var i = 1; i <= 3; i++) {
      var exampleElement = document.getElementById('try-ruby-example-' + i);
      var button = document.getElementById('try-ruby-button-' + i);

      if (exampleElement && button) {
        var rubyCode = TryRubyExamples.extractCodeFromElement(exampleElement);
        if (rubyCode) {
          var tryRubyUrl = TryRubyExamples.generateTryRubyUrl(rubyCode);
          button.href = tryRubyUrl;
        }
      }
    }
  }
};

// Set up button URLs when DOM is ready
if (document.readyState === 'loading') {
  document.addEventListener('DOMContentLoaded', TryRubyExamples.setupButtons);
} else {
  TryRubyExamples.setupButtons();
}
