require "spec_helper"

describe SupremeMath::Function, 'function detection' do
  it 'should properly detect a linear function (polynomial)' do
    @linear_function = SupremeMath::Function.parse('3x + 4')

    expect(@linear_function).to be_a SupremeMath::LinearFunction
  end 

  it 'should return a QuadraticFunction' do
    @function = SupremeMath::Function.parse('x^2')

    expect(@function).to be_a SupremeMath::QuadraticFunction
  end
end

describe SupremeMath::Function, 'function evaluation with a numeric value' do
  it 'should evaluate the function f(x) for a given value of x' do
    @polynomial = SupremeMath::Function.parse('x^2 + 3')
    result = @polynomial.evaluate(3)
    expect(result).to eq(12)
  end

  it 'should properly evaluate f(x) with a negative coefficient' do
    @polynomial = SupremeMath::Function.parse('-x^2 + 3')
    result = @polynomial.evaluate(3)
    expect(result).to eq(-6)
  end

  it 'should properly evaluate f(x) in a polynomial with elements > 2' do
    @polynomial = SupremeMath::Function.parse('x^2 + 6x - 5')
    result = @polynomial.evaluate(2)
    expect(result).to eq(11)
  end

  it 'should properly evaluate f(x) with a rational independent var' do
    expression = SupremeMath::Function.parse('x^2 + 3')
    result = expression.evaluate('(1/4)')

    expect(result).to eq(49/16.to_r)
  end
end

describe SupremeMath::Function, 'abstract/algebraic function evaluation' do
  it 'should insert algebraic expressions in place of x in a function' do
    pending
    fail
    expression = SupremeMath::Function.parse('2x')
    evaluated_expression = expression.evaluate('x + 2')
  
    expect(evaluated_expression).to eq('2x + 4')
  end
end
