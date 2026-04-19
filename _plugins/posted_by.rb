# frozen_string_literal: true

module Jekyll

  # Generates a localized "Posted by ... on ..." text from a date,
  # using the page +lang+ variable and a +strftime+ format string
  # read from the site data (+locales+: +lang+: +posted_by+).
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

      posted_by = if author.nil? || author.empty? || author == "Unknown Author"
                    "%Y-%m-%d"
                  else
                    lang = @context.environments.first["page"]["lang"] || "en"
                    format = @context.registers[:site].data["locales"][lang]["posted_by"] ||
                             @context.registers[:site].data["locales"]["en"]["posted_by"]

                    format.gsub("AUTHOR", "<strong>#{author}</strong>")
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
