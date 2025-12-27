# frozen_string_literal: true

require 'set'

module Jekyll
  class FallbackGenerator < Generator
    priority :high

    def generate(site)
      @site = site
      @languages = site.data['languages'].map { |l| l['code'] }
      
      fallback_posts
      fallback_pages
    end

    def fallback_posts
      en_posts = @site.posts.docs.select { |p| p.data['lang'] == 'en' }
      
      existing_posts_by_lang = {}
      @site.posts.docs.each do |post|
        lang = post.data['lang']
        next unless lang
        existing_posts_by_lang[lang] ||= Set.new
        existing_posts_by_lang[lang] << File.basename(post.path)
      end

      new_posts = []
      en_posts.each do |en_post|
        filename = File.basename(en_post.path)
        
        @languages.each do |lang|
          next if lang == 'en'
          next if existing_posts_by_lang[lang]&.include?(filename)
          
          new_posts << create_fallback_doc(en_post, lang)
        end
      end
      
      @site.posts.docs.concat(new_posts)
      @site.posts.docs.sort!
      @site.instance_variable_set(:@categories, nil)
      @site.instance_variable_set(:@tags, nil)
    end

    def fallback_pages
      en_pages = @site.pages.select { |p| p.data['lang'] == 'en' }
      
      existing_pages_by_lang = {}
      @site.pages.each do |page|
        lang = page.data['lang']
        next unless lang
        existing_pages_by_lang[lang] ||= Set.new
        
        rel_path = page.path.sub(%r{^#{lang}/}, "")
        existing_pages_by_lang[lang] << rel_path
      end

      new_pages = []
      en_pages.each do |en_page|
        rel_path = en_page.path.sub(%r{^en/}, "")
        next if rel_path == en_page.path
        
        @languages.each do |lang|
          next if lang == 'en'
          next if existing_pages_by_lang[lang]&.include?(rel_path)
          next if rel_path.end_with?(".xml") || rel_path.end_with?(".rss")
          
          new_pages << create_fallback_page(en_page, lang, rel_path)
        end
      end
      @site.pages.concat(new_pages)
    end

    def create_fallback_doc(en_doc, lang)
      new_doc = en_doc.clone
      new_doc.instance_variable_set(:@data, en_doc.data.dup)
      
      new_doc.data['lang'] = lang
      new_doc.data['fallback'] = true
      new_doc.data['content_lang'] = 'en'
      new_doc.data['categories'] = [lang] + (en_doc.data['categories'] || []) - ['en']
      
      new_path = en_doc.path.sub('/en/', "/#{lang}/")
      new_doc.instance_variable_set(:@path, new_path)
      
      wrap_content(new_doc, en_doc, lang)
      new_doc
    end

    def create_fallback_page(en_page, lang, rel_path)
      new_page = en_page.clone
      new_page.instance_variable_set(:@data, en_page.data.dup)
      
      new_dir = File.join(lang, File.dirname(rel_path))
      new_page.instance_variable_set(:@dir, new_dir)
      new_page.instance_variable_set(:@path, File.join(lang, rel_path))
      
      new_page.data['lang'] = lang
      new_page.data['fallback'] = true
      new_page.data['content_lang'] = 'en'
      
      wrap_content(new_page, en_page, lang)
      new_page
    end

    def wrap_content(new_obj, en_obj, lang)
      notice = @site.data['locales'][lang]['fallback_notice'] rescue nil
      notice ||= @site.data['locales']['en']['fallback_notice'] rescue "Translated version not available"
      
      # Using a combination of Tailwind classes and inline styles to ensure visibility
      new_obj.content = <<~HTML
        <div class="fallback-notice bg-sky-50 dark:bg-sky-900/30 border border-sky-200 dark:border-sky-800 p-4 mb-8 rounded-lg text-sky-800 dark:text-sky-200">
          #{notice}
        </div>
        <div lang="en" markdown="1">
        #{en_obj.content}
        </div>
      HTML
    end
  end
end
