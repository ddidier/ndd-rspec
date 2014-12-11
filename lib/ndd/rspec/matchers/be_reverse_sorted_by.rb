# encoding: utf-8
require 'rspec/expectations'


module Ndd
  module RSpec
    module Matchers

      # Ensures that an enumerable responding to {#collect} is sorted in reverse order by the given attribute or
      # method return value of the objects it contains.
      #
      # @example
      #     Duck = Struct.new(:color)
      #
      #     describe 'sorting' do
      #       let(:a_pair_of_sorted_ducks)         { [Duck.new('Grey'), Duck.new('White')] }
      #       let(:a_pair_of_reverse_sorted_ducks) { [Duck.new('White'), Duck.new('Grey')] }
      #
      #       it { expect(a_pair_of_sorted_ducks).to_not     be_reverse_sorted_by(:color) }
      #       it { expect(a_pair_of_reverse_sorted_ducks).to be_reverse_sorted_by(:color) }
      #     end
      #
      # @param attribute [Symbol] the attribute or the method to sort with
      # @return [Ndd::RSpec::Matchers::BeSortedBy]
      #
      def be_reverse_sorted_by(attribute)
        BeReverseSortedBy.new(attribute)
      end

      # @private
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

      private_constant :BeReverseSortedBy

    end
  end
end
