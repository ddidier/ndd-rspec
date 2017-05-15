require 'rspec/expectations'

module Ndd
  module RSpec
    module Matchers #:nodoc:

      # Ensures that an enumerable responding to
      # {https://ruby-doc.org/core/Enumerable.html#method-i-collect Enumerable#collect} is sorted in reverse order by
      # the values of the given attribute or by return values of the given method.
      #
      # @example
      #
      #   REVERSE_SORTED_ARRAY = ['3', '2', '1'].freeze
      #   UNSORTED_ARRAY = ['1', '3', '2'].freeze
      #
      #   it { expect(SORTEDREVERSE_SORTED_ARRAY_ARRAY).to be_reverse_sorted_by(:to_i) }
      #   it { expect(UNSORTED_ARRAY).to_not be_reverse_sorted_by(:to_i) }
      #
      # @param attribute [Symbol] the attribute or the method to sort with.
      # @return [Ndd::RSpec::Matchers::BeReverseSortedBy]
      def be_reverse_sorted_by(attribute)
        BeReverseSortedBy.new(attribute)
      end

      # ------------------------------------------------------------------------------------------------------------
      # Implements {#be_reverse_sorted_by}.
      #
      class BeReverseSortedBy

        # @param attribute [Symbol] the attribute or the method to sort with.
        def initialize(attribute)
          @attribute = attribute
        end

        # @param actual [Object] the object being tested.
        # @return [Boolean] true if the object is reverse sorted according to the given attribute, false otherwise.
        def matches?(actual)
          @actual = actual
          attributes = actual.collect { |e| e.send(@attribute) }
          @actual_attributes = attributes
          @expected_attributes = attributes.sort.reverse
          @expected_attributes == @actual_attributes
        end

        # @return [String] a description of this matcher.
        def description
          "be sorted in reverse order by '#{@attribute}'"
        end

        # @return [String] details about the failure of this matcher.
        def failure_message
          message = ''
          message << "expected '#{@actual.inspect}'to be sorted in reverse order by '#{@attribute}' but\n"
          message << "  expected attributes: #{@expected_attributes.inspect}\n"
          message << "  actual attributes: #{@actual_attributes.inspect}"
          message
        end
      end

    end
  end
end
