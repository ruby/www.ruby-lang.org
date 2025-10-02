/** @type {import('tailwindcss').Config} */
const colors = require('tailwindcss/colors')

module.exports = {
  darkMode: 'media', // Enable dark mode via OS preference
  content: [
    "./_layouts/**/*.html",
    "./_includes/**/*.html",
    "./**/*.html",
    "./**/*.md",
    "!./_site/**/*",
    "!./node_modules/**/*"
  ],
  theme: {
    container: {
      center: true,
      padding: {
        DEFAULT: '1rem',
        sm: '1.5rem',
        lg: '2rem',
      },
      screens: {
        sm: '100%',
        md: '100%',
        lg: '100%',
        xl: '80rem',     // 1280px
        '2xl': '90rem',  // 1440px
      },
    },
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
          'text-subtler': 'var(--color-text-subtler)',
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
        'code': ['ui-monospace', 'SFMono-Regular', 'Menlo', 'Monaco', 'Consolas', '"Liberation Mono"', '"Courier New"', 'monospace'],
        'icon': ['"Material Icons"', 'sans-serif'],
      },
      maxWidth: {
        'container': '61.25rem',  // 980px
        'content': '70%',
        'sidebar': '30%',
        'code': '23.4375rem',     // 375px
        'search': '11.25rem',      // 180px
        'nav': '18rem',            // 288px - Navigation max width
        'toc': '16rem',            // 256px - TOC max width
        'content-3col': '72rem',   // 1152px - Main content max width in 3-column layout
      },
      typography: (theme) => ({
        DEFAULT: {
          css: {
            color: theme('colors.stone.900'),
            maxWidth: 'none',
            'h1, h2, h3, h4, h5, h6': {
              color: theme('colors.stone.900'),
              '@media (prefers-color-scheme: dark)': {
                color: theme('colors.stone.50'),
              },
            },
            'p, li, td, th': {
              color: theme('colors.stone.900'),
              '@media (prefers-color-scheme: dark)': {
                color: theme('colors.stone.300'),
              },
            },
            'strong': {
              color: theme('colors.stone.900'),
              '@media (prefers-color-scheme: dark)': {
                color: theme('colors.stone.100'),
              },
            },
            'blockquote': {
              color: theme('colors.stone.700'),
              borderLeftColor: theme('colors.stone.300'),
              '@media (prefers-color-scheme: dark)': {
                color: theme('colors.stone.300'),
                borderLeftColor: theme('colors.stone.700'),
              },
            },
            'ul > li::marker': {
              color: theme('colors.stone.400'),
              '@media (prefers-color-scheme: dark)': {
                color: theme('colors.stone.500'),
              },
            },
            'ol > li::marker': {
              color: theme('colors.stone.500'),
              '@media (prefers-color-scheme: dark)': {
                color: theme('colors.stone.400'),
              },
            },
            '.summary': {
              marginTop: '1rem',        // 16px
              marginBottom: '4rem',     // 48px
              fontSize: '1.2rem',       // 20px
              lineHeight: '1.8rem',     // 26px
            },
            'a': {
              color: '#e62923',  // ruby-600 (light mode)
              textDecoration: 'underline',
              '&:hover, &:focus, &:active': {
                color: '#b8211c',  // ruby-700 (light mode)
              },
              '@media (prefers-color-scheme: dark)': {
                color: '#eb544f',  // ruby-500 (dark mode)
                '&:hover, &:focus, &:active': {
                  color: '#f07f7b',  // ruby-400 (dark mode)
                },
              },
            },
            'pre': {
              backgroundColor: theme('colors.stone.100'),  // stone-100 (light mode)
              color: theme('colors.stone.900'),            // stone-900 (light mode)
              fontWeight: 'bold',
              fontFamily: 'ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, "Liberation Mono", "Courier New", monospace',
              '@media (prefers-color-scheme: dark)': {
                backgroundColor: theme('colors.stone.700'),  // stone-800 (dark mode)
                color: theme('colors.stone.50'),             // stone-50 (dark mode)
              },
            },
            'pre code': {
              color: theme('colors.stone.900'),            // stone-900 (light mode)
              fontWeight: 'bold',
              fontFamily: 'ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, "Liberation Mono", "Courier New", monospace',
              '@media (prefers-color-scheme: dark)': {
                color: theme('colors.stone.50'),  // stone-50 (dark mode)
              },
            },
            'code': {
              display: 'inline-block',
              backgroundColor: theme('colors.stone.100'),  // stone-100 (light mode)
              color: theme('colors.stone.900'),            // stone-900 (light mode)
              fontFamily: 'ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, "Liberation Mono", "Courier New", monospace',
              margin: '0 0.125rem',        // 0 2px
              padding: '0 0.3125rem',      // 0 5px
              borderRadius: '0.1875rem',   // 3px
              '@media (prefers-color-scheme: dark)': {
                backgroundColor: theme('colors.stone.700'),  // stone-800 (dark mode)
                color: theme('colors.stone.50'),             // stone-50 (dark mode)
              },
            },
            'code::before': {
              content: '""',
            },
            'code::after': {
              content: '""',
            },
            '.post-info': {
              color: '#78716c',            // stone-500 (light mode)
              fontSize: '0.8125rem',       // 13px
              lineHeight: '1rem',          // 16px
              margin: '0',
              '@media (prefers-color-scheme: dark)': {
                color: '#e7e5e4',  // stone-200 (dark mode)
              },
            },
          },
        },
      }),
    },
  },
  plugins: [
    require('@tailwindcss/typography'),
  ],
}

