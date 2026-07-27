# frozen_string_literal: true

require "json"

# Post-processes the Pagefind bundle that `npm run build-search` writes into
# `_site/pagefind`.
#
# Pagefind builds one index per `lang` attribute it finds in the built site, and
# the browser picks an index by the `lang` of the page the visitor is on. For a
# language Pagefind cannot index well we skip indexing entirely (the layouts
# withhold `data-pagefind-body`), which leaves that language with no index of
# its own. Pagefind then falls back to whichever index holds the most pages,
# which is not a language we choose and shifts as translations are added. This
# rewrites the bundle entry so those languages point at a fixed index instead.
class SearchIndex
  # Languages skipped at index time, mapped to the index they search instead.
  # Pagefind has neither stemming nor UI translations for Bulgarian, so
  # Bulgarian pages search English content. The layouts and
  # `_includes/search.html` must agree with this mapping.
  FALLBACKS = { "bg" => "en" }.freeze

  class Error < StandardError; end

  def initialize(bundle_dir = "_site/pagefind")
    @entry_path = File.join(bundle_dir, "pagefind-entry.json")
  end

  def apply_fallbacks
    entry = read_entry
    languages = entry["languages"]
    raise Error, "No languages in #{@entry_path}, did the site build?" unless languages.is_a?(Hash) && !languages.empty?

    FALLBACKS.each do |from, to|
      target = languages[to]
      raise Error, "Cannot alias #{from.inspect} to missing index #{to.inspect}" unless target

      if languages.key?(from)
        warn "#{from.inspect} was indexed but is meant to fall back to #{to.inspect}; check that the layouts skip it."
      end

      languages[from] = target
    end

    File.write(@entry_path, JSON.generate(entry))
    entry
  end

  private

  def read_entry
    JSON.parse(File.read(@entry_path))
  rescue Errno::ENOENT
    raise Error, "#{@entry_path} is missing, run `npm run build-search` first"
  rescue JSON::ParserError => e
    raise Error, "#{@entry_path} is not valid JSON: #{e.message}"
  end
end
