# encoding: utf-8
require 'rspec/expectations'
# require 'rspec/expectations/differ'


module Ndd
  module RSpec
    module Matchers

      def be_sorted_by(attribute)
        BeSortedBy.new(attribute)
      end

      # ----------------------------------------------------------------------------------------------------------------
      # Ensures that an enumerable (responding to <code>Enumerable#collect</code>) is sorted by the given attribute of
      # the objects it contains.
      #
      # Examples:
      #   Duck = Struct.new(:color)
      #   [Duck.new('Grey'), Duck.new('White')].should be_sorted_by(:color) }
      #
      class BeSortedBy

        def initialize(attribute = nil)
          @attribute = attribute
        end

        def matches?(actual)
          @actual = actual
          attributes = actual.collect { |e| e.send(@attribute) }
          @actual_attributes = attributes
          @sorted_attributes = attributes.sort
          @sorted_attributes == @actual_attributes
        end

        def description
          "be sorted by '#@attribute'"
        end

        def failure_message
          return <<-MESSAGE

expected '#{@actual.inspect}' to be sorted by '#@attribute'
expected attributes: #{@sorted_attributes.inspect}
     got attributes: #{@actual_attributes.inspect}

          MESSAGE
        end

        def ==(other)
          matches?(other)
        end

      end

    end
  end
end
