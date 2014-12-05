# encoding: utf-8
require 'rubygems'
require 'spork'


# ----------------------------------------------------------------------------------------------------------------------
# Spork prefork
# Loading more in this block will cause your tests to run faster. However, if you change any
# configuration or code from libraries loaded here, you'll need to restart spork for it take effect.
# ----------------------------------------------------------------------------------------------------------------------

lib_path = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
spec_dir = File.dirname(__FILE__)

Spork.prefork do

  # ----- load path

  $LOAD_PATH.unshift(lib_path)
  $LOAD_PATH.unshift(spec_dir)

  # ----- code coverage

  if ENV['COVERAGE'] and not ENV['DRB']
    require 'simplecov'
    SimpleCov.start 'test_frameworks'
  end

  # ----- requirements

  require 'rspec'
  require 'ndd/rspec/matchers'

  # ----- RSpec configuration

  RSpec.configure do |config|

    config.mock_with :rspec

    # ----- filters
    config.alias_example_to :fit, :focused
    config.filter_run_including :focused
    config.order = 'random'
    config.run_all_when_everything_filtered = true
    config.expect_with :rspec do |c|
      c.syntax = :expect
    end

    # ----- libraries
    config.include Ndd::RSpec::Matchers, :type => :matcher
  end

end


# ----------------------------------------------------------------------------------------------------------------------
# Spork each_run
# This code will be run each time you run your specs.
# ----------------------------------------------------------------------------------------------------------------------

Spork.each_run do

  # ----- code coverage

  # if ENV['COVERAGE'] and not ENV['DRB']
  #   require 'simplecov'
  #   SimpleCov.start 'test_frameworks'
  # end

  # ----- files reload
  Dir["#{lib_path}/**/*.rb"].each { |file| require file }
  Dir["#{spec_dir}/support/**/*.rb"].each { |file| require file }

  require 'ndd/rspec/matchers'
end
