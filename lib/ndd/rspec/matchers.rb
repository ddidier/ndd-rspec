# encoding: utf-8
require_relative 'matchers/test-matcher'

module Ndd
  module RSpec
    module Matchers

      def be_equal_ndd(expected)
        BeEqualNdd.new(expected)
      end

    end
  end
end
