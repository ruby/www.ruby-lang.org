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
      colors: {
        ruby: {
          50: '#fef2f2',
          100: '#fee2e2',
          200: '#fecaca',
          300: '#fca5a5',
          400: '#f87171',
          500: '#CC342D',
          600: '#bc3f33',
          700: '#973329',
          800: '#9b1c16',
          900: '#760f0a',
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
          500: '#445488',
          600: '#0086b3',
        },
        yellow: {
          200: '#ffc',
        },
        border: {
          light: '#ddd',
          medium: '#ccc',
          dark: '#b0b0a4',
          button: '#c2c2b8',
        }
      },
      fontFamily: {
        'sans': ['Noto Sans', 'Helvetica Neue', 'Helvetica', 'sans-serif'],
        'mono': ['Consolas', 'Liberation Mono', 'Courier', 'monospace'],
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
      screens: {
        'xs': '23.75rem',   // 380px
        'sm': '43.75rem',   // 700px
        'md': '48rem',      // 768px
        'lg': '61.25rem',   // 980px
        'xl': '75rem',      // 1200px
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

