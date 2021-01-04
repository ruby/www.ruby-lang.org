# frozen_string_literal: true

require "minitest/autorun"
require_relative "../lib/linter"

SRCPATH = File.expand_path(__dir__)
FIXTURES_PATH = "#{SRCPATH}/fixtures"


describe Linter do

  before do
    @md_errors = "#{FIXTURES_PATH}/errors"

    @output_errors = File.read("#{FIXTURES_PATH}/output_errors.txt")
  end

  it "can find errors" do
    Dir.chdir @md_errors
    stdout, _stderr = capture_io { Linter.new(exit_on_errors: false).run }

    _(stdout).must_equal @output_errors
  end
end
