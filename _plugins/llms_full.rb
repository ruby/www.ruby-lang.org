# frozen_string_literal: true

# Writes /llms-full.txt: every English page (news posts excluded, they
# would add over 1 MB of archival announcements) concatenated into one
# Markdown file, for LLM tools that want the whole site in a single
# fetch. Rendering is shared with the .md alternates so both stay
# identical. llms.txt links this file in its Optional section.
Jekyll::Hooks.register :site, :post_write do |site|
  pages = site.pages.select do |page|
    page.url.start_with?("/en/") && page.data["markdown_url"]
  end

  sections = pages.sort_by(&:url).map do |page|
    body = MarkdownAlternates.markdown_for(site, page).strip
    "# #{page.data["title"]}\n\nSource: #{site.config["url"]}#{page.data["markdown_url"]}\n\n#{body}\n"
  end

  header = <<~HEADER
    # Ruby Programming Language

    > Ruby is a dynamic, open source programming language with a focus on simplicity and productivity. This file contains all English pages of www.ruby-lang.org as Markdown. The current stable version is Ruby #{site.data["downloads"]["stable"].first}.
  HEADER

  File.write(site.in_dest_dir("llms-full.txt"), ([header] + sections).join("\n---\n\n"))
end
