"use strict";

var TryRubyExamples = {
  extractCodeFromHtml: function(html) {
    // Create a temporary element to parse the HTML
    var temp = document.createElement('div');
    temp.innerHTML = html;

    // Find the code element and extract its text content
    var codeElement = temp.querySelector('code');
    if (!codeElement) {
      return '';
    }

    // Get the text content, which will include the Ruby code without HTML tags
    return codeElement.textContent || codeElement.innerText || '';
  },

  generateTryRubyUrl: function(code) {
    var encodedCode = encodeURIComponent(code);
    return 'https://try.ruby-lang.org/playground/#code=' + encodedCode + '&engine=cruby-3.3.0';
  },

  loadExample: function(exampleName, targetId, buttonId) {
    var lang = document.location.pathname.split('/')[1] || 'en';
    var target = document.getElementById(targetId);
    var button = document.getElementById(buttonId);

    if (!target) {
      console.error('Target element not found:', targetId);
      return;
    }

    // Use fetch API to load the example
    fetch('/' + lang + '/examples/' + exampleName + '/')
      .then(function(response) {
        if (!response.ok) {
          throw new Error('Failed to load example: ' + exampleName);
        }
        return response.text();
      })
      .then(function(html) {
        target.innerHTML = html;

        // Update button URL if button exists
        if (button) {
          // Extract Ruby code from the loaded HTML
          var rubyCode = TryRubyExamples.extractCodeFromHtml(html);
          if (rubyCode) {
            var tryRubyUrl = TryRubyExamples.generateTryRubyUrl(rubyCode);
            button.href = tryRubyUrl;
          }
        }
      })
      .catch(function(error) {
        console.error('Error loading example:', error);
        target.innerHTML = '<p class="text-stone-500">Failed to load example</p>';
      });
  },

  loadAll: function() {
    // Load each example into its corresponding container
    TryRubyExamples.loadExample('i_love_ruby', 'try-ruby-example-1', 'try-ruby-button-1');
    TryRubyExamples.loadExample('cities', 'try-ruby-example-2', 'try-ruby-button-2');
    TryRubyExamples.loadExample('greeter', 'try-ruby-example-3', 'try-ruby-button-3');
  }
};

// Load examples when DOM is ready
if (document.readyState === 'loading') {
  document.addEventListener('DOMContentLoaded', TryRubyExamples.loadAll);
} else {
  TryRubyExamples.loadAll();
}
