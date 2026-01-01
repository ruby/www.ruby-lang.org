# Regenerate CSS when HTML/Markdown files or imported CSS partials change
# Detects changes in content files and CSS partials (e.g., _components/*.css, _variables.css)
# to trigger PostCSS rebuild via jekyll-postcss-v2 plugin

module Jekyll
  module PostcssTrigger
    class << self
      attr_accessor :last_check_time, :css_touched
    end
  end
end

Jekyll::Hooks.register :site, :post_read do |site|
  # Skip if not in incremental mode
  next unless site.config['incremental']

  # On first build, only record the check time
  if Jekyll::PostcssTrigger.last_check_time.nil?
    Jekyll::PostcssTrigger.last_check_time = Time.now
    Jekyll::PostcssTrigger.css_touched = false
    next
  end

  # Skip if CSS was already touched in this build
  next if Jekyll::PostcssTrigger.css_touched

  # Check if any HTML/Markdown files or included CSS files have changed
  content_patterns = %w[_layouts/**/*.html _includes/**/*.html *.html *.md */**/*.html */**/*.md stylesheets/**/_*.css stylesheets/_*/**/*.css]

  html_changed = false
  last_check = Jekyll::PostcssTrigger.last_check_time

  content_patterns.each do |pattern|
    Dir.glob(site.in_source_dir(pattern)).each do |file|
      next if file.start_with?(site.dest) # Exclude _site directory

      # Check if a file was modified since the last check
      if File.exist?(file) && File.mtime(file) > last_check
        html_changed = true
        Jekyll.logger.info "PostCSS Trigger:", "Detected change in #{File.basename(file)}"
        break
      end
    end
    break if html_changed
  end

  # Touch CSS file if HTML has changed
  if html_changed
    css_file = site.in_source_dir("stylesheets/main.css")
    if File.exist?(css_file)
      Jekyll.logger.info "PostCSS Trigger:", "Marking CSS for rebuild"
      FileUtils.touch(css_file)
      Jekyll::PostcssTrigger.css_touched = true
    end
  end

  # Update check time
  Jekyll::PostcssTrigger.last_check_time = Time.now
end

# Reset flag after build completes
Jekyll::Hooks.register :site, :post_write do |site|
  Jekyll::PostcssTrigger.css_touched = false
end
