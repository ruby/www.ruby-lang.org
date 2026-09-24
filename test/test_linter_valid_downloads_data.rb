
require "helper"
require "linter"


describe Linter do

  before do
    chdir_tempdir

    @ok = "Checking markdown files... ok\n"

    create_file("_data/branches.yml", <<~YAML)
      - name: 3.4
        status: normal maintenance
      - name: 3.3
        status: security maintenance
      - name: 3.2
        status: eol
      - name: 2.0.0
        status: eol
    YAML

    create_file("_data/releases.yml", <<~YAML)
      - version: 3.4.1
        date: 2025-01-01
        post: /en/news/2025/01/01/ruby-3-4-1-released/
      - version: 3.3.1
        date: 2025-01-01
        post: /en/news/2025/01/01/ruby-3-3-1-released/
      - version: 3.2.1
        date: 2025-01-01
        post: /en/news/2025/01/01/ruby-3-2-1-released/
      - version: 2.0.0-p648
        date: 2025-01-01
        post: /en/news/2025/01/01/ruby-2-0-0-p648-released/
    YAML

    %w[3-4-1 3-3-1 3-2-1 2-0-0-p648].each do |version|
      create_file("en/news/_posts/2025-01-01-ruby-#{version}-released.md", <<~POST)
        ---
        layout: news_post
        title: "Ruby #{version.tr('-', '.')} Released"
        author: "author"
        translator:
        date: 2025-01-01 00:00:00 +0000
        lang: en
        ---

        Post.
      POST
    end
  end

  after do
    teardown_tempdir
  end

  it "checks ok for nonexistent downloads data file" do
    _(linter_output).must_equal @ok
  end

  it "checks ok for downloads data consistent with branches and releases" do
    create_file("_data/downloads.yml", <<~YAML)
      stable:
        - 3.4.1
      security_maintenance:
        - 3.3.1
      eol:
        - 3.2.1
        - 2.0.0-p648
      stable_snapshots:
        - branch: ruby_3_4
          version: '3.4'
        - branch: ruby_3_3
          version: '3.3'
    YAML

    _(linter_output).must_equal @ok
  end

  it "checks ok for downloads data with empty optional sections" do
    create_file("_data/branches.yml", <<~YAML)
      - name: 3.4
        status: normal maintenance
    YAML

    create_file("_data/downloads.yml", <<~YAML)
      preview:

      stable:
        - 3.4.1

      security_maintenance:

      eol:

      stable_snapshots:
    YAML

    _(linter_output).must_equal @ok
  end
end
