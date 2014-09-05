require "spec_helper"

describe SupremeMath::Function, 'parse the input string and return the correct object' do
  it 'should return a monomial' do
    @function = SupremeMath::Function.parse('x^2')
    expect(@function).to be_a SupremeMath::Monomial
  end
end

describe SupremeMath::Function, 'function evaluation with a numeric value' do
  it 'should evaluate the function f(x) for a given value of x' do
    @polynomial = SupremeMath::Polynomial.new('x^2 + 3')
    result = @polynomial.evaluate(3)
    expect(result).to eq(12)
  end

  it 'should properly evaluate f(x) with a negative coefficient' do
    @polynomial = SupremeMath::Polynomial.new('-x^2 + 3')
    result = @polynomial.evaluate(3)
    expect(result).to eq(-6)
  end

  it 'should properly evaluate f(x) in a polynomial with elements > 2' do
    @polynomial = SupremeMath::Polynomial.new('x^2 + 6x - 5')
    result = @polynomial.evaluate(2)
    expect(result).to eq(11)
  end
end

describe SupremeMath::Function, 'simplifying a function' do
  it 'should present a string representation of the function' do
    @polynomial = SupremeMath::Polynomial.new('x^2 + 2')
    expect(@polynomial.to_string).to eq('x^2 + 2')
  end

  it 'should combine like terms' do
    pending
    @polynomial = SupremeMath::Polynomial.new('x^2 + x^2')

    expect(@polynomial.terms.count).to eq(1)
    expect(@polynomial.terms.first.coefficient.value).to eq(2)
    expect(@polynomial.terms.first.base.value).to eq('x')
    expect(@polynomial.terms.first.exponent.value).to eq(2)
  end
end

describe SupremeMath::Function, 'abstract/algebraic function evaluation' do
  it 'should insert algebraic expressions in place of x in a function' do
    pending
    @polynomial = SupremeMath::Polynomial.new('x^2 + 3')
    result = @polynomial.evaluate('x + 2')
    expect(result).to be_a SupremeMath::Polynomial
    expect(result).to eq('(x + 2)^2 + 3')
  end
end

describe SupremeMath::Function, '#quadratic?' do
  it 'should return true for degree 2' do
    @polynomial = SupremeMath::Polynomial.new('x^2 + 2x')

    expect(@polynomial.quadratic?).to be true
  end

  it 'should return false for degree != 2' do
    @polynomial = SupremeMath::Polynomial.new('x^3 + 3x^2')

    expect(@polynomial.quadratic?).to be false
  end
end

describe SupremeMath::Function, '#linear?' do
  it 'should return true for degree 1' do
    @polynomial = SupremeMath::Polynomial.new('2x + 1')

    expect(@polynomial.linear?).to be true  
  end

  it 'should return false for degree != 1' do
    @polynomial = SupremeMath::Polynomial.new('2x^2 + 4x + 2')

    expect(@polynomial.linear?).to be false
  end
end

describe SupremeMath::Function, '#cubic?' do
  it 'should return true for degree 3' do
    @polynomial = SupremeMath::Polynomial.new('3x^3 + 2x^2')

    expect(@polynomial.cubic?).to be true
  end

  it 'should return false for degree != 3' do
    @polynomial = SupremeMath::Polynomial.new('3x^7 + 2x^3 + 4x')

    expect(@polynomial.cubic?).to be false
  end
end
