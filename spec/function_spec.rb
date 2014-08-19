require_relative '../lib/function'

describe Function, 'function evaluation' do
  it 'should evaluate the function f(x) for a given value of x' do
    @polynomial = Polynomial.new('x^2 + 3')
    result = @polynomial.evaluate(3)
    expect(result).to eq(12)
  end
end
