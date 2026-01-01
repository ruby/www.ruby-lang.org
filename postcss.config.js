const path = require('node:path');

module.exports = {
  plugins: {
    "postcss-import": {
      path: path.join(__dirname, 'stylesheets')
    },
    tailwindcss: {},
    autoprefixer: {},
  }
};
