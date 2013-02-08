var Examples = {
  names: ['cities', 'greeter', 'i_love_ruby', 'hello_world'],

  random: function() {
    return Examples.names[Math.floor(Math.random() * Examples.names.length)];
  },

  choose: function() {
    var lang = document.location.pathname.split('/')[1];
    var name = Examples.random();

    $.get('/' + lang + '/examples/' + name + '.html', function(data) {
      $("#code").html(data);
    });
  }
};

$(document).ready(Examples.choose);
