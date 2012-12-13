# encoding: utf-8
require 'spec_helper'
require 'ndd/rspec/matchers'
require 'ndd/rspec/matchers/shared_examples'


describe "be reverse sorted by", { :type => 'matcher' } do

  REVERSE_SORTED_ARRAY = [3, 2, 1].freeze
  UNSORTED_ARRAY = [1, 3, 2].freeze

  it_behaves_like "an RSpec matcher",
                  :valid_value => REVERSE_SORTED_ARRAY,
                  :invalid_value => UNSORTED_ARRAY do
    let(:matcher) { be_reverse_sorted_by(:to_i) }
  end

  it "matches when actual is sorted according to the given attribute in reverse order" do
    REVERSE_SORTED_ARRAY.should be_reverse_sorted_by(:to_i)
  end

  it "does not match when actual is not sorted according to the given attribute in reverse order" do
    UNSORTED_ARRAY.should_not be_reverse_sorted_by(:to_i)
  end

  it "describes itself" do
    matcher = be_reverse_sorted_by(:to_i)
    matcher.matches?(REVERSE_SORTED_ARRAY)
    matcher.description.should == "be sorted by 'to_i' in reverse order"
  end

  it "provides message on #failure_message" do
    matcher = be_reverse_sorted_by(:to_i)
    matcher.matches?(UNSORTED_ARRAY)

    matcher.failure_message_for_should.should == <<-MESSAGE

expected '[1, 3, 2]' to be sorted by 'to_i' in reverse order
expected attributes: [3, 2, 1]
     got attributes: [1, 3, 2]

    MESSAGE
  end

end
