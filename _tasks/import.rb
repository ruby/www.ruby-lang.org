gem 'spidr', '~> 0.3'
require 'spidr'
require 'fileutils'

desc 'Spiders ruby-lang.org and imports HTML content'
task :import do
  Spidr.site('http://www.ruby-lang.org/index.html') do |agent|
    agent.ignore_links_like /\/cgi-bin\//
    agent.ignore_links_like /\.cgi[\/]?$/
    agent.ignore_links_like /\/[a-z_]+\/old-man\//

    agent.every_failed_url do |url|
      puts "Not Found #{url}!"
    end

    agent.every_ok_page do |page|
      local_path = page.url.path[1..-1]

      if local_path[-1..-1] == '/'
        local_path += 'index.html'
      elsif File.extname(local_path) == ''
        local_path += '/index.html'
      end

      # ensure the parent directory exists
      FileUtils.mkdir_p(File.dirname(local_path))

      unless File.exist?(local_path)
        puts "Saving #{page.url} -> #{local_path} ..."

        File.open(local_path,'wb') do |file|
          if page.html?
            layout = 'default'
            title = page.title
            page_div = page.doc.at('#page')

            if (header = page_div.at('#head'))
              if (header.inner_text.strip == title)
                layout = 'page'
              end
            end

            file.puts(
              '---',
              "layout: #{layout}",
              "title: #{title}",
              '---'
            )

            if (layout == 'default' && page_div)
              file.puts(page_div.to_html)
            elsif (content_div = page_div.at('#content'))
              file.puts(content_div.inner_html)
            end
          else
            file.write(page.body)
          end
        end
      end
    end
  end
end
