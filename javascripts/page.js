var Page = {
  SiteLinks: {
    highlight: function() {
      var current_page = location.pathname;
      var $sitelink    = $("div.site-links a[href='" + current_page + "']");

      if ($sitelink != null) {
        $sitelink.css('font-weight', 'bold');
      }
    }
  }
};

$(Page.SiteLinks.highlight);
