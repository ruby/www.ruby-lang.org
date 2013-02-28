var Page = {
  SiteLinks: {
    highlight: function() {
      var current_page = location.pathname;

      $("div.site-links a").each(function(i) {
        if (current_page.startsWith($(this).attr('href'))) {
          $(this).css('font-weight', 'bold');
        }
      });
    }
  }
};

$(Page.SiteLinks.highlight);
