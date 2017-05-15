require 'ndd/rspec/matchers/be_reverse_sorted_by'
require 'ndd/rspec/matchers/be_sorted_by'

RSpec.configure do |config|
  config.include Ndd::RSpec::Matchers
end
