# frozen_string_literal: true

class MarkupChecker

  # Validate _site markup with validate-website
  def check
    Dir.chdir("_site") do
      system(
        "validate-website-static",
        "--verbose",
        "--exclude", "examples"
      )

      exit($?.exitstatus)
    end
  end
end
