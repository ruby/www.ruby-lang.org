# frozen_string_literal: true

require "minitest/autorun"
require "fileutils"
require "pathname"


TEST_DIR = File.expand_path(__dir__)
TEMP_DIR = File.join(TEST_DIR, "tmp")


def setup_tempdir
  FileUtils.mkdir_p(TEMP_DIR)

  File.exist?(TEMP_DIR) ? TEMP_DIR : nil
end

def chdir_tempdir
  setup_tempdir  unless File.exist?(TEMP_DIR)
  Dir.chdir(TEMP_DIR)
end

def teardown_tempdir
  FileUtils.rm_rf(TEMP_DIR)  if File.exist?(TEMP_DIR)
end

def create_file(path, content)
  raise "path must be relative"  unless Pathname.new(path).relative?

  dir = File.dirname(path)
  FileUtils.mkdir_p(dir)
  File.write(path, content)
end

def linter_output
  stdout, _stderr = capture_io { Linter.new(exit_on_errors: false).run }

  stdout
end

def file_must_exist(filename)
  assert File.exist?(filename),
         "Expected file `#{filename}' to exist."
end

def file_wont_exist(filename)
  assert !File.exist?(filename),
         "Expected file `#{filename}' to not exist."
end
