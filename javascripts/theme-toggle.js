// Theme Toggle
(function() {
  'use strict';

  const THEME_KEY = 'theme-preference';
  const THEMES = {
    AUTO: 'auto',
    DARK: 'dark',
    LIGHT: 'light'
  };

  // Get current theme from localStorage or default to auto
  function getTheme() {
    return localStorage.getItem(THEME_KEY) || THEMES.AUTO;
  }

  // Save theme to localStorage
  function saveTheme(theme) {
    localStorage.setItem(THEME_KEY, theme);
  }

  // Apply theme to document
  function applyTheme(theme) {
    const root = document.documentElement;

    if (theme === THEMES.DARK) {
      root.classList.add('dark');
    } else if (theme === THEMES.LIGHT) {
      root.classList.remove('dark');
    } else {
      // Auto: use system preference
      if (window.matchMedia('(prefers-color-scheme: dark)').matches) {
        root.classList.add('dark');
      } else {
        root.classList.remove('dark');
      }
    }
  }

  // Update toggle button icon
  function updateToggleIcon(theme) {
    const toggle = document.getElementById('theme-toggle');
    if (!toggle) return;

    const icon = toggle.querySelector('span');
    if (!icon) return;

    // Remove all theme icon classes
    icon.classList.remove('icon-theme-auto', 'icon-theme-dark', 'icon-theme-light');

    // Add appropriate class based on theme
    if (theme === THEMES.AUTO) {
      icon.classList.add('icon-theme-auto');
      toggle.setAttribute('aria-label', 'Theme: Auto');
      toggle.setAttribute('title', 'Theme: Auto (System)');
    } else if (theme === THEMES.DARK) {
      icon.classList.add('icon-theme-dark');
      toggle.setAttribute('aria-label', 'Theme: Dark');
      toggle.setAttribute('title', 'Theme: Dark');
    } else {
      icon.classList.add('icon-theme-light');
      toggle.setAttribute('aria-label', 'Theme: Light');
      toggle.setAttribute('title', 'Theme: Light');
    }
  }

  // Cycle to next theme
  function cycleTheme() {
    const current = getTheme();
    let next;

    if (current === THEMES.AUTO) {
      next = THEMES.DARK;
    } else if (current === THEMES.DARK) {
      next = THEMES.LIGHT;
    } else {
      next = THEMES.AUTO;
    }

    saveTheme(next);
    applyTheme(next);
    updateToggleIcon(next);
  }

  // Initialize theme on page load
  function initTheme() {
    const theme = getTheme();
    applyTheme(theme);
    updateToggleIcon(theme);

    // Set up toggle button
    const toggle = document.getElementById('theme-toggle');
    if (toggle) {
      toggle.addEventListener('click', cycleTheme);
    }

    // Listen for system theme changes (when in auto mode)
    window.matchMedia('(prefers-color-scheme: dark)').addEventListener('change', function() {
      const currentTheme = getTheme();
      if (currentTheme === THEMES.AUTO) {
        applyTheme(THEMES.AUTO);
      }
    });
  }

  // Run on page load
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', initTheme);
  } else {
    initTheme();
  }
})();
