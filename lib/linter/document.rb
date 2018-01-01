class Linter
  class Document

    attr_accessor :filename, :yaml

    def initialize(filename)
      @filename = filename
      @yaml = read_yaml(filename)
    end

    def lang?
      yaml.has_key?("lang")
    end

    def author?
      yaml.has_key?("author")
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

    private

    def read_yaml(filename)
      matchdata = File.read(filename).match(/\A(---\s*\n.*?\n?)^(---\s*$\n?)/m)
      yaml = YAML.load(matchdata[1])  if matchdata

      yaml || {}
    end
  end
end
