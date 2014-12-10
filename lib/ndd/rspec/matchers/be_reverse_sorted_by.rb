# encoding: utf-8
require 'rspec/expectations'


module Ndd
  module RSpec
    module Matchers

      def be_reverse_sorted_by(attribute)
        BeReverseSortedBy.new(attribute)
      end

      # ----------------------------------------------------------------------------------------------------------------
      # Ensures that an enumerable (responding to {Enumerable#collect}) is sorted in reverse order by the
      # given attribute of the objects it contains.
      #
      # Examples:
      #   Duck = Struct.new(:color)
      #   [Duck.new('White'), Duck.new('Grey')].should be_sorted_by(:color) }
      #
      class BeReverseSortedBy

        def initialize(attribute = nil)
          @attribute = attribute
        end

        def matches?(actual)
          @actual = actual
          attributes = actual.collect { |e| e.send(@attribute) }
          @actual_attributes = attributes
          @sorted_attributes = attributes.sort.reverse
          @sorted_attributes == @actual_attributes
        end

        def description
          "be sorted by '#@attribute' in reverse order"
        end

        def failure_message
          return <<-MESSAGE

expected '#{@actual.inspect}' to be sorted by '#@attribute' in reverse order
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
