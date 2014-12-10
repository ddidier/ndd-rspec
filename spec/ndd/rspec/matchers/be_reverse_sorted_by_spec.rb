# encoding: utf-8
require 'spec_helper'
require 'ndd/rspec/matchers'
require 'ndd/rspec/matchers/shared_examples'


describe 'be reverse sorted by', {:type => 'matcher'} do

  REVERSE_SORTED_ARRAY = [3, 2, 1].freeze
  REVERSE_UNSORTED_ARRAY = [1, 3, 2].freeze

  it_behaves_like 'an RSpec matcher',
                  :valid_value => REVERSE_SORTED_ARRAY,
                  :invalid_value => REVERSE_UNSORTED_ARRAY do
    let(:matcher) { be_reverse_sorted_by(:to_i) }
  end

  context 'when the actual is sorted according to the given attribute in reverse order' do
    it { expect(REVERSE_SORTED_ARRAY).to be_reverse_sorted_by(:to_i) }
  end

  context 'when the actual is not sorted according to the given attribute in reverse order' do
    it { expect(REVERSE_UNSORTED_ARRAY).to_not be_reverse_sorted_by(:to_i) }
  end

  it 'describes itself' do
    matcher = be_reverse_sorted_by(:to_i)
    matcher.matches?(REVERSE_SORTED_ARRAY)
    expect(matcher.description).to eq("be sorted by 'to_i' in reverse order")
  end

  it 'provides message on #failure_message' do
    matcher = be_reverse_sorted_by(:to_i)
    matcher.matches?(REVERSE_UNSORTED_ARRAY)

    expect(matcher.failure_message).to eq <<-MESSAGE

expected '[1, 3, 2]' to be sorted by 'to_i' in reverse order
expected attributes: [3, 2, 1]
     got attributes: [1, 3, 2]

    MESSAGE
  end

  describe 'documentation' do
    Duck = Struct.new(:color)

    describe 'sorting' do
      let(:a_pair_of_sorted_ducks) { [Duck.new('Grey'), Duck.new('White')] }
      let(:a_pair_of_reverse_sorted_ducks) { [Duck.new('White'), Duck.new('Grey')] }

      it { expect(a_pair_of_sorted_ducks).to_not be_reverse_sorted_by(:color) }
      it { expect(a_pair_of_reverse_sorted_ducks).to be_reverse_sorted_by(:color) }
    end
  end

end
