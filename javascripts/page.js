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
    
    
    /* For external links */

    $("a[rel^='external']").each(function() {
      $(this).attr("target","_blank");
    });


    /* Menu */

    var current_page = location.pathname;

    $(".site-links a").each(function(i) {
      if (current_page.indexOf($(this).attr('href')) == 0) {
        $(this).css('color:', '#ffe5e3');
      }
    });


    /* Mobile Menu */

    $("#menu-trigger").click(function(){
      $(".site-links").toggle();
    });

    
    /* Mobile Aside */

    $('#aside-trigger').sidr({
      name: 'mobile-aside',
      source: '#mobile-aside',
      side: 'right'
    });
    

  }

} // Var Site

jQuery(function(){
	App.StartApp();
});
