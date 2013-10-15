// Console

if(typeof(console) == 'undefined') console = { log : function(){} };
if(typeof(console.log) != 'function') console.log = function(){};


// Functions

var App = {

  StartApp: function() {
      try {
        this.InterfaceActions();
      } catch (e) {
        alert('errors');
        console.log('Error: ' + e);
      }
  },

  InterfaceActions: function() {

    $("a[rel^='external']").each(function() {
      $(this).attr("target","_blank");
    });


    var current_page = location.pathname;

    $(".site-links a").each(function(i) {
      if (current_page.indexOf($(this).attr('href')) == 0) {
        $(this).css('color:', '#ffe5e3');
      }
    });

  }

} // Var Site

jQuery(function(){
	App.StartApp();
});
