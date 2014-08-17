require_relative '../lib/polynomial' 

describe Polynomial, 'calculus operations' do
  before :all do
    @input_string = '4x^2 - 6x + 3'
  end

  it 'should properly calculate the coefficient and exponent of element 1' do
    @polynomial = Polynomial.new @input_string
    @polynomial.derivative

    expect(@polynomial.elements[0].coefficient).to eq(8)
    expect(@polynomial.elements[0].exponent).to eq(1)
  end
end
