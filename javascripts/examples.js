var Examples = {
  names: ['cities', 'greeter', 'i_love_ruby', 'hello_world'],

  random: function() {
    return Examples.names[Math.floor(Math.random() * Examples.names.length)];
  },

  choose: function() {
    var lang = document.location.pathname.split('/')[1];
    var name = Examples.random();

    $("#code").load('/' + lang + '/examples/' + name + '/');
  }
};

$(document).ready(Examples.choose);
