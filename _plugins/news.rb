# frozen_string_literal: true

require "date"

module Jekyll
  module News
    class ArchivePage < Page

      attr_reader :lang

      def initialize(site, base, subdir, layout, lang, posts)
        @site = site
        @base = base
        @dir  = if subdir
                  File.join(lang, news_dir, subdir)
                else
                  File.join(lang, news_dir)
                end
        @name = "index.html"

        @lang = lang

        process(@name)
        read_yaml(File.join(base, "_layouts"), layout)

        data["lang"]  = lang
        data["posts"] = posts.reverse
      end

      def news_dir
        "news"
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

      LAYOUT = "news_archive_month.html"

      def initialize(site, base, lang, year, month, posts)
        subdir = File.join(year.to_s, "%.2d" % month)

        super(site, base, subdir, LAYOUT, lang, posts)

        title = locales["monthly_archive_title"]

        data["title"] = insert_date(title, year, month)
        data["year"]  = year
      end
    end

    class YearlyArchive < ArchivePage

      LAYOUT = "news_archive_year.html"

      def initialize(site, base, lang, year, posts)
        subdir = year.to_s

        super(site, base, subdir, LAYOUT, lang, posts)

        title = locales["yearly_archive_title"]

        data["title"] = insert_date(title, year)
        data["year"]  = year

        months = posts.map {|post| post.date.month }.uniq
        month_link_text = locales["monthly_archive_link"]

        # hash with url => link_text (including year) elements
        data["months"] = Hash[
          months.map {|month| "%.2d" % month }.zip(
            months.map {|month| insert_date(month_link_text, year, month) }
          )
        ]
      end
    end

    class Index < ArchivePage

      LAYOUT = "news.html"

      MAX_POSTS = 10

      def initialize(site, base, lang, posts)
        subdir = nil
        super(site, base, subdir, LAYOUT, lang, posts)

        title = locales["recent_news"]

        data["title"] = title
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
    end
  end

  class GenerateNews < Generator

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
        index = News::Index.new(
          site,
          site.source,
          lang,
          years.values.map(&:values).flatten
        )

        site.pages << index

        years.each do |year, months|
          yearly_archive = News::YearlyArchive.new(
            site,
            site.source,
            lang,
            year,
            months.values.flatten
          )

          site.pages << yearly_archive

          months.each do |month, posts_for_month|
            monthly_archive = News::MonthlyArchive.new(
              site,
              site.source,
              lang,
              year,
              month,
              posts_for_month
            )

            site.pages << monthly_archive
          end
        end
      end
    end
  end
end
