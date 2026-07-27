# frozen_string_literal: true

require "helper"
require "json"
require "yaml"
require_relative "../lib/search_index"

describe SearchIndex do
  before do
    setup_tempdir
    @bundle_dir = File.join(TEMP_DIR, "pagefind")
    FileUtils.mkdir_p(@bundle_dir)
    @entry_path = File.join(@bundle_dir, "pagefind-entry.json")
    @config_path = File.join(TEMP_DIR, "_config.yml")
    write_config(fallback: "en", unsupported: ["bg"])
  end

  after do
    teardown_tempdir
  end

  def write_config(search)
    File.write(@config_path, YAML.dump({ "search" => search.transform_keys(&:to_s) }))
  end

  def write_entry(languages)
    File.write(@entry_path, JSON.generate({ "version" => "1.5.2", "languages" => languages }))
  end

  def read_entry
    JSON.parse(File.read(@entry_path))
  end

  def search_index
    SearchIndex.new(bundle_dir: @bundle_dir, config_path: @config_path)
  end

  describe "#fallbacks" do
    it "maps every unsupported language to the fallback language" do
      write_config(fallback: "en", unsupported: %w[bg xx])

      _(search_index.fallbacks).must_equal({ "bg" => "en", "xx" => "en" })
    end

    it "is empty when no language is unsupported" do
      write_config(fallback: "en", unsupported: [])

      _(search_index.fallbacks).must_be_empty
    end
  end

  describe "#apply_fallbacks" do
    it "points an unsupported language at the index it falls back to" do
      write_entry({
        "en" => { "hash" => "en_abc", "wasm" => "en", "page_count" => 563 },
        "ja" => { "hash" => "ja_def", "wasm" => nil, "page_count" => 541 },
      })

      search_index.apply_fallbacks

      languages = read_entry["languages"]
      _(languages["bg"]).must_equal languages["en"]
    end

    it "does not leave the fallback to the largest index" do
      write_entry({
        "en" => { "hash" => "en_abc", "wasm" => "en", "page_count" => 563 },
        "uk" => { "hash" => "uk_def", "wasm" => nil, "page_count" => 564 },
      })

      search_index.apply_fallbacks

      _(read_entry["languages"]["bg"]["hash"]).must_equal "en_abc"
    end

    it "leaves the other languages untouched" do
      write_entry({
        "en" => { "hash" => "en_abc", "wasm" => "en", "page_count" => 563 },
        "zh-cn" => { "hash" => "zh-cn_ghi", "wasm" => nil, "page_count" => 281 },
      })

      search_index.apply_fallbacks

      languages = read_entry["languages"]
      _(languages["zh-cn"]["hash"]).must_equal "zh-cn_ghi"
      _(languages["en"]["hash"]).must_equal "en_abc"
    end

    it "warns when a language meant to be skipped was indexed anyway" do
      write_entry({
        "en" => { "hash" => "en_abc", "wasm" => "en", "page_count" => 563 },
        "bg" => { "hash" => "bg_xyz", "wasm" => nil, "page_count" => 60 },
      })

      _, stderr = capture_io { search_index.apply_fallbacks }

      _(stderr).must_match(/"bg" was indexed/)
      _(read_entry["languages"]["bg"]["hash"]).must_equal "en_abc"
    end

    it "raises when the index it falls back to is missing" do
      write_entry({ "ja" => { "hash" => "ja_def", "wasm" => nil, "page_count" => 541 } })

      error = _(-> { search_index.apply_fallbacks }).must_raise SearchIndex::Error
      _(error.message).must_match(/missing index "en"/)
    end

    it "raises when the bundle has no languages" do
      write_entry({})

      error = _(-> { search_index.apply_fallbacks }).must_raise SearchIndex::Error
      _(error.message).must_match(/did the site build/)
    end

    it "raises when the bundle entry does not exist" do
      error = _(-> { search_index.apply_fallbacks }).must_raise SearchIndex::Error
      _(error.message).must_match(/npm run build-search/)
    end

    it "raises when the config has no search section" do
      write_entry({ "en" => { "hash" => "en_abc", "wasm" => "en", "page_count" => 563 } })
      File.write(@config_path, YAML.dump({ "url" => "https://www.ruby-lang.org" }))

      error = _(-> { search_index.apply_fallbacks }).must_raise SearchIndex::Error
      _(error.message).must_match(/No search section/)
    end
  end
end
