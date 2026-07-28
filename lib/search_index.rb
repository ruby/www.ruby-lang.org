# frozen_string_literal: true

require "json"

# Builds the Pagefind search index over a written site and points the languages
# Pagefind cannot index at the one they fall back to.
#
# Pagefind reads the HTML Jekyll produced, so it can only run once the site has
# been written. Jekyll deletes anything in the destination that has no source
# counterpart, which includes the bundle from the previous build, so this runs
# after every write rather than once. _plugins/search_index.rb does the calling.
#
# Pagefind builds one index per `lang` attribute it finds and the browser picks
# an index by the `lang` of the page the visitor is on. The languages under
# `search.unsupported` in _config.yml are kept out of the index by the layouts,
# which leaves them with no index of their own. Pagefind then falls back to
# whichever index holds the most pages, a language we do not pick and that
# shifts as translations are added, so the bundle entry is rewritten to resolve
# them to `search.fallback` instead.
class SearchIndex
  class Error < StandardError; end

  PAGEFIND = File.join(File.expand_path("..", __dir__), "node_modules", ".bin", "pagefind").freeze

  def initialize(bundle_dir:, search_config:, pagefind: PAGEFIND)
    @bundle_dir = bundle_dir
    @entry_path = File.join(bundle_dir, "pagefind-entry.json")
    @search_config = search_config || {}
    @pagefind = pagefind
  end

  # Returns the bundle entry, or false without indexing when Pagefind is not
  # installed, so that editing content only needs Ruby. Everywhere the site is
  # published runs `npm ci` first.
  #
  # Pagefind runs silently because this fires on every rebuild under
  # `rake serve`; it still exits non-zero when it fails.
  def build
    unless File.executable?(@pagefind)
      warn "Search index skipped: #{@pagefind} is missing. Run `npm install` to search locally."
      return false
    end

    site_dir = File.dirname(@bundle_dir)
    raise Error, "Pagefind failed to index #{site_dir}" unless system(@pagefind, "--site", site_dir, "--silent")

    apply_fallbacks
  end

  # Maps each unsupported language to the language it searches instead, keyed the
  # way Pagefind keys its indexes.
  def fallbacks
    fallback = @search_config["fallback"]
    raise Error, "search.fallback is not configured" unless fallback.is_a?(String)

    Array(@search_config["unsupported"]).to_h { |lang| [index_key(lang), index_key(fallback)] }
  end

  def apply_fallbacks
    entry = read_entry
    languages = entry["languages"]
    raise Error, "No languages in #{@entry_path}, did the site build?" unless languages.is_a?(Hash) && !languages.empty?

    fallbacks.each do |from, to|
      target = languages[to]
      raise Error, "Cannot point #{from.inspect} at missing index #{to.inspect}" unless target

      if languages.key?(from)
        warn "#{from.inspect} was indexed but is meant to search #{to.inspect}; check that the layouts skip it."
      end

      languages[from] = target
    end

    File.write(@entry_path, JSON.generate(entry))
    entry
  end

  private

  # _config.yml and the site directories spell locales `zh_cn`, while Pagefind
  # keys its indexes off the `lang` attribute that _plugins/html_lang.rb writes
  # and lowercases it, giving `zh-cn`. Without this, a locale with a region
  # would be written under a key the browser never looks up.
  def index_key(lang)
    lang.tr("_", "-").downcase
  end

  def read_entry
    JSON.parse(File.read(@entry_path))
  rescue Errno::ENOENT
    raise Error, "#{@entry_path} is missing, Pagefind wrote no index"
  rescue JSON::ParserError => e
    raise Error, "#{@entry_path} is not valid JSON: #{e.message}"
  end
end
