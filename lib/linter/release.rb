# frozen_string_literal: true

class Linter

  class Release

    # identifier displayed in error messages
    attr_reader :name

    attr_reader :version, :date, :post

    def initialize(data)
      @version = data["version"]
      @date = data["date"]
      @post = data["post"]

      @name = "Ruby #{version} release data (in `#{Linter::RELEASES_FILE}')"
    end

    # The filename for the release post, corresponding to the given post URL:
    #
    #   URL:  /en/news/2019/12/25/ruby-2-7-0-released/
    #   file: en/news/_posts/2019-12-25-ruby-2-7-0-released.md
    #
    def post_filename
      "en/news/_posts/#{post_date_string}-#{post_title}.md"
    end

    # Returns true if the post URL does not match the expected format:
    #
    #   /en/news/yyyy/mm/dd/ruby-2-7-0-released/
    #
    def post_url_invalid?
      !post_url_data
    end

    # Returns true if the release date and the post date do not match.
    def date_mismatch?
      return  if post_url_invalid?

      date.to_s != post_date_string
    end

    # Returns true if the release post file corresponding to the
    # given post URL does not exist.
    def post_missing?
      return  if post_url_invalid?

      !File.exist?(post_filename)
    end

    private

    # Returns the MatchData for date and title parts of the post URL,
    # or +nil+ if the post URL does not match the expected format.
    #
    # The MatchData includes the named captures yyyy, mm, dd, and title.
    #
    # Example URL:
    #
    #   /en/news/2019/12/25/ruby-2-7-0-released/
    #
    def post_url_data
      pattern = %r{\A/en/news/(?<yyyy>\d{4})/(?<mm>\d\d)/(?<dd>\d\d)/(?<title>[^/]*)/\z}

      pattern.match(post)
    end

    # The date corresponding to the given post URL.
    def post_date_string
      return  unless post_url_data

      yyyy = post_url_data[:yyyy]
      mm = post_url_data[:mm]
      dd = post_url_data[:dd]

      "#{yyyy}-#{mm}-#{dd}"
    end

    # The post title corresponding to the given post URL.
    def post_title
      return  unless post_url_data

      post_url_data[:title]
    end
  end
end
