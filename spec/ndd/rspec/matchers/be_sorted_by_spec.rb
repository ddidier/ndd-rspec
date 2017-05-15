require 'spec_helper'
require 'ndd/rspec/matchers/be_sorted_by'

RSpec.describe 'be sorted by' do

  SORTED_ARRAY = %w[1 2 3].freeze
  UNSORTED_ARRAY = %w[1 3 2].freeze

  # --------------------------------------------------------------------------------------------------------------------
  describe '#description' do
    it 'provides a description' do
      expect(be_sorted_by(:to_i).description)
        .to eq("be sorted by 'to_i'")
    end
  end

  # --------------------------------------------------------------------------------------------------------------------
  context 'when the actual array is sorted according to the given attribute' do
    subject { SORTED_ARRAY }

    it { is_expected.to be_sorted_by(:to_i) }
  end

  # --------------------------------------------------------------------------------------------------------------------
  context 'when the actual array is not sorted according to the given attribute' do
    subject { UNSORTED_ARRAY }

    it { is_expected.to_not be_sorted_by(:to_i) }

    it 'provides a failure message' do
      matcher = be_sorted_by(:to_i)
      matcher.matches?(subject)
      message = "expected '[\"1\", \"3\", \"2\"]'to be sorted by 'to_i' but\n"
      message << "  expected attributes: [1, 2, 3]\n"
      message << '  actual attributes: [1, 3, 2]'
      expect(matcher.failure_message).to eq(message)
    end
  end

end
