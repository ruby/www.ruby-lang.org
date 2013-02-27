module Jekyll
  module News
    class ArchivePage < Page

      MONTHS = %w[None January February March April May June July August September October November December]

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

    end

    class MonthlyArchive < ArchivePage

      def initialize(site,base,lang,year,month,posts)
        super(site,base,'news_archive_month.html',lang,posts)

        @year  = year
        @month = month
        @dir   = File.join(@dir,@year.to_s,"%.2d" % @month)

        data['title'] = "#{MONTHS[@month]} #{@year} Archive"
        data['year']  = year
      end

    end

    class YearlyArchive < ArchivePage

      def initialize(site,base,lang,year,posts)
        super(site,base,'news_archive_year.html',lang,posts)

        @year = year
        @dir  = File.join(@dir,@year.to_s)

        data['title'] = "#{@year} Archive"

        months = posts.map { |post| post.date.month }.uniq

        data['year']   = year
        data['months'] = Hash[
          months.map { |month| "%.2d" % month }.zip(
            months.map { |month| MONTHS[month] }
          )
        ]
      end

    end
  end

  class Post

    def title
      data['title']
    end

    def lang
      data['lang']
    end

  end

  class GenerateNewsArchives < Generator

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
        years.each do |year,months|
          posts_for_year = months.values.flatten

          yearly_archive = News::YearlyArchive.new(
            site,
            site.source,
            lang,
            year,
            posts_for_year
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
