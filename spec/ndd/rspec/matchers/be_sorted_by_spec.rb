# encoding: utf-8
require 'spec_helper'
require 'ndd/rspec/matchers'
require 'ndd/rspec/matchers/shared_examples'
require_relative 'duck'

describe 'be sorted by', {:type => 'matcher'} do

  SORTED_ARRAY = [1, 2, 3].freeze
  UNSORTED_ARRAY = [1, 3, 2].freeze

  it_behaves_like 'an RSpec matcher',
                  :valid_value => SORTED_ARRAY,
                  :invalid_value => UNSORTED_ARRAY do
    let(:matcher) { be_sorted_by(:to_i) }
  end

  context 'when the actual is sorted according to the given attribute' do
    it { expect(SORTED_ARRAY).to be_sorted_by(:to_i) }
  end

  context 'when the actual is not sorted according to the given attribute' do
    it { expect(UNSORTED_ARRAY).to_not be_sorted_by(:to_i) }
  end

  it 'describes itself' do
    matcher = be_sorted_by(:to_i)
    matcher.matches?(SORTED_ARRAY)
    expect(matcher.description).to eq("be sorted by 'to_i'")
  end

  it 'provides message on #failure_message' do
    matcher = be_sorted_by(:to_i)
    matcher.matches?(UNSORTED_ARRAY)

    expect(matcher.failure_message).to eq <<-MESSAGE

expected '[1, 3, 2]' to be sorted by 'to_i'
expected attributes: [1, 2, 3]
     got attributes: [1, 3, 2]

    MESSAGE
  end

  describe 'documentation' do
    describe 'sorting' do
      let(:a_pair_of_sorted_ducks) { [Duck.new('Grey'), Duck.new('White')] }
      let(:a_pair_of_reverse_sorted_ducks) { [Duck.new('White'), Duck.new('Grey')] }

      it { expect(a_pair_of_sorted_ducks).to be_sorted_by(:color) }
      it { expect(a_pair_of_reverse_sorted_ducks).to_not be_sorted_by(:color) }
    end
  end

end
