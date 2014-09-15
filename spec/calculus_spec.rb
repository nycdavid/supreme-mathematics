require "spec_helper"

describe SupremeMath::Polynomial, 'calculus operations' do
  before :all do
    @input_string = '4x^2 - 6x + 3'
  end

  it 'should properly calculate the coefficient and exponent of element 1' do
    @polynomial = SupremeMath::Function.parse @input_string
    @polynomial.derivative

    expect(@polynomial.terms.all[0].coefficient).to eq(8)
    expect(@polynomial.terms.all[0].exponent).to eq(1)
  end
end
