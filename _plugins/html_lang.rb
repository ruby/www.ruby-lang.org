module Jekyll
  module HtmlLangFilter
    # Converts Jekyll locale code to valid HTML lang attribute format
    #
    # The HTML lang attribute requires BCP 47 language tags, which use
    # hyphens as separators and uppercase region codes.
    #
    # Examples:
    #   "en"    => "en"
    #   "zh_cn" => "zh-CN"
    #   "zh_tw" => "zh-TW"
    #
    # @param input [String] Jekyll locale code (e.g., "zh_cn")
    # @return [String] HTML lang attribute value (e.g., "zh-CN")
    def to_html_lang(input)
      return input unless input.is_a?(String)

      # Replace underscore with hyphen and uppercase the region code
      input.gsub(/_([a-z]+)/) { "-#{$1.upcase}" }
    end
  end
end

Liquid::Template.register_filter(Jekyll::HtmlLangFilter)
