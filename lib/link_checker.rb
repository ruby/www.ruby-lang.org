# frozen_string_literal: true

gem "spidr", "~> 0.6"
require "spidr"

class LinkChecker

  # Check for broken internal links on http://localhost:localport/
  def check(localport:, languages:)

    url_map = Hash.new { |hash,key| hash[key] = [] }

    Spidr.site("http://localhost:#{localport}/") do |agent|
      languages.each do |lang|
        agent.enqueue("http://localhost:#{localport}/#{lang}/")
      end

      agent.every_link do |origin,dest|
        url_map[dest] << origin
      end

      agent.every_page do |page|
        if page.code == 404
          origin = url_map[page.url].last
          dest   = page.url.request_uri

          puts "Broken Link: #{origin} -> #{dest}"
        end
      end
    end
  end
end
