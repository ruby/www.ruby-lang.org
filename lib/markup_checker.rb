require "jekyll"

class MarkupChecker

  # Validate _site markup with validate-website
  def check
    options = Jekyll.configuration
    Dir.chdir("_site") do
      system("validate-website-static",
               "--verbose",
               "--exclude", "examples",
               "--site", "#{options['url']}/")
      exit($?.exitstatus)
    end
  end
end
