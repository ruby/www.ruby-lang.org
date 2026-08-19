# frozen_string_literal: true

# Generates /llms.txt and /llms-full.txt (llmstxt.org) from the site
# itself, so neither can drift from the published pages. llms.txt lists
# every English page grouped by top-level section, with the title from
# the front matter and the first sentence of the page as description.
# llms-full.txt inlines the full Markdown of the same pages for tools
# that want the whole site in one fetch. News posts appear only as the
# ten latest links, because two decades of announcements would add over
# 1 MB of archival text. Rendering is shared with the .md alternates so
# the outputs stay identical to what those routes serve.
module LlmsTxt
  SITE_NAME = "Ruby Programming Language"
  TAGLINE = "Ruby is a dynamic, open source programming language " \
            "with a focus on simplicity and productivity. It has an " \
            "elegant syntax that is natural to read and easy to write."

  # Pages without a title (layout: null fragments such as the homepage
  # code examples) are not standalone documents and are left out.
  def self.pages(site)
    site.pages.select do |page|
      page.url.start_with?("/en/") && page.data["markdown_url"] && page.data["title"]
    end.sort_by(&:url)
  end

  def self.posts(site)
    site.posts.docs.select {|post| post.data["lang"] == "en" }.last(10).reverse
  end

  def self.header(site)
    stable = site.data["downloads"]["stable"].first
    "# #{SITE_NAME}\n\n> #{TAGLINE} The current stable version is Ruby #{stable}.\n"
  end

  # First sentence of the first prose paragraph, with images, links,
  # HTML tags, emphasis and kramdown attribute lines stripped.
  def self.description(markdown)
    markdown.split(/\n\s*\n/).each do |block|
      block = block.strip
      next if block.empty? || block.start_with?("<", "#", ">", "{%", "|", "*", "-", "!")

      text = block.lines.map(&:strip).reject {|line| line.start_with?("{:") }.join(" ")
      text = text.gsub(/!\[[^\]]*\](\([^)]*\)|\[[^\]]*\])?/, "")
                 .gsub(/\[([^\]]*)\](\([^)]*\)|\[[^\]]*\])/, '\1')
                 .gsub(/<[^>]+>/, " ")
                 .gsub(/[*_`]/, "")
                 .squeeze(" ").strip
      next if text.empty?

      return text[/\A.{10,}?[.!?](?=\s|\z)/m] || text[0, 200]
    end
    nil
  end

  def self.index(site, rendered)
    out = +header(site)

    pages(site).group_by {|page| page.url.split("/")[2] }.each do |slug, section|
      front = section.find {|page| page.url == "/en/#{slug}/" }
      out << "\n## #{front ? front.data["title"] : slug.capitalize}\n\n"
      section.each do |page|
        desc = description(rendered[page])
        out << "- [#{page.data["title"]}](#{site.config["url"]}#{page.data["markdown_url"]})"
        out << ": #{desc}" if desc
        out << "\n"
      end
    end

    out << "\n## Recent News\n\n"
    posts(site).each do |post|
      url = site.config["url"] + post.data["markdown_url"]
      out << "- [#{post.data["title"]}](#{url}): #{post.date.strftime("%Y-%m-%d")}\n"
    end

    out << "\n## Optional\n\n"
    out << "- [llms-full.txt](#{site.config["url"]}/llms-full.txt): " \
           "All English pages of this site concatenated into a single Markdown file\n"
  end

  def self.full(site, rendered)
    sections = pages(site).map do |page|
      "# #{page.data["title"]}\n\n" \
      "Source: #{site.config["url"]}#{page.data["markdown_url"]}\n\n" \
      "#{rendered[page]}\n"
    end

    ([header(site)] + sections).join("\n---\n\n")
  end
end

Jekyll::Hooks.register :site, :post_write do |site|
  rendered = LlmsTxt.pages(site).to_h do |page|
    [page, MarkdownAlternates.markdown_for(site, page).strip]
  end

  File.write(site.in_dest_dir("llms.txt"), LlmsTxt.index(site, rendered))
  File.write(site.in_dest_dir("llms-full.txt"), LlmsTxt.full(site, rendered))
end
