class Linter
  class Document

    attr_accessor :filename, :yaml

    def initialize(filename)
      @filename = filename
      @yaml = read_yaml(filename)
    end

    private

    def read_yaml(filename)
      matchdata = File.read(filename).match(/\A(---\s*\n.*?\n?)^(---\s*$\n?)/m)
      yaml = YAML.load(matchdata[1])  if matchdata

      yaml || {}
    end
  end
end
