# frozen_string_literal: true

class Linter

  class Document

    attr_accessor :filename, :yaml, :content

    attr_accessor :lang, :author, :translator, :date

    def initialize(filename)
      @filename = filename
      @yaml, @content = read_yaml_and_content(filename)

      @lang = yaml["lang"]
      @author = yaml["author"]
      @translator = yaml["translator"]
      @date = yaml["date"]
    end

    # identifier displayed in error messages
    def name
      filename
    end

    def post?
      filename.match? %r{/_posts/}
    end

    def release_post?
      post? && filename.match?(%r{released\.md})
    end

    # posts from before the migration to the Jekyll site
    # (they follow different rules; e.g. they have no YAML date variable,
    # filenames of translations differ from original `en' post, ...)
    def old_post?
      post? && Time.utc(*filename_date_string.split("/")) < Time.utc(2013, 4, 1)
    end

    def lang_invalid?
      lang.nil? || !valid_string(lang)
    end

    def lang_not_matching_filename?
      !lang_invalid? && !filename.start_with?("#{lang}/")
    end

    def author_invalid?
      author.nil? || !valid_string(author)
    end

    # translator variable must be present but can be nil
    def translator_missing?
      !yaml.key?("translator")
    end

    def translator_invalid?
      return nil  if translator.nil?

      !valid_string(translator)
    end

    def date_missing?
      date.nil?
    end

    def date_invalid?
      return nil  if date_missing?

      !date.is_a?(Time)
    end

    def date_mismatch?
      return nil  if date_missing? || date_invalid?

      date_utc_string != filename_date_string
    end

    def date_utc_string
      date.getutc.strftime("%Y/%m/%d")
    end

    def filename_date_string
      File.basename(filename).split("-", 4)[0..2].join("/")
    end

    def date_not_utc?
      return nil  if date_missing? || date_invalid?

      date.utc_offset != 0
    end

    def crlf_line_breaks?
      content.match?(/\r\n/)
    end

    def no_newline_at_eof?
      !content.end_with?("\n")
    end

    def blank_line_at_eof?
      content.end_with?("\n\n")
    end

    def trailing_whitespace?
      content.match?(/ $/)
    end

    def sha1_length_invalid?
      matchdata = content.match(/SHA1: *(?<sha>[{0-9a-f]*)/)
      return nil  unless matchdata
      return nil  if matchdata[:sha].start_with?("{{")  # {{ Liquid output }}

      matchdata[:sha].size != 40
    end

    def sha256_length_invalid?
      matchdata = content.match(/SHA256: *(?<sha>[{0-9a-f]*)/)
      return nil  unless matchdata
      return nil  if matchdata[:sha].start_with?("{{")  # {{ Liquid output }}

      matchdata[:sha].size != 64
    end

    def sha512_length_invalid?
      matchdata = content.match(/SHA512: *(?<sha>[{0-9a-f]*)/)
      return nil  unless matchdata
      return nil  if matchdata[:sha].start_with?("{{")  # {{ Liquid output }}

      matchdata[:sha].size != 128
    end

    private

    def read_yaml_and_content(filename)
      content = File.read(filename)

      matchdata = content.match(/\A(---\s*\n.*?\n?)^(---\s*$\n?)/m)
      yaml = YAML.load(matchdata[1], permitted_classes: [Date, Time])  if matchdata

      [yaml || {}, content || ""]
    end

    def valid_string(obj)
      obj.is_a?(String) && !obj.empty?
    end
  end
end
