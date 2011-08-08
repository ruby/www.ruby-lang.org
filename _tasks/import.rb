require 'fileutils'

gem 'spidr', '~> 0.4'
require 'spidr'

gem 'kramdown', '~> 0.13'
require 'kramdown'

OUTPUT_DIR = '_import'
LAYOUTS = {
  :default => 'page',
  :post => 'news_post'
}

desc 'Spiders ruby-lang.org and imports HTML content'
task :import do
  Spidr.site('http://www.ruby-lang.org/index.html') do |agent|
    agent.ignore_links_like /\/cgi-bin\//
    agent.ignore_links_like /\.cgi[\/]?$/
    agent.ignore_links_like /\/[a-z_]+\/old-man\//

    agent.every_ok_page do |page|
      path = page.url.path[1..-1]

      layout = :default

      if path =~ %r{^[a-z_-]+/news/\d{4}/\d{1,2}/\d{1,2}/[^/]+/$}
        # map news posts in to news/_posts/
        dirs = path.split('/')
        local_path = File.join(OUTPUT_DIR,dirs[0,2],'_posts',dirs[2..-1].join('-')) + '.md'

        layout = :post
      else
        # normal page
        local_path = File.join(OUTPUT_DIR,path)

        case File.extname(local_path)
        when '.html'
          local_path.gsub!(/\.html$/,'.md')
        when ''
          local_path += '/' unless local_path.end_with?('/')
          local_path += 'index.md'
        end
      end

      # ensure the parent directory exists
      FileUtils.mkdir_p(File.dirname(local_path))

      # don't overwrite existing files
      unless File.exist?(local_path)
        puts "Saving #{page.url} -> #{local_path} ..."

        File.open(local_path,'w') do |file|
          if page.html?
            title = page.title.strip
            lang = path.split('/',2).first

            # add the YAML front matter
            file.puts(
              '---',
              "layout: #{LAYOUTS[layout]}",
              "title: #{title.dump}",
              "lang: #{lang}",
              '---',
              ''
            )

            if (content_div = page.at('#content'))
              # remove all comments
              content_div.traverse do |node|
                node.remove if node.comment?
              end

              # remove all page anchors
              content_div.search('//a[@id]').remove

              # replace all caps spans with their text
              content_div.search('span.caps').each do |span|
                span.replace(span.inner_text)
              end

              # map all code elements to their inner_text
              content_div.search('pre > code').each do |code|
                code.replace(code.children.map { |node|
                  if node.name == 'br'
                    $/
                  else
                    node.inner_text
                  end
                }.join)
              end

              # replace the #extended div with it's children
              if (extended_div = content_div.at('#extended'))
                extended_div.replace(extended_div.inner_html)
              end

              # convert from HTML to Markdown
              content = Kramdown::Document.new(
                content_div.inner_html,
                :input => :html
              ).to_kramdown

              file.puts(content)
            end
          else
            file.write(page.body)
          end
        end
      end
    end
  end
end
