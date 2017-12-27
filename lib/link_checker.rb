gem "spidr", "~> 0.6"
require "spidr"

class LinkChecker

  # Check for broken links on http://localhost:localport/
  def check(localport:, languages:, host:)

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

          external = URI::HTTP.build(
            :host  => host,
            :path  => page.url.path,
            :query => page.url.query
          )

          if Net::HTTP.get_response(external).code == '404'
            puts "Old Broken Link: #{origin} -> #{dest}"
          else
            puts "New Broken Link: #{origin} -> #{dest}"
          end

          raise
        end
      end
    end
  end
end
