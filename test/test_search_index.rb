# frozen_string_literal: true

require "helper"
require "json"
require_relative "../lib/search_index"

describe SearchIndex do
  before do
    setup_tempdir
    @bundle_dir = File.join(TEMP_DIR, "pagefind")
    FileUtils.mkdir_p(@bundle_dir)
    @entry_path = File.join(@bundle_dir, "pagefind-entry.json")
  end

  after do
    teardown_tempdir
  end

  def write_entry(languages)
    File.write(@entry_path, JSON.generate({ "version" => "1.5.2", "languages" => languages }))
  end

  def read_entry
    JSON.parse(File.read(@entry_path))
  end

  describe "#apply_fallbacks" do
    it "points a skipped language at the index it falls back to" do
      write_entry({
        "en" => { "hash" => "en_abc", "wasm" => "en", "page_count" => 563 },
        "ja" => { "hash" => "ja_def", "wasm" => nil, "page_count" => 541 },
      })

      SearchIndex.new(@bundle_dir).apply_fallbacks

      languages = read_entry["languages"]
      _(languages["bg"]).must_equal languages["en"]
    end

    it "does not fall back to the largest index" do
      write_entry({
        "en" => { "hash" => "en_abc", "wasm" => "en", "page_count" => 563 },
        "uk" => { "hash" => "uk_def", "wasm" => nil, "page_count" => 564 },
      })

      SearchIndex.new(@bundle_dir).apply_fallbacks

      languages = read_entry["languages"]
      _(languages["bg"]["hash"]).must_equal "en_abc"
    end

    it "leaves the other languages untouched" do
      write_entry({
        "en" => { "hash" => "en_abc", "wasm" => "en", "page_count" => 563 },
        "zh-cn" => { "hash" => "zh-cn_ghi", "wasm" => nil, "page_count" => 281 },
      })

      SearchIndex.new(@bundle_dir).apply_fallbacks

      languages = read_entry["languages"]
      _(languages["zh-cn"]["hash"]).must_equal "zh-cn_ghi"
      _(languages["en"]["hash"]).must_equal "en_abc"
    end

    it "warns when a language meant to be skipped was indexed anyway" do
      write_entry({
        "en" => { "hash" => "en_abc", "wasm" => "en", "page_count" => 563 },
        "bg" => { "hash" => "bg_xyz", "wasm" => nil, "page_count" => 60 },
      })

      _, stderr = capture_io { SearchIndex.new(@bundle_dir).apply_fallbacks }

      _(stderr).must_match(/"bg" was indexed/)
      _(read_entry["languages"]["bg"]["hash"]).must_equal "en_abc"
    end

    it "raises when the index it falls back to is missing" do
      write_entry({ "ja" => { "hash" => "ja_def", "wasm" => nil, "page_count" => 541 } })

      error = _(-> { SearchIndex.new(@bundle_dir).apply_fallbacks }).must_raise SearchIndex::Error
      _(error.message).must_match(/missing index "en"/)
    end

    it "raises when the bundle has no languages" do
      write_entry({})

      error = _(-> { SearchIndex.new(@bundle_dir).apply_fallbacks }).must_raise SearchIndex::Error
      _(error.message).must_match(/did the site build/)
    end

    it "raises when the bundle entry does not exist" do
      error = _(-> { SearchIndex.new(@bundle_dir).apply_fallbacks }).must_raise SearchIndex::Error
      _(error.message).must_match(/npm run build-search/)
    end
  end
end
