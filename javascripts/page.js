"use strict";
var Page = {
    SiteLinks: {
        highlight: function () {
            var current_page = location.pathname;
            $("#header div.site-links a:not(.home)").each(function (i) {
                var element_href = $(this).attr('href');
                if (element_href && current_page.indexOf(element_href) == 0) {
                    $(this).addClass('selected');
                }
            });
            $("#home-page-layout #header div.site-links a.home").addClass('selected');
        },
        menu: function () {
            $("#header div.site-links a.menu").on('click touchstart', function (event) {
                $(this).closest("div.site-links").toggleClass("open");
                event.preventDefault();
            });
        }
    }
};
$(Page.SiteLinks.highlight);
$(Page.SiteLinks.menu);
