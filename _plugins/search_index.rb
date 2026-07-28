# frozen_string_literal: true

require_relative "../lib/search_index"

# Pagefind indexes the HTML Jekyll wrote, so it hangs off post_write rather than
# off a Rake task. That way `rake build`, `rake serve` and a bare `jekyll build`
# all end with a search index that matches the site they just produced.
Jekyll::Hooks.register :site, :post_write do |site|
  entry = SearchIndex.new(
    bundle_dir: File.join(site.dest, "pagefind"),
    search_config: site.config["search"],
  ).build

  next unless entry

  # The languages that fall back share another language's index, so count the
  # indexes rather than the keys pointing at them.
  indexes = entry["languages"].values.uniq
  pages = indexes.sum { |index| index["page_count"] }
  Jekyll.logger.info "Search index:", "#{indexes.size} languages, #{pages} pages"
end
