require 'spec_helper'

describe 'User can input arithmetic operations' do
  before :each do
    @parser = FunctionParser.new
  end

  it 'should have arithmetic operations' do
    expression = '2 + 3 + 4'
    expect(@parser.parse(expression).evaluate).to eq(9)
  end
end
