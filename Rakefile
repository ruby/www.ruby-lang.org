# encoding: utf-8
require 'fileutils'
require 'open-uri'
require 'rss'

gem 'spidr', '~> 0.4'
require 'spidr'

gem 'kramdown', '~> 0.14'
require 'kramdown'

HOST = 'www.ruby-lang.org'
OUTPUT_DIR = '_import'
LANGUAGES = %w[bg de en es fr id it ja ko pl pt tr zh_TW zh_cn]

def url_to_path(url)
  local_path = File.join(OUTPUT_DIR,url.path[1..-1])

  case File.extname(local_path)
  when '.html'
    local_path.chomp!('.html') << '.md'
  when ''
    local_path << '/' unless local_path.end_with?('/')
    local_path << 'index.md'
  end

  return local_path
end

def highlight(code, language_class)
  language = {
    'ruby-code'    => 'ruby',
    'symbols-code' => 'ruby',
    'sh-code'      => 'sh',
    'bash-code'    => 'sh',
    'java-code'    => 'java',
    'perl-code'    => 'perl',
    'python-code'  => 'python'
  }

  lang = language[language_class]
  if lang
    "{% highlight #{lang} %}\n" <<
    code << "\n" <<
    "{% endhighlight %}"
  else
    code << "\n{: .code}"
  end
end

def code_to_text(code_node)
  code_node.children.map { |node|
    if node.name == 'br'
      $/
    else
      node.inner_text
    end
  }.join
end

def html_to_markdown(content_div)
  # remove all comments
  content_div.traverse do |node|
    node.remove if node.comment?
  end

  # replace all page anchors with their text
  content_div.search('//a[@id]').each do |anchor|
    anchor.replace(anchor.inner_text)
  end

  # replace all caps spans with their text
  content_div.search('span.caps').each do |span|
    span.replace(span.inner_text)
  end

  # replace <code><pre> elements with <pre><code>
  content_div.search('code > pre').each do |pre|
    code = pre.parent.dup
    code.children.each {|child| child.unlink }
    code.content = pre.content
    pre.children.each {|child| child.unlink }
    pre << code

    pre.parent.replace(pre)
  end

  # add Jekyll highlight tag to all pre elements
  # with class="code xy-code"
  content_div.search('pre.code').each do |pre|
    classes = pre['class'].split
    next  unless classes.size == 2

    lang = classes.reject {|e| e == 'code' }.first

    # map all code elements to their inner_text
    pre.search('code').each do |code|
      code.content = highlight(code_to_text(code), lang)
    end
  end

  # map all code elements to their inner_text
  content_div.search('pre > code').each do |code|
    code.content = code_to_text(code)
  end

  # remove the 'class' attribute from all pre tags
  content_div.search('pre').remove_attr('class')

  # replace the #extended div with it's children
  if (extended_div = content_div.at('#extended'))
    extended_div.replace(extended_div.inner_html)
  end

  # convert from HTML to Markdown
  return Kramdown::Document.new(
    content_div.inner_html,
    :input => :html
  ).to_kramdown
end

namespace :import do
  desc "Spiders #{HOST} and converts HTML to Markdown"
  task :pages do
    Spidr.site("http://#{HOST}/index.html") do |agent|
      agent.ignore_links_like /\/cgi-bin\//
      agent.ignore_links_like /\.cgi[\/]?$/
      agent.ignore_links_like /\/[a-z_]+\/feeds\//
      agent.ignore_links_like /\/[a-z_]+\/old-man\//

      agent.every_ok_page do |page|
        local_path = url_to_path(page.url)

        # ensure the parent directory exists
        FileUtils.mkdir_p File.dirname(local_path)

        # don't overwrite existing files
        unless File.exist?(local_path)
          puts "Importing #{page.url} -> #{local_path} ..."

          File.open(local_path,'w') do |file|
            if page.html?
              title = page.title.strip
              lang  = local_path.split('/',3)[1]

              # add the YAML front matter
              file.puts(
                '---',
                "layout: page",
                "title: #{title.inspect}",
                "lang: #{lang}",
                '---',
                  ''
              )

              if (content_div = page.at('#content'))
                file.puts(html_to_markdown(content_div))
              end
            else
              file.write(page.body)
            end
          end
        end
      end
    end
  end

  desc "Spiders the news posts on #{HOST} and converts HTML to Markdown"
  task :news do
    by_lines = {
      'bg' => /Публикувана от (.+) на/,
      'de' => /Geschrieben von (.+) am/,
      'en' => /Posted by (.+) on/,
      'es' => /Publicado por (.+) el/,
      'fr' => /par (.+)/,
      'id' => /Ditulis oleh (.+) tanggal/,
      'it' => /Inserito da (.+) il/,
      'ja' => /Posted by (.+) on/,
      'ko' => /작성자 (.+) \(/,
      'pl' => /Zamieszczone przez (.+) \d+/,
      'pt' => /Escrito por (.+) em/,
      'tr' => /Posted by (.+) on/,
      'zh_TW' => /Posted by (.+) on/,
      'zh_cn' => /由 (.+) 发表于/
    }

    Spidr.host(HOST) do |agent|
      pubdates = {}

      LANGUAGES.each do |lang|
        feed, news_dir = case lang
                         when 'pt' then ['noticias', 'noticias-recentes']
                         else           ['news', 'news']
                         end

        agent.visit_urls_like do |url|
          url.path.start_with?("/#{lang}/#{news_dir}/")
        end

        agent.enqueue("http://#{HOST}/#{lang}/#{news_dir}/")

        pubdates[lang] = {}
        begin
          rss = RSS::Parser.parse(open("http://#{HOST}/#{lang}/feeds/#{feed}.rss"))
          rss.items.each do |item|
            puts "Queuing #{item.link} ..."
            agent.enqueue(item.link)
            pubdates[lang][item.link] = item.pubDate.utc
          end
        rescue OpenURI::HTTPError
        end
      end

      agent.every_ok_page do |page|
        lang, news_dir, year, month, day, slug = page.url.path[1..-2].split('/')
        title = page.title.strip

        if page.url.path =~ /^\/#{lang}\/#{news_dir}\/\d{4}\/\d{2}\/\d{2}\//
          # news post
          local_path = File.join(OUTPUT_DIR,lang,news_dir,'_posts',"#{year}-#{month}-#{day}-#{slug}.md")
          layout     = 'news_post'
          author     = nil
          pubdate    = pubdates[lang][page.url.to_s]

          archive_url = URI("http://#{HOST}/#{lang}/#{news_dir}/#{year}/#{month}/")
          begin
            agent.get_page(archive_url) do |archive|
              if archive.is_ok?
                if (post_div = archive.at("//div[@class='post']/h3/a[@href=#{page.url.path.dump}]/../.."))
                  post_info = post_div.at("p[@class='post-info']").inner_text

                  author = if (match = post_info.match(by_lines[lang]))
                             match[1]
                           else
                             ''
                           end
                end
              end
            end
          rescue Net::HTTPNotFound
          end
        else
          # archive page
          local_path = url_to_path(page.url)
          layout     = 'default'
        end

        # ensure the parent directory exists
        FileUtils.mkdir_p File.dirname(local_path)

        unless File.exists?(local_path)
          puts "Importing #{page.url} -> #{local_path} ..."

          File.open(local_path,'w') do |file|
            # add the YAML front matter
            file.puts(
              '---',
              "layout: #{layout}",
              "title: #{title.inspect}"
            )

            if author
              file.puts "author: #{author.inspect}"
            end

            if pubdate
              file.puts "date: #{pubdate.inspect}"
            end

            file.puts(
              "lang: #{lang}",
              '---',
              ''
            )

            content_div = page.at('div.post') || page.at('#content')

            file.puts(html_to_markdown(content_div))
          end
        end
      end
    end
  end
end

desc "Imports #{HOST}"
task :import => ['import:pages', 'import:news']

namespace :check do
  def author_variable_defined?(filename)
    match_data = File.read(filename).match(/\A---\n(.*?\n)---\n/m)
    return false  unless match_data
    front_matter = match_data[1]

    front_matter =~ /^author:.*$/
  end

  def lang_variable_defined?(filename)
    match_data = File.read(filename).match(/\A---\n(.*?\n)---\n/m)
    return false  unless match_data
    front_matter = match_data[1]

    front_matter =~ /^lang: [a-zA-Z_]*$/
  end

  desc "Checks for missing author variables in news posts"
  task :author do
    print "Checking for missing author variables in news posts..."

    md_files = Dir["**/_posts/*.md"]

    author_missing = md_files.select {|fn| !author_variable_defined?(fn) }
    if author_missing.empty?
      puts " ok"
    else
      puts "\nNo author variable defined in:"
      puts author_missing.map {|s| "  #{s}\n"}.join
    end
  end

  desc "Checks for missing lang variables in markdown files"
  task :lang do
    print "Checking for missing lang variables in markdown files..."

    md_files = Dir["**/*.md"]
    skip_patterns = [/README.md/, %r{[^/]*/examples/}]

    skip_patterns.each do |pattern|
      md_files.delete_if {|fn| fn =~ pattern }
    end

    lang_missing = md_files.select {|fn| !lang_variable_defined?(fn) }
    if lang_missing.empty?
      puts " ok"
    else
      puts "\nNo lang variable defined in:"
      puts lang_missing.map {|s| "  #{s}\n"}.join
    end
  end

  desc "Checks for broken links on http://localhost:4000/"
  task :links do
    url_map = Hash.new { |hash,key| hash[key] = [] }

    Spidr.site('http://localhost:4000/') do |agent|
      LANGUAGES.each do |lang|
        agent.enqueue("http://localhost:4000/#{lang}/")
      end

      agent.every_link do |origin,dest|
        url_map[dest] << origin
      end

      agent.every_page do |page|
        if page.code == 404
          origin = url_map[page.url].last
          dest   = page.url.request_uri

          external = URI::HTTP.build(
            :host  => HOST,
            :path  => page.url.path,
            :query => page.url.query
          )

          if Net::HTTP.get_response(external).code == '404'
            puts "Old Broken Link: #{origin} -> #{dest}"
          else
            puts "New Broken Link: #{origin} -> #{dest}"
          end
        end
      end
    end
  end
end

desc "Carries out some tests"
task :check => ['check:lang', 'check:author']
