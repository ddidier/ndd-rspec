require 'spec_helper'
require 'ndd/rspec/matchers/be_reverse_sorted_by'

RSpec.describe 'be reverse sorted by' do

  REVERSE_SORTED_ARRAY = %w[3 2 1].freeze
  UNSORTED_ARRAY = %w[1 3 2].freeze

  # --------------------------------------------------------------------------------------------------------------------
  describe '#description' do
    it 'provides a description' do
      expect(be_reverse_sorted_by(:to_i).description)
        .to eq("be sorted in reverse order by 'to_i'")
    end
  end

  # --------------------------------------------------------------------------------------------------------------------
  context 'when the actual array is reverse sorted according to the given attribute' do
    subject { REVERSE_SORTED_ARRAY }

    it { is_expected.to be_reverse_sorted_by(:to_i) }
  end

  # --------------------------------------------------------------------------------------------------------------------
  context 'when the actual array is not reverse sorted according to the given attribute' do
    subject { UNSORTED_ARRAY }

    it { is_expected.to_not be_reverse_sorted_by(:to_i) }

    it 'provides a failure message' do
      matcher = be_reverse_sorted_by(:to_i)
      matcher.matches?(subject)
      message = "expected '[\"1\", \"3\", \"2\"]'to be sorted in reverse order by 'to_i' but\n"
      message << "  expected attributes: [3, 2, 1]\n"
      message << '  actual attributes: [1, 3, 2]'
      expect(matcher.failure_message).to eq(message)
    end
  end

end
