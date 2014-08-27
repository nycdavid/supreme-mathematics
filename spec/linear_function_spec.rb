require 'spec_helper'

describe SupremeMath::LinearFunction, 'slope and intercept' do
  before :each do
    @input_string = '3x + 4'
    @linear_function = SupremeMath::LinearFunction.new(@input_string)
  end

  it 'should properly identify the slope' do
    expect(@linear_function.slope).to eq(3)
  end

  it 'should properly indentify the y-intercept' do
    expect(@linear_function.y_intercept).to eq(4)
  end
end


