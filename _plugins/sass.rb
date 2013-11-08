module Jekyll
  require 'sass'
  require 'compass'
  class SassConverter < Converter
    safe true
    priority :low

    def matches(ext)
      ext =~ /scss/i
    end

    def output_ext(ext)
      ".css"
    end

    def convert(content)
      engine = Sass::Engine.new(content, :syntax => :scss, :load_paths => ["./stylesheets/"])
      engine.render
    rescue StandardError => e
      puts "!!! SASS Error: " + e.message
    end
  end
end