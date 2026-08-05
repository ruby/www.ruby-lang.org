# frozen_string_literal: true

# Publishes the Markdown source of every page and news post next to its
# HTML page, so /en/about/ can also be fetched as /en/about.md. The copy
# is the source with the front matter stripped and Liquid evaluated,
# matching what the HTML page was rendered from.
module MarkdownAlternates
  FRONT_MATTER = Jekyll::Document::YAML_FRONT_MATTER_REGEXP

  def self.documents(site)
    site.pages + site.posts.docs
  end

  def self.alternate_url(page)
    return unless File.extname(page.relative_path) == ".md"
    return unless page.url.end_with?("/")

    page.url == "/" ? "/index.md" : "#{page.url.chomp("/")}.md"
  end

  def self.markdown_for(site, page)
    raw = File.read(site.in_source_dir(page.path), encoding: "bom|utf-8")
    raw = Regexp.last_match.post_match if raw =~ FRONT_MATTER

    payload = site.site_payload
    payload["page"] = page.to_liquid
    site.liquid_renderer.file(page.path)
        .parse(raw)
        .render!(payload, registers: { site: site, page: page })
  end
end

# Runs before generators, so only hand-written pages and posts are
# tagged; pages generated later (news archives) get no alternate.
Jekyll::Hooks.register :site, :post_read do |site|
  MarkdownAlternates.documents(site).each do |page|
    url = MarkdownAlternates.alternate_url(page)
    page.data["markdown_url"] = url if url
  end
end

Jekyll::Hooks.register :site, :post_write do |site|
  MarkdownAlternates.documents(site).each do |page|
    url = page.data["markdown_url"]
    next unless url

    path = site.in_dest_dir(url.delete_prefix("/"))
    FileUtils.mkdir_p(File.dirname(path))
    File.write(path, MarkdownAlternates.markdown_for(site, page))
  end
end
