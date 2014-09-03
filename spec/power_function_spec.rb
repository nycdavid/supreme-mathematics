require 'spec_helper'

describe SupremeMath::PowerFunction, 'parsing case 1' do
  before :all do
    @input = 'x^2'
  end

  it 'should parse into monomial coefficient and exponent' do
    @power_function = SupremeMath::Function.parse(@input)

    expect(@power_function).to be_a SupremeMath::Monomial
    expect(@power_function.coefficient).to eq(1)
    expect(@power_function.exponent).to eq(2)
  end
end

describe SupremeMath::PowerFunction, 'parsing case 2' do
  before :all do
    @power_function = SupremeMath::Function.parse('x^1/2')
  end

  it 'should parse into PowerFunction' do
    expect(@power_function).to be_a SupremeMath::PowerFunction
  end

  it 'should evaluate the function properly for values of x' do
    expect(@power_function.evaluate(9)).to eq(3)
  end
end

describe SupremeMath::PowerFunction, 'invalid formats' do
end
