
class Linter

  # Checks that the releases listed in `_data/downloads.yml' are
  # consistent with `_data/releases.yml' and `_data/branches.yml'.
  class Downloads

    # identifier displayed in error messages
    attr_reader :name

    # maps sections of downloads.yml to the expected branch status
    SECTION_STATUS = {
      "stable" => "normal maintenance",
      "preview" => "preview",
      "security_maintenance" => "security maintenance",
      "eol" => "eol"
    }.freeze

    # branches with one of these statuses must be listed on the downloads page
    REQUIRED_STATUSES = ["normal maintenance", "security maintenance"].freeze

    def initialize(downloads, branches, release_versions)
      @downloads = downloads || {}
      @branches = branches || []
      @release_versions = release_versions

      @name = "Downloads data (in `#{Linter::DOWNLOADS_FILE}')"
    end

    def errors
      messages = []

      listed_branches = {}

      SECTION_STATUS.each do |section, expected_status|
        versions = @downloads[section] || []

        versions.each do |version|
          version = version.to_s

          unless @release_versions.include?(version)
            messages << "#{section}: Ruby #{version} not found in `#{Linter::RELEASES_FILE}'"
          end

          branch = branch_of(version)

          if branch.nil?
            messages << "#{section}: no branch for Ruby #{version} in `#{Linter::BRANCHES_FILE}'"
            next
          end

          listed_branches[branch["name"]] = section

          if branch["status"] != expected_status
            messages << "#{section}: Ruby #{version} belongs to branch #{branch['name']}" \
                        " whose status is `#{branch['status']}'" \
                        " (expected `#{expected_status}')"
          end
        end
      end

      @branches.each do |branch|
        next  unless REQUIRED_STATUSES.include?(branch["status"])
        next  if listed_branches.key?(branch["name"])

        messages << "no release of branch #{branch['name']}" \
                    " (status `#{branch['status']}') is listed"
      end

      (@downloads["stable_snapshots"] || []).each do |snapshot|
        version = snapshot["version"].to_s
        branch = @branches.find {|b| b["name"].to_s == version }

        if branch.nil?
          messages << "stable_snapshots: no branch #{version} in `#{Linter::BRANCHES_FILE}'"
        elsif branch["status"] == "eol"
          messages << "stable_snapshots: branch #{version} is EOL"
        end
      end

      messages
    end

    private

    # Returns the branch data for the branch the given version belongs to,
    # e.g. branch 3.3 for Ruby 3.3.12 or branch 2.0.0 for Ruby 2.0.0-p648.
    def branch_of(version)
      candidates = @branches.select do |branch|
        version.start_with?("#{branch['name']}.", "#{branch['name']}-")
      end

      candidates.max_by {|branch| branch["name"].to_s.length }
    end
  end
end
