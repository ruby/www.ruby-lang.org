/** @type {import('tailwindcss').Config} */
module.exports = {
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
      // Ruby website color palette
      colors: {
        ruby: {
          50: '#fef2f2',
          100: '#fee2e2',
          200: '#fecaca',
          300: '#fca5a5',
          400: '#f87171',
          500: '#CC342D', // Primary Ruby red
          600: '#bc3f33', // Button red
          700: '#973329', // Shadow red
          800: '#9b1c16', // Active red
          900: '#760f0a', // Darkest red
        },
        gray: {
          50: '#f8f8f8',
          100: '#f6f6f3',
          200: '#ebebe4',
          300: '#ddd',
          400: '#ccc',
          500: '#585450',
          600: '#555',
          700: '#433f3c',
          800: '#111',
          900: '#000',
        },
        blue: {
          500: '#445488', // Link blue
          600: '#0086b3', // Link hover blue
        },
        yellow: {
          200: '#ffc', // Target highlight
        },
        border: {
          light: '#ddd',
          medium: '#ccc',
          dark: '#b0b0a4',
          button: '#c2c2b8',
        }
      },

      // Typography
      fontFamily: {
        'sans': ['Noto Sans', 'Helvetica Neue', 'Helvetica', 'sans-serif'],
        'mono': ['Consolas', 'Liberation Mono', 'Courier', 'monospace'],
      },

      fontSize: {
        'xs': ['13px', '13px'],
        'sm': ['14px', '17px'],
        'base': ['16px', '20px'],
        'lg': ['19px', '25px'],
        'xl': ['20px', '24px'],
        '2xl': ['24px', '28px'],
        '3xl': ['30px', '1.2'],
        '4xl': ['36px', '1.1'],
      },

      // Spacing based on existing patterns
      spacing: {
        '1': '5px',
        '1.5': '6px',
        '2': '8px',
        '3': '12px',
        '4': '15px',
        '5': '20px',
        '6': '24px',
        '8': '30px',
        '10': '40px',
        '12': '48px',
        '15': '60px',
        '20': '80px',
      },

      // Border radius
      borderRadius: {
        'sm': '3px',
        'DEFAULT': '6px',
        'lg': '6px',
      },

      // Box shadows
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

      // Container sizes
      maxWidth: {
        'container': '980px',
        'content': '70%',
        'sidebar': '30%',
        'code': '375px',
        'search': '180px',
      },

      // Responsive breakpoints matching mobile.css
      screens: {
        'xs': '380px',
        'sm': '700px',
        'md': '768px',
        'lg': '980px',
        'xl': '1200px',
      },

      // Grid template columns for layout
      gridTemplateColumns: {
        'layout': '70% 30%',
        'intro': '1fr 375px',
      },

      // Animation and transitions
      transitionProperty: {
        'opacity': 'opacity',
        'colors': 'color, background-color, border-color',
      },

      // Text shadows
      textShadow: {
        'sm': '0 1px 0 #fff',
        'dark': '0 1px 0 #000',
      }
    },
  },
  plugins: [
    // Custom plugin for text shadows
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