
require "helper"
require "linter"


describe Linter do

  before do
    chdir_tempdir

    create_file("_data/branches.yml", <<~YAML)
      - name: 3.4
        status: normal maintenance
      - name: 3.3
        status: security maintenance
      - name: 3.2
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
    YAML

    %w[3-4-1 3-3-1 3-2-1].each do |version|
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

  it "reports a stable release whose branch is in security maintenance" do
    create_file("_data/downloads.yml", <<~YAML)
      stable:
        - 3.4.1
        - 3.3.1
      eol:
        - 3.2.1
    YAML

    _(linter_output).must_match "stable: Ruby 3.3.1 belongs to branch 3.3 whose status is `security maintenance' (expected `normal maintenance')"
  end

  it "reports a security maintenance release whose branch is EOL" do
    create_file("_data/downloads.yml", <<~YAML)
      stable:
        - 3.4.1
        - 3.3.1
      security_maintenance:
        - 3.2.1
    YAML

    _(linter_output).must_match "security_maintenance: Ruby 3.2.1 belongs to branch 3.2 whose status is `eol' (expected `security maintenance')"
  end

  it "reports a maintained branch that is not listed" do
    create_file("_data/downloads.yml", <<~YAML)
      stable:
        - 3.4.1
    YAML

    _(linter_output).must_match "no release of branch 3.3 (status `security maintenance') is listed"
  end

  it "reports a listed version that has no release data" do
    create_file("_data/downloads.yml", <<~YAML)
      stable:
        - 3.4.2
      security_maintenance:
        - 3.3.1
    YAML

    _(linter_output).must_match "stable: Ruby 3.4.2 not found in `_data/releases.yml'"
  end

  it "reports a listed version that belongs to no branch" do
    create_file("_data/downloads.yml", <<~YAML)
      stable:
        - 3.4.1
      security_maintenance:
        - 3.3.1
      eol:
        - 3.1.1
    YAML

    _(linter_output).must_match "eol: no branch for Ruby 3.1.1 in `_data/branches.yml'"
  end

  it "reports a stable snapshot of an EOL branch" do
    create_file("_data/downloads.yml", <<~YAML)
      stable:
        - 3.4.1
      security_maintenance:
        - 3.3.1
      stable_snapshots:
        - branch: ruby_3_2
          version: '3.2'
    YAML

    _(linter_output).must_match "stable_snapshots: branch 3.2 is EOL"
  end

  it "reports a stable snapshot of an unknown branch" do
    create_file("_data/downloads.yml", <<~YAML)
      stable:
        - 3.4.1
      security_maintenance:
        - 3.3.1
      stable_snapshots:
        - branch: ruby_3_5
          version: '3.5'
    YAML

    _(linter_output).must_match "stable_snapshots: no branch 3.5 in `_data/branches.yml'"
  end
end
