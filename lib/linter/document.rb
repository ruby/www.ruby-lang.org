class Linter
  class Document

    attr_accessor :filename, :yaml, :content

    def initialize(filename)
      @filename = filename
      @yaml, @content = read_yaml_and_content(filename)
    end

    def post?
      filename.match? %r{/_posts/}
    end

    # posts from before the migration to the Jekyll site
    # (they follow different rules; e.g. they have no YAML date variable,
    # filenames of translations differ from original `en' post, ...)
    def old_post?
      post? && Time.utc(*filename_date_string.split("/")) < Time.utc(2013, 4, 1)
    end

    def lang_invalid?
      yaml["lang"].nil? || !valid_string(yaml["lang"])
    end

    def lang_not_matching_filename?
      !lang_invalid? && !filename.start_with?("#{yaml['lang']}/")
    end

    def author_invalid?
      yaml["author"].nil? || !valid_string(yaml["author"])
    end

    # translator variable must be present but can be nil
    def translator_missing?
      !yaml.has_key?("translator")
    end

    def translator_invalid?
      return nil  if yaml["translator"].nil?

      !valid_string(yaml["translator"])
    end

    def date_missing?
      yaml["date"].nil?
    end

    def date_invalid?
      return nil  if date_missing?

      !yaml["date"].is_a?(Time)
    end

    def date_mismatch?
      return nil  if date_missing? || date_invalid?

      date_utc_string != filename_date_string
    end

    def date_utc_string
      yaml["date"].getutc.strftime('%Y/%m/%d')
    end

    def filename_date_string
      File.basename(filename).split('-',4)[0..2].join('/')
    end

    def date_not_utc?
      return nil  if date_missing? || date_invalid?

      yaml["date"].utc_offset != 0
    end

    def no_newline_at_eof?
      !content.end_with?("\n")
    end

    def trailing_whitespace?
      content.match?(/ $/)
    end

    private

    def read_yaml_and_content(filename)
      _content = File.read(filename)

      matchdata = _content.match(/\A(---\s*\n.*?\n?)^(---\s*$\n?)/m)
      _yaml = YAML.load(matchdata[1])  if matchdata

      [_yaml || {}, _content || ""]
    end

    def valid_string(obj)
      obj.is_a?(String) && !obj.empty?
    end
  end
end
