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

    def lang_missing?
      yaml["lang"].nil? || yaml["lang"].empty?
    end

    def lang_not_matching_filename?
      !lang_missing? && !filename.start_with?("#{yaml['lang']}/")
    end

    def author_missing?
      yaml["author"].nil? || yaml["author"].empty?
    end

    def date_mismatch?
      yaml_date_utc && (yaml_date_utc != slug_date)
    end

    def yaml_date_utc
      date = yaml["date"]

      date ? date.getutc.strftime('%Y/%m/%d') : nil
    end

    def slug_date
      File.basename(filename).split('-',4)[0..2].join('/')
    end

    def yaml_date_not_utc?
      date = yaml["date"]

      date ? date.utc_offset != 0 : nil
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
  end
end
