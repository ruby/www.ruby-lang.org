module Jekyll

  # Provides a tag that generates an overview of all news posts
  # and their translations.
  #
  # Outputs HTML.
  module TranslationStatus

    LANGS =  %w{en de es fr id it ja pl vi zh_cn zh_tw}
    START_DATE = '2013-04-01'

    OK_CHAR      = '✓'
    MISSING_CHAR = ''  # '✗'

    POST_DISPLAY_LENGTH = 50

    TEMPLATE =<<-EOF.gsub(/^      /, '')
      <p>
      Posts with missing translations: <%= posts.size.to_s %><br>
      Start date: <%= START_DATE %><br>
      Ignored languages: <%= ignored %>
      </p>

      <table>
      <%= table_header %>
      <% posts.each do |post| -%>
      <%=  table_row(post) %>
      <% end -%>
      </table>
    EOF

    SET_OF_LANGS = Set.new(LANGS)

    class Post

      attr_reader :name
      attr_accessor :translations

      def initialize(name)
        @name = name
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

      def row_data(langs)
        [short_name] + langs.map{|lang| translations.include?(lang) ? OK_CHAR : MISSING_CHAR }
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
        date.strftime("%Y-%m-%d") < START_DATE
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
          end
        end

        remove_completed_posts

        ignored = ignored_langs.sort.join(', ')
        posts = @posts.sort.reverse.map {|name, post| post }

        ERB.new(TEMPLATE, nil, '-').result(binding)
      end
    end
  end
end

Liquid::Template.register_tag('translation_status', Jekyll::TranslationStatus::Tag)
