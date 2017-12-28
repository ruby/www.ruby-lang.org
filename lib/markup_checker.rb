class MarkupChecker

  # Validate _site markup with validate-website
  def check(host:)
    url = "https://#{host}/"

    Dir.chdir("_site") do
      system("validate-website-static",
               "--verbose",
               "--exclude", "examples",
               "--site", "#{url}")
      exit($?.exitstatus)
    end
  end
end
