#!/usr/bin/env rspec
require 'spec_helper'

describe "the unique function" do
  before :all do
    Puppet::Parser::Functions.autoloader.loadall
  end

  before :each do
    @scope = Puppet::Parser::Scope.new
  end

  it "should exist" do
    Puppet::Parser::Functions.function("unique").should == "function_unique"
  end

  it "should raise a ParseError if there is less than 1 arguments" do
    lambda { @scope.function_unique([]) }.should( raise_error(Puppet::ParseError))
  end

  it "should remove duplicate elements in a string" do
    result = @scope.function_unique(["aabbc"])
    result.should(eq('abc'))
  end

  it "should remove duplicate elements in an array" do
    result = @scope.function_unique([["a","a","b","b","c"]])
    result.should(eq(['a','b','c']))
  end

end
