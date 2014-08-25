require 'spec_helper'

describe SupremeMath::PowerFunction, 'parsing' do
  it 'should parse case 2: x^a where x = 1/n and n is a positive integer' do
    @input_string = 'x^1/2'
    @power_function = SupremeMath::PowerFunction.new(@input_string)  

    expect(@power_function.coefficient).to eq(1)
    expect(@power_function.exponent).to eq(0.5)
  end
end
