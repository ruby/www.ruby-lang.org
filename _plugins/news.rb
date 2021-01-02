# frozen_string_literal: true

require "date"

module NewsArchivePlugin
  class ArchivePage < Jekyll::Page

    attr_reader :lang

    def initialize(site, lang, posts, year = nil, month = nil)
      @site = site
      @base = site.source
      @lang = lang
      @year = year  if year
      @month = month  if month

      @dir = archive_dir
      @name = "index.html"

      process(@name)
      @data ||= {}

      data["lang"] = lang
      data["posts"] = posts.reverse
      data["layout"] = layout
      data["title"] = title
    end

    def archive_dir
      File.join(lang, "news")
    end

    def layout
      raise NotImplementedError
    end

    def title
      raise NotImplementedError
    end

    def locales
      site.data["locales"][lang]["news"] ||
        site.data["locales"]["en"]["news"]
    end

    def month_names
      ["None"] + (site.data["locales"][lang]["month_names"] ||
                  site.data["locales"]["en"]["month_names"])
    end

    def insert_date(string, year, month = 0)
      substitutions = {
        "%Y" => year.to_s,
        "%m" => "%.2d" % month,
        "%-m" => month.to_s,
        "%B" => month_names[month]
      }

      string.gsub(/%Y|%m|%-m|%B/, substitutions)
    end
  end

  class MonthlyArchive < ArchivePage

    attr_reader :year, :month

    def initialize(site, lang, posts, year, month)
      super

      data["year"] = year
    end

    def archive_dir
      File.join(super, year.to_s, "%.2d" % month)
    end

    def layout
      "news_archive_month"
    end

    def title
      insert_date(locales["monthly_archive_title"], year, month)
    end
  end

  class YearlyArchive < ArchivePage

    attr_reader :year

    def initialize(site, lang, posts, year)
      super

      data["year"] = year

      months = posts.map {|post| post.date.month }.uniq
      month_link_text = locales["monthly_archive_link"]

      # hash with url => link_text (including year) elements
      data["months"] = Hash[
        months.map {|month| "%.2d" % month }.zip(
          months.map {|month| insert_date(month_link_text, year, month) }
        )
      ]
    end

    def archive_dir
      File.join(super, year.to_s)
    end

    def layout
      "news_archive_year"
    end

    def title
      insert_date(locales["yearly_archive_title"], year)
    end
  end

  class Index < ArchivePage

    MAX_POSTS = 10

    def initialize(site, lang, posts)
      super

      data["posts"] = posts.last(MAX_POSTS).reverse

      years = posts.map {|post| post.date.year }.uniq.reverse
      year_link_text = locales["yearly_archive_link"]

      # hash with url => link_text elements
      data["years"] = Hash[
        years.map(&:to_s).zip(
          years.map {|year| insert_date(year_link_text, year) }
        )
      ]
    end

    def layout
      "news"
    end

    def title
      locales["recent_news"]
    end
  end

  class NewsArchiveGenerator < Jekyll::Generator

    safe true
    priority :low

    def generate(site)
      posts = Hash.new do |hash, lang|
        hash[lang] = Hash.new do |years, year|
          years[year] = Hash.new do |months, month|
            months[month] = []
          end
        end
      end

      site.posts.docs.each do |post|
        lang = post.data["lang"]
        posts[lang][post.date.year][post.date.month] << post
      end

      posts.each do |lang, years|
        index = Index.new(
          site,
          lang,
          years.values.map(&:values).flatten
        )

        site.pages << index

        years.each do |year, months|
          yearly_archive = YearlyArchive.new(
            site,
            lang,
            months.values.flatten,
            year
          )

          site.pages << yearly_archive

          months.each do |month, posts_for_month|
            monthly_archive = MonthlyArchive.new(
              site,
              lang,
              posts_for_month,
              year,
              month
            )

            site.pages << monthly_archive
          end
        end
      end
    end
  end
end
