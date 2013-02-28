var Page = {
  SiteLinks: {
    highlight: function() {
      var current_page = location.pathname;
      var $sitelink = $("div.site-links a[href=\"" + current_page + "\"]");

      if ($sitelink) {
        $sitelink.css('text-weight: bold;');
      }
    }
  }
};

$(Page.SiteLinks.highlight);
