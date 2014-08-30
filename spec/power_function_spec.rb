require 'spec_helper'

describe SupremeMath::PowerFunction, 'parsing case 1' do
  before :all do
    @input = 'x^2'
  end

  it 'should parse as a monomial' do
    @power_function = SupremeMath::PowerFunction.new(@input)

    expect(@power_function.coefficient).to eq(1)
    expect(@power_function.exponent).to eq(2)
  end
end

describe SupremeMath::PowerFunction, 'invalid formats' do
end
