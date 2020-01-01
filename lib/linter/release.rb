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
      %r{\A/en/news/(?<yyyy>\d{4})/(?<mm>\d\d)/(?<dd>\d\d)/(?<name>[^/]*)/\Z} =~ post

      "en/news/_posts/#{yyyy}-#{mm}-#{dd}-#{name}.md"
    end

    # Returns true if the post URL does not match the expected format:
    #
    #   /en/news/yyyy/mm/dd/ruby-2-7-0-released/
    #
    def post_url_invalid?
      !%r{\A/en/news/\d{4}/\d\d/\d\d/[^/]*/\Z}.match?(post)
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

    # The date corresponding to the given post URL.
    def post_date_string
      %r{\A/en/news/(?<yyyy>\d{4})/(?<mm>\d\d)/(?<dd>\d\d)/(?<name>[^/]*)/\Z} =~ post

      "#{yyyy}-#{mm}-#{dd}"
    end
  end
end
