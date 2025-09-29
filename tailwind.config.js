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
          50: '#fdeae9',   // ruby-90
          100: '#fadad3',  // ruby-80
          200: '#f8bfbd',  // ruby-70
          300: '#f5a9a7',  // ruby-60
          400: '#f07f7b',  // ruby-50
          500: '#eb544f',  // ruby-40
          600: '#e62923',  // ruby-30
          700: '#b8211c',  // ruby-20
          800: '#8a1915',  // ruby-10
          900: '#5c100e',  // ruby-5
        },
        gold: {
          50: '#fcfaef',   // gold-90
          100: '#f9f4df',  // gold-80
          200: '#f6efce',  // gold-70
          300: '#f3e9be',  // gold-60
          400: '#eddf9e',  // gold-50
          500: '#e5d37f',  // gold-40
          600: '#e1c95d',  // gold-30
          700: '#ccb758',  // gold-20
          800: '#b8a44b',  // gold-10
          900: '#655a27',  // gold-5
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

