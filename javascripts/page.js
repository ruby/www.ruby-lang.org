var Page = {

  SiteLinks: {
    highlight: function() {
      var current_page = location.pathname;
      $(".site-links a").each(function(i) {
        if (current_page.indexOf($(this).attr('href')) == 0) {
          $(this).css('color:', 'green');
        }
      });
    }
  }

};

$(Page.SiteLinks.highlight);
