module Jekyll

  # A filter that localizes relative links using the
  # +lang+ variable from the page's YAML front matter.
  # It is assumed that all relative links are meant to be
  # relative to language specific sub sites
  # \- like <tt>/en/</tt>, <tt>/de/</tt>, ... \-
  # and returns the absolute link starting from the site root.
  #
  # Absolute links and URLs starting with <tt>http://</tt> or
  # <tt>https://</tt> are not modified.
  #
  # Example (assuming `<tt>lang: de</tt>'):
  #
  #     {{ 'relative/link' | localize }}  # => '/de/relative/link'
  #     {{ '/en/link'      | localize }}  # => '/en/link'
  #     {{ 'http://site'   | localize }}  # => 'http://site'
  #
  # The site root `+/+' is also localized:
  #
  #     {{ '/' | localize }}  # => '/de/'
  #
  # When the +lang+ variable is not set, +en+ is used as default:
  #
  #     {{ 'relative/link' | localize }}  # => '/en/relative/link'
  #
  # Installation:
  #
  # Copy this file into the +_plugins+ directory.
  #
  # Copyright (C) 2013 Marcus Stollsteimer
  module LocalizeFilter

    def localize(input)
      page = @context.environments.first['page']
      lang = page['lang'] || 'en'

      case input
      when '/'
        "/#{lang}/"
      when %r{\A/}, %r{\Ahttps?://}
        input
      else
        "/#{lang}/#{input}"
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::LocalizeFilter)
