require "spec_helper"

describe SupremeMath::Polynomial, 'calculus operations' do
  before :all do
    @input_string = '4x^2 - 6x + 3'
  end

  it 'should properly calculate the coefficient and exponent of element 1' do
    @polynomial = SupremeMath::Polynomial.new @input_string
    @polynomial.derivative

    expect(@polynomial.terms[0].coefficient.value).to eq(8)
    expect(@polynomial.terms[0].exponent.value).to eq(1)
  end
end
