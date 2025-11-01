"use strict";

var TryRubyExamples = {
  examples: ['greeter', 'cities', 'i_love_ruby'],

  loadExample: function(exampleName, targetId) {
    var lang = document.location.pathname.split('/')[1] || 'en';
    var target = document.getElementById(targetId);

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
      })
      .catch(function(error) {
        console.error('Error loading example:', error);
        target.innerHTML = '<p class="text-stone-500">Failed to load example</p>';
      });
  },

  loadAll: function() {
    // Load each example into its corresponding container
    TryRubyExamples.loadExample('i_love_ruby', 'try-ruby-example-1');
    TryRubyExamples.loadExample('cities', 'try-ruby-example-2');
    TryRubyExamples.loadExample('greeter', 'try-ruby-example-3');
  }
};

// Load examples when DOM is ready
if (document.readyState === 'loading') {
  document.addEventListener('DOMContentLoaded', TryRubyExamples.loadAll);
} else {
  TryRubyExamples.loadAll();
}
