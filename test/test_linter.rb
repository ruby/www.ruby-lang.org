require "minitest/autorun"
require_relative "../lib/linter"

SRCPATH = File.expand_path(File.dirname(__FILE__))


describe Linter do

  before do
    @md_ok = "#{SRCPATH}/md_ok"
    @md_errors = "#{SRCPATH}/md_errors"

    @output_ok = File.read("#{SRCPATH}/output_ok.txt")
    @output_errors = File.read("#{SRCPATH}/output_errors.txt")
  end

  it "can run ok" do
    Dir.chdir @md_ok
    stdout, _stderr = capture_io { Linter.new(exit_on_errors: false).run }

    _(stdout).must_equal @output_ok
  end

  it "can find errors" do
    Dir.chdir @md_errors
    stdout, _stderr = capture_io { Linter.new(exit_on_errors: false).run }

    _(stdout).must_equal @output_errors
  end
end
