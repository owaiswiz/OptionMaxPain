$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "option_max_pain"

require "minitest/autorun"
require "minitest/rg"
require "minitest/reporters"

Minitest::Reporters.use! Minitest::Reporters::DefaultReporter.new
