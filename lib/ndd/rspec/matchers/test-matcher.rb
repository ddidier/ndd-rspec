# encoding: utf-8
require 'rspec/expectations'


module Ndd
  module RSpec
    module Matchers

      class BeEqualNdd

        attr_reader :actual, :expected

        def initialize(expected = nil)
          @expected = expected
        end

        def matches?(actual)
          @actual = actual
          @expected == @actual
        end

        def failure_message_for_should
          "expected '#{@actual.inspect}' to be equal to '#{@expected.inspect}'"
        end

        def failure_message_for_should_not
          assert_ivars :@actual, :@expected
          "expected '#{@actual.inspect}' to be different from '#{@expected.inspect}'"
        end

      end

    end
  end
end
