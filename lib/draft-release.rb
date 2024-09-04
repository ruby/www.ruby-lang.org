require "erb"

template = File.read("lib/release-template.erb")
version = ARGV[0] || "3.3.4"

output_path = "en/news/_posts/ruby-#{Time.now.strftime("%Y-%m-%d")}-#{version.gsub(/\./, "-")}-released.md"

File.open(output_path, "w") do |file|
  file.write ERB.new(template).result(binding)
end
