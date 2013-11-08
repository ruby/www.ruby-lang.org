var Page = {
  SiteLinks: {
    highlight: function() {
      var current_page = location.pathname;

      console.log(current_page);

      // for each navbar link...
      $(".navbar a").each(function(i) {
        // ...if it's a logo...
        if ( $(this).parent().hasClass('logo') ) {
          // highlight it if it's exactly the right page
          if (current_page == $(this).attr('href')) {
            $(this).addClass('active');
          }
        // ...if it's not a logo...
        } else {
          // highlight it if it starts with the href
          if (current_page.indexOf($(this).attr('href')) == 0) {
            $(this).addClass('active');
          }
        }

      });
    },
    toggleMobile: function() {
      $(".navbar").toggleClass("open");
    }
  }
};

$(Page.SiteLinks.highlight);
