# frozen_string_literal: true

require "json"
require "yaml"

# Post-processes the Pagefind bundle that `npm run build-search` writes into
# `_site/pagefind`.
#
# Pagefind builds one index per `lang` attribute it finds in the built site, and
# the browser picks an index by the `lang` of the page the visitor is on. The
# languages under `search.unsupported` in _config.yml are left out of the index
# by the layouts, which leaves them with no index of their own. Pagefind then
# falls back to whichever index holds the most pages, a language we do not pick
# and that shifts as translations are added. This rewrites the bundle entry so
# those languages resolve to `search.fallback` instead.
class SearchIndex
  class Error < StandardError; end

  def initialize(bundle_dir: "_site/pagefind", config_path: "_config.yml")
    @entry_path = File.join(bundle_dir, "pagefind-entry.json")
    @config_path = config_path
  end

  # Maps each unsupported language to the language it searches instead.
  def fallbacks
    config = read_config
    fallback = config["fallback"]
    raise Error, "search.fallback is not set in #{@config_path}" unless fallback.is_a?(String)

    Array(config["unsupported"]).to_h { |lang| [lang, fallback] }
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

  def read_config
    config = YAML.load_file(@config_path)["search"]
    raise Error, "No search section in #{@config_path}" unless config.is_a?(Hash)

    config
  rescue Errno::ENOENT
    raise Error, "#{@config_path} is missing"
  end

  def read_entry
    JSON.parse(File.read(@entry_path))
  rescue Errno::ENOENT
    raise Error, "#{@entry_path} is missing, run `npm run build-search` first"
  rescue JSON::ParserError => e
    raise Error, "#{@entry_path} is not valid JSON: #{e.message}"
  end
end
