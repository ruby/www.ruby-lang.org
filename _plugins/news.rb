require 'date'

module Jekyll
  module News
    class ArchivePage < Page

      MONTHS = {
        'de' => %W[None Januar Februar M\u00e4rz April Mai Juni Juli August September Oktober November Dezember],
        'en' => %w[None January February March April May June July August September October November December]
      }

      def initialize(site,base,layout,lang,posts)
        @site = site
        @base = base

        @lang    = lang
        @dir     = File.join(@lang,news_dir)
        @name    = 'index.html'

        process(@name)
        read_yaml(File.join(base, '_layouts'),layout)

        oldest_post = posts.max_by { |post| post.date }

        data['lang']  = @lang
        data['posts'] = posts.reverse
      end

      def news_dir
        if @lang == 'pt' then 'noticias'
        else                  'news'
        end
      end

      def locales
        @site.config['locales']['news'][@lang] || @site.config['locales']['news']['en']
      end

      def month_names
        MONTHS[@lang] || MONTHS['en']
      end

    end

    class MonthlyArchive < ArchivePage

      LAYOUT = 'news_archive_month.html'

      def initialize(site,base,lang,year,month,posts)
        super(site,base,LAYOUT,lang,posts)

        @year  = year
        @month = month
        @dir   = File.join(@dir,@year.to_s,"%.2d" % @month)

        title = locales['monthly_archive_title']

        data['title'] = title.gsub(/%Y|%m|%B/, {
                          '%Y' => @year.to_s,
                          '%m' => "%.2d" % @month,
                          '%B' => month_names[@month]
                        })
        data['year']  = year
      end

    end

    class YearlyArchive < ArchivePage

      LAYOUT = 'news_archive_year.html'

      def initialize(site,base,lang,year,posts)
        super(site,base,LAYOUT,lang,posts)

        @year = year
        @dir  = File.join(@dir,@year.to_s)

        title = locales['yearly_archive_title']

        data['title'] = title.gsub('%Y', @year.to_s)

        months = posts.map { |post| post.date.month }.uniq

        data['year']   = year
        data['months'] = Hash[
          months.map { |month| "%.2d" % month }.zip(
            months.map { |month| month_names[month] }
          )
        ]
      end

    end

    class Index < ArchivePage

      LAYOUT = 'news.html'

      MAX_POSTS = 5

      def initialize(site,base,lang,posts)
        super(site,base,LAYOUT,lang,posts)

        title = locales['recent_news']

        data['title'] = title
        data['years'] = posts.map { |post| post.date.year }.uniq.reverse
        data['posts'] = posts.last(MAX_POSTS).reverse
      end

    end
  end

  class Post

    def lang
      data['lang']
    end

    def title
      data['title']
    end

  end

  class GenerateNews < Generator

    safe true
    priority :low

    def generate(site)
      posts = Hash.new do |hash,lang|
        hash[lang] = Hash.new do |years,year|
          years[year] = Hash.new do |months,month|
            months[month] = []
          end
        end
      end

      site.posts.each do |post|
        posts[post.lang][post.date.year][post.date.month] << post
      end

      posts.each do |lang,years|
        index = News::Index.new(
          site,
          site.source,
          lang,
          years.values.map(&:values).flatten
        )

        index.render(site.layouts,site.site_payload)
        index.write(site.dest)
        site.pages << index

        years.each do |year,months|
          yearly_archive = News::YearlyArchive.new(
            site,
            site.source,
            lang,
            year,
            months.values.flatten
          )

          yearly_archive.render(site.layouts,site.site_payload)
          yearly_archive.write(site.dest)
          site.pages << yearly_archive

          months.each do |month,posts_for_month|
            monthly_archive = News::MonthlyArchive.new(
              site,
              site.source,
              lang,
              year,
              month,
              posts_for_month
            )

            monthly_archive.render(site.layouts,site.site_payload)
            monthly_archive.write(site.dest)
            site.pages << monthly_archive
          end
        end
      end
    end

  end
end
