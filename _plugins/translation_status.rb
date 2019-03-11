# -*- coding: utf-8 -*-

module Jekyll

  # Provides a tag that generates an overview of all news posts
  # and their translations.
  #
  # Outputs HTML.
  module TranslationStatus

    LANGS_MAP = {
      "en" => nil,
      # "bg" => "bg",
      "de" => "de",
      "es" => "es",
      "fr" => "fr",
      "id" => "id",
      "it" => "it",
      "ja" => "ja",
      "ko" => "ko",
      # "pl" => "pl",
      # "pt" => "pt",
      "ru" => "ru",
      # "tr" => "tr",
      "vi" => "vi",
      "zh_cn" => "zh-CN",
      "zh_tw" => "zh-TW",
    }
    LANGS = LANGS_MAP.keys

    START_DATE = Time.utc(2013, 4, 1)

    OK_CHAR      = '✓'
    MISSING_CHAR = ''  # '✗'

    POST_DISPLAY_LENGTH = 50

    TEMPLATE =<<-EOF.gsub(/^      /, '')
      <p>
      Posts with missing translations: <%= posts.size.to_s %><br>
      Start date: <%= START_DATE.strftime('%Y-%m-%d') %><br>
      Ignored languages: <%= ignored %>
      </p>

      <table>
      <colgroup>
        <col>
      <% LANGS.each do |lang| -%>
        <col class="<%= lang %>">
      <% end -%>
      </colgroup>
      <thead>
      <%= table_header %>
      </thead>
      <tbody>
      <% posts.each do |post| -%>
      <%=  table_row(post) %>
      <% end -%>
      </tbody>
      </table>
    EOF

    SET_OF_LANGS = Set.new(LANGS)

    class Post

      attr_reader :name
      attr_accessor :translations, :security

      def initialize(name)
        @name = name
        @security = false
        @translations = Set.new
      end

      def completed?
        SET_OF_LANGS == translations
      end

      def short_name
        if name.size > POST_DISPLAY_LENGTH
          name[0...POST_DISPLAY_LENGTH - 3] + '...'
        else
          name
        end
      end

      def short_name_in_red
        %Q{<span style="color:red">#{short_name}</span>}
      end

      def row_data(langs)
        display_name = (security ? short_name_in_red : short_name)

        [display_name] + langs.map do |lang|
          if translations.include?(lang)
            %Q(<a href="/#{lang}/news/#{name}">#{OK_CHAR}</a>)
          else
            MISSING_CHAR
          end
        end
      end
    end


    class Tag < Liquid::Tag

      def initialize(tag_name, path, tokens)
        super
        @posts = Hash.new {|posts, name| posts[name] = Post.new(name) }
      end

      def remove_completed_posts
        @posts.delete_if {|name, post| post.completed? }
      end

      def too_old(date)
        date < START_DATE
      end

      def table_header
        "<tr><th>News Post</th><th>#{LANGS.join('</th><th>')}</th></tr>"
      end

      def table_row(post)
        "<tr><td>#{post.row_data(LANGS).join('</td><td>')}</td></tr>"
      end

      def render(context)
        categories = context.registers[:site].categories
        ignored_langs = categories.keys - LANGS - ['news']

        LANGS.each do |lang|
          categories[lang].each do |post|
            next if too_old(post.date)

            name = post.url.gsub(%r(\A/#{lang}/news/), '')
            @posts[name].translations << lang
            @posts[name].security = true  if post.data['tags'].include?('security')
          end
        end

        remove_completed_posts

        ignored = ignored_langs.sort.join(', ')
        posts = @posts.sort.reverse.map {|name, post| post }

        ERB.new(TEMPLATE, nil, '-').result(binding)
      end
    end

    class LanguagesJson < Liquid::Tag
      def render(context)
        categories = context.registers[:site].categories

        newest_post_date = Hash.new(START_DATE)

        LANGS.each do |lang|
          categories[lang].each do |post|
            if newest_post_date[lang] < post.date
              newest_post_date[lang] = post.date
            end
          end
        end

        about_6_months_ago = Time.now - 60*60*24*30*6
        newest_post_date.delete("en")
        newest_post_date.delete_if {|_lang, date| date < about_6_months_ago }
        languages = newest_post_date.keys.map do |lang|
          %Q("#{LANGS_MAP[lang]}": "#{lang}")
        end
        "{#{languages.join(',')}}"
      end
    end
  end
end

Liquid::Template.register_tag('translation_status', Jekyll::TranslationStatus::Tag)
Liquid::Template.register_tag('languages_json', Jekyll::TranslationStatus::LanguagesJson)
