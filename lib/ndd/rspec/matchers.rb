# encoding: utf-8
require_relative 'matchers/be_reverse_sorted_by'
require_relative 'matchers/be_sorted_by'


module RSpec::Matchers
  include Ndd::RSpec::Matchers
end
