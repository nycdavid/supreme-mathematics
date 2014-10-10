require 'spec_helper'

describe FunctionParser, 'constants' do
  before :each do
    @parser = FunctionParser.new
  end

  it 'should handle single digit inputs' do
    exp = @parser.parse('5')

    expect(exp.evaluate).to eq(5)
  end

  it 'should handle the addition of two digits' do
    exp = @parser.parse('2 + 2')

    expect(exp.evaluate).to eq(4)
  end

end
