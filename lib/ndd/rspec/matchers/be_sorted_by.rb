# encoding: utf-8
require 'rspec/expectations'


module Ndd
  module RSpec
    module Matchers

      # Ensures that an enumerable responding to {#collect} is sorted by the given attribute or method return value of
      # the objects it contains.
      #
      # @example
      #     Duck = Struct.new(:color)
      #
      #     describe 'sorting' do
      #       let(:a_pair_of_sorted_ducks)         { [Duck.new('Grey'), Duck.new('White')] }
      #       let(:a_pair_of_reverse_sorted_ducks) { [Duck.new('White'), Duck.new('Grey')] }
      #
      #       it { expect(a_pair_of_sorted_ducks).to             be_sorted_by(:color) }
      #       it { expect(a_pair_of_reverse_sorted_ducks).to_not be_sorted_by(:color) }
      #     end
      #
      # @param attribute [Symbol] the attribute or the method to sort with
      # @return [Ndd::RSpec::Matchers::BeSortedBy]
      #
      def be_sorted_by(attribute)
        BeSortedBy.new(attribute)
      end


      # @private
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

      private_constant :BeSortedBy

    end
  end
end
