var Page = {
  SiteLinks: {
    highlight: function() {
      var current_page = location.pathname;

      $("#header .site-links a").each(function(i) {
        if (current_page.indexOf($(this).attr('href')) == 0) {
          $(this).addClass('current');
        }
      });
    }
  }
};

$(Page.SiteLinks.highlight);
