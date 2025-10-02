/** @type {import('tailwindcss').Config} */
const colors = require('tailwindcss/colors')

module.exports = {
  darkMode: 'class', // Enable dark mode via class
  content: [
    "./_layouts/**/*.html",
    "./_includes/**/*.html",
    "./**/*.html",
    "./**/*.md",
    "!./_site/**/*",
    "!./node_modules/**/*"
  ],
  theme: {
    extend: {
      colors: {
        // Semantic colors using CSS variables
        'semantic': {
          // Backgrounds
          'bg-default': 'var(--color-background-default)',
          'bg-subtle': 'var(--color-background-subtle)',
          'bg-subtler': 'var(--color-background-subtler)',
          'bg-primary-enabled': 'var(--color-background-primary-action-enabled)',
          'bg-primary-hovered': 'var(--color-background-primary-action-hovered)',
          'bg-primary-pressed': 'var(--color-background-primary-action-pressed)',
          'bg-secondary-enabled': 'var(--color-background-secondary-action-enabled)',
          'bg-secondary-hovered': 'var(--color-background-secondary-action-hovered)',
          'bg-secondary-pressed': 'var(--color-background-secondary-action-pressed)',

          // Borders
          'border-bold': 'var(--color-border-bold)',
          'border-default': 'var(--color-border-default)',
          'border-inverse': 'var(--color-border-inverse)',
          'border-subtle': 'var(--color-border-subtle)',
          'border-primary-focused': 'var(--color-border-primary-action-focused)',
          'border-secondary-enabled': 'var(--color-border-secondary-action-enabled)',
          'border-secondary-focused': 'var(--color-border-secondary-action-focused)',

          // Text
          'text-danger': 'var(--color-text-danger)',
          'text-default': 'var(--color-text-default)',
          'text-hovered': 'var(--color-text-hovered)',
          'text-link': 'var(--color-text-link)',
          'text-link-hovered': 'var(--color-text-link-hovered)',
          'text-primary': 'var(--color-text-primary)',
          'text-primary-action': 'var(--color-text-primary-action)',
          'text-secondary': 'var(--color-text-secondary)',
          'text-secondary-action': 'var(--color-text-secondary-action)',
          'text-subtle': 'var(--color-text-subtle)',
          'text-success': 'var(--color-text-success)',

          // Code highlighting
          'code-blue': 'var(--code-blue)',
          'code-green': 'var(--code-green)',
          'code-orange': 'var(--code-orange)',
          'code-purple': 'var(--code-purple)',
          'code-red': 'var(--code-red)',
        },
        // Primitive colors using CSS variables
        ruby: {
          50: 'var(--color-ruby-50)',
          100: 'var(--color-ruby-100)',
          200: 'var(--color-ruby-200)',
          300: 'var(--color-ruby-300)',
          400: 'var(--color-ruby-400)',
          500: 'var(--color-ruby-500)',
          600: 'var(--color-ruby-600)',
          700: 'var(--color-ruby-700)',
          800: 'var(--color-ruby-800)',
          900: 'var(--color-ruby-900)',
        },
        gold: {
          50: 'var(--color-gold-50)',
          100: 'var(--color-gold-100)',
          200: 'var(--color-gold-200)',
          300: 'var(--color-gold-300)',
          400: 'var(--color-gold-400)',
          500: 'var(--color-gold-500)',
          600: 'var(--color-gold-600)',
          700: 'var(--color-gold-700)',
          800: 'var(--color-gold-800)',
          900: 'var(--color-gold-900)',
        },
        // Theme colors (alias to primitive colors)
        primary: {
          50: 'var(--color-ruby-50)',
          100: 'var(--color-ruby-100)',
          200: 'var(--color-ruby-200)',
          300: 'var(--color-ruby-300)',
          400: 'var(--color-ruby-400)',
          500: 'var(--color-ruby-500)',
          600: 'var(--color-ruby-600)',
          700: 'var(--color-ruby-700)',
          800: 'var(--color-ruby-800)',
          900: 'var(--color-ruby-900)',
        },
        secondary: {
          50: 'var(--color-gold-50)',
          100: 'var(--color-gold-100)',
          200: 'var(--color-gold-200)',
          300: 'var(--color-gold-300)',
          400: 'var(--color-gold-400)',
          500: 'var(--color-gold-500)',
          600: 'var(--color-gold-600)',
          700: 'var(--color-gold-700)',
          800: 'var(--color-gold-800)',
          900: 'var(--color-gold-900)',
        },
        // Using Tailwind defaults for semantic colors
        danger: colors.red,     // Tailwind's red palette
        success: colors.emerald, // Tailwind's emerald palette
        warning: colors.amber,   // Tailwind's amber palette
        border: {
          light: '#ddd',
          medium: '#ccc',
          dark: '#b0b0a4',
          button: '#c2c2b8',
        }
      },
      fontFamily: {
        'default': ['"Noto Sans JP"', '"Plus Jakarta Sans"', 'ui-sans-serif', 'system-ui', '-apple-system', 'sans-serif'],
        'code': ['Courier', 'ui-monospace', 'SFMono-Regular', 'Consolas', 'monospace'],
        'icon': ['"Material Icons"', 'sans-serif'],
      },
      fontSize: {
        'xs': ['0.8125rem', '0.8125rem'],  // 13px
        'sm': ['0.875rem', '1.0625rem'],   // 14px, 17px
        'base': ['1rem', '1.25rem'],       // 16px, 20px
        'lg': ['1.1875rem', '1.5625rem'],  // 19px, 25px
        'xl': ['1.25rem', '1.5rem'],       // 20px, 24px
        '2xl': ['1.5rem', '1.75rem'],      // 24px, 28px
        '3xl': ['1.875rem', '1.2'],        // 30px
        '4xl': ['2.25rem', '1.1'],         // 36px
      },
      spacing: {
        '1': '0.3125rem',   // 5px
        '1.5': '0.375rem',  // 6px
        '2': '0.5rem',      // 8px
        '3': '0.75rem',     // 12px
        '4': '0.9375rem',   // 15px
        '5': '1.25rem',     // 20px
        '6': '1.5rem',      // 24px
        '8': '1.875rem',    // 30px
        '10': '2.5rem',     // 40px
        '12': '3rem',       // 48px
        '15': '3.75rem',    // 60px
        '20': '5rem',       // 80px
      },
      borderRadius: {
        'sm': '0.1875rem',  // 3px
        'DEFAULT': '0.375rem', // 6px
        'lg': '0.375rem',   // 6px
      },
      boxShadow: {
        'sm': '0 1px 2px #ddd inset',
        'DEFAULT': '0 0 3px rgba(0,0,0,0.4)',
        'md': '0 2px 0 #c2c2b8',
        'lg': '0 2px 5px rgba(0,0,0,0.5)',
        'inset': '0 0 4px rgba(0,0,0,0.4) inset',
        'button': '0 2px 0 #973329',
        'button-hover': '0 2px 0 #c2c2b8',
        'download': '0 2px 0 #9b1c16',
      },
      maxWidth: {
        'container': '61.25rem',  // 980px
        'content': '70%',
        'sidebar': '30%',
        'code': '23.4375rem',     // 375px
        'search': '11.25rem',      // 180px
      },
      gridTemplateColumns: {
        'layout': '70% 30%',
        'intro': '1fr 23.4375rem',  // 1fr 375px
      },
      transitionProperty: {
        'opacity': 'opacity',
        'colors': 'color, background-color, border-color',
      },
      textShadow: {
        'sm': '0 1px 0 #fff',
        'dark': '0 1px 0 #000',
      }
    },
  },
  plugins: [
    function({ addUtilities }) {
      const newUtilities = {
        '.text-shadow-sm': {
          textShadow: '0 1px 0 #fff',
        },
        '.text-shadow-dark': {
          textShadow: '0 1px 0 #000',
        },
        '.text-shadow-none': {
          textShadow: 'none',
        },
      }
      addUtilities(newUtilities)
    }
  ],
}

