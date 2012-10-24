# encoding: utf-8
require_relative 'matchers/be_reverse_sorted_by'
require_relative 'matchers/be_sorted_by'

module Ndd
  module RSpec
    module Matchers

      def be_reverse_sorted_by(attribute)
        BeReverseSortedBy.new(attribute)
      end

      def be_sorted_by(attribute)
        BeSortedBy.new(attribute)
      end

    end
  end
end
