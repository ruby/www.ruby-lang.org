# frozen_string_literal: true

module Jekyll

  # Provides a Liquid filter to resolve a localized version of a
  # post URL when a translation exists for the given language.
  #
  # Falls back to the original (English) URL if no translation is found.
  #
  # Example:
  #     {{ release.post | localize_post_url: page.lang }}
  #
  module LocalizePostUrlFilter

    def localize_post_url(url, lang)
      return url if lang.nil? || lang == "en"

      localized_url = url.sub(%r{\A/en/}, "/#{lang}/")
      return url if localized_url == url

      site = @context.registers[:site]

      # Build a lookup set of all post URLs on first use (cached per site)
      @post_urls ||= Set.new(site.posts.docs.map(&:url))

      if @post_urls.include?(localized_url)
        localized_url
      else
        url
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::LocalizePostUrlFilter)
