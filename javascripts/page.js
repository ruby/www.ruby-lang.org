var Page = {
  SiteLinks: {
    highlight: function() {
      var current_page = location.pathname;

      $("div.site-links a").each(function(i) {
        if (current_page.indexOf($(this).attr('href')) == 0) {
          $(this).css('font-weight', 'bold');
        }
      });
    }
  }
};

$(Page.SiteLinks.highlight);
