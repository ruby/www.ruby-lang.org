var Page = {
  SiteLinks: {
    highlight: function() {
      var current_page = location.pathname;

      $("div.site-links a").each(function(i) {
        if (current_page.indexOf($(this).attr('href')) === 0) {
          $(this).addClass('selected');
        }
      });
    }
  },

  MobileSiteLinks: {
    build: function() {
      var elem = $('#mobile-site-links');

      $('.site-links.top a').each(function(i) {
        var itemElem = $(this);
        var optElem = $('<option>');

        optElem.text(itemElem.text());
        optElem.val(itemElem.attr('href'));
        elem.append(optElem);
      });

      elem.on('change', Page.MobileSiteLinks.onChange);
    },

    onChange: function() {
      var elem = $('#mobile-site-links');
      var href = elem.val();

      if (href.length === 0) {
        return;
      }

      window.location.href = href;
    }
  }
};

$(document).ready(function() {
  Page.SiteLinks.highlight();
  Page.MobileSiteLinks.build();
});
