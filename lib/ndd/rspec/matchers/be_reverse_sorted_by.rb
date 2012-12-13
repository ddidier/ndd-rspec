# encoding: utf-8
require 'rspec/expectations'
require 'rspec/expectations/differ'


module Ndd
  module RSpec
    module Matchers

      def be_reverse_sorted_by(attribute)
        BeReverseSortedBy.new(attribute)
      end

      # ----------------------------------------------------------------------------------------------------------------
      # Ensures that an enumerable (responding to <code>Enumerable#collect</code>) is sorted by the given attribute in reverse order
      #
      # Examples:
      #   [MyObject.new(my_attribute: 2), MyObject.new(my_attribute: 1)].should be_reverse_sorted_by(:my_attribute) }
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

        def failure_message_for_should
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
