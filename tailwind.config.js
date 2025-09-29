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
    extend: {},
  },
  plugins: [],
}

