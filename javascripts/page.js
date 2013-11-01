var Page = {
  SiteLinks: {
    highlight: function() {
      var current_page = location.pathname;

      $('.header__nav__link').each(function(i) {
        if (current_page.indexOf($(this).attr('href')) == 0) {
          $(this).css('color', '#19ada1');
        }
      });
    }
  }
};

$(Page.SiteLinks.highlight);
