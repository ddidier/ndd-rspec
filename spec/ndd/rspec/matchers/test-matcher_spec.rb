# encoding: utf-8
require 'spec_helper'
require 'ndd/rspec/matchers'


describe "test matcher", { :type => 'matcher' } do

  it "succeeds" do
    "a".should be_equal_ndd("a")
  end

  it "fails" do
    expect { "a".should be_equal_ndd("b") }.to raise_error RSpec::Expectations::ExpectationNotMetError
  end

end
