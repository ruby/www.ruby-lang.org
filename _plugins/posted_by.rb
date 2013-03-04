module Jekyll

  # Generates a localized "Posted by ... on ..." text from a date,
  # using the page +lang+ variable and a +strftime+ format string
  # read from the site config (+locales+: +posted_by+: +lang+).
  # Example format string: <tt>"Posted by AUTHOR on %-d %b %Y"</tt>
  # (literal +AUTHOR+ is replaced by the specified author).
  #
  # Example:
  #     {{ post.date | posted_by:post.author }}
  #
  # When no format string is defined for +lang+,
  # +en+ is used as default.
  module PostedByFilter

    def posted_by(date, author = nil)
      date = date.is_a?(String) ? Time.parse(date) : date

      lang = @context.environments.first['page']['lang'] || 'en'

      locales = @context.registers[:site].config['locales']['posted_by']
      posted_by = locales[lang] || locales['en']

      if author.nil? || author.empty? || author == 'Unknown Author'
        posted_by = "%Y-%m-%d"
      else
        posted_by = posted_by.gsub('AUTHOR', author)
      end

      if date.respond_to?(:strftime)
        date.strftime(posted_by)
      else
        date.to_s
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::PostedByFilter)
