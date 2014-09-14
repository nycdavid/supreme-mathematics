require "spec_helper"

describe SupremeMath::Polynomial, 'parsing binomials' do
  before :each do
    @input_string = '-5x + 3'
  end

  it 'should properly parse the number of elements of a binomial' do
    @polynomial = SupremeMath::Function.parse(@input_string)
    expect(@polynomial.terms.all.count).to eq(2)
  end

  it 'should instantiate monomials from the elements collection' do
    @polynomial = SupremeMath::Function.parse(@input_string)
    @polynomial.terms.all.each do |term|
      expect(term).to be_a SupremeMath::Term
    end
  end

  it 'should properly parse the exponent & coefficient of each element' do
    @polynomial = SupremeMath::Function.parse(@input_string)
    @polynomial.terms.all.each do |term|
      expect(term).to be_a SupremeMath::Term
    end

    expect(@polynomial.terms.variables[0].coefficient).to eq(-5)
    expect(@polynomial.terms.variables[0].exponent).to eq(1)

    expect(@polynomial.terms.constant.value).to eq(3)
    expect(@polynomial.terms.constant.exponent).to eq(0)
  end

  it 'should properly parse exponent & coefficient in expression without whitespace' do
    @input_string.gsub!(/\s+/, '')

    expect(@input_string).to eq('-5x+3')

    @polynomial = SupremeMath::Function.parse(@input_string)

    expect(@polynomial.terms.variables[0].coefficient).to eq(-5)
    expect(@polynomial.terms.variables[0].exponent).to eq(1)

    expect(@polynomial.terms.constant.value).to eq(3)
    expect(@polynomial.terms.constant.exponent).to eq(0)
  end
end

describe SupremeMath::Polynomial, 'parsing decimal coefficients' do
  before :all do 
    input = '-4.90t^2 + 0.96t + 449.36'
    @polynomial = SupremeMath::Function.parse('-4.90t^2 + 0.96t + 449.36')
  end

  it 'should account for decimal/float coefficients' do
    expect(@polynomial.terms.variables[0].coefficient).to eq(-4.90)
    expect(@polynomial.terms.variables[1].coefficient).to eq(0.96)
    expect(@polynomial.terms.constant.value).to eq(449.36)
  end
end

describe SupremeMath::Polynomial, 'parsing polynomials of > 2 elements' do
  before :all do
    @input_string = '2x^2 - 4x + 6'
  end

  it 'should properly parse the number of elements' do
    @polynomial = SupremeMath::Function.parse(@input_string)
    expect(@polynomial.terms.all.count).to eq(3)
  end
  
  describe 'properly parsing coefficients and exponents' do
    before :all do
      @input_string = '2x^2 - 4x + 6'
      @polynomial = SupremeMath::Function.parse(@input_string)
    end

    it 'should parse the parts of element 1' do
      expect(@polynomial.terms.all[0].coefficient).to eq(2)
      expect(@polynomial.terms.all[0].exponent).to eq(2)
    end

    it 'should parse the parts of element 2' do
      expect(@polynomial.terms.all[1].coefficient).to eq(-4)
      expect(@polynomial.terms.all[1].exponent).to eq(1)
    end

    it 'should parse the parts of element 3' do
      expect(@polynomial.terms.constant.value).to eq(6)
      expect(@polynomial.terms.constant.exponent).to eq(0)
    end
  end
end

describe SupremeMath::Polynomial, 'properly storing the base' do
  before :all do
    @input_string = '2x^2 - 4x + 6'
    @polynomial = SupremeMath::Function.parse(@input_string)
  end

  it 'should store the base of element 1' do
    expect(@polynomial.terms.all[0].base).to eq('x')
  end

  it 'should store the base of element 2' do
    expect(@polynomial.terms.all[1].base).to eq('x')
  end
end

describe SupremeMath::Polynomial, 'parsing polynomials regardless of whitespace' do
  before :all do
    @input_string = '2x^2-4x+6'
    @polynomial = SupremeMath::Function.parse(@input_string)
  end

  it 'should parse the parts of element 1' do
    expect(@polynomial.terms.all[0].coefficient).to eq(2)
    expect(@polynomial.terms.all[0].exponent).to eq(2)
  end
  
  it 'should parse the parts of element 2' do
    expect(@polynomial.terms.all[1].coefficient).to eq(-4)
    expect(@polynomial.terms.all[1].exponent).to eq(1)
  end
  
  it 'should parse the parts of element 3' do
    expect(@polynomial.terms.constant.value).to eq(6)
  end
end

describe SupremeMath::Polynomial, 'parsing polynomials with rational coefficients' do
  before :all do
    @input_string = '2x^2 + (3/4)x'  
    @polynomial = SupremeMath::Function.parse(@input_string)
  end

  it 'should be the right type' do
    expect(@polynomial).to be_a SupremeMath::Polynomial
  end
end

describe SupremeMath::Polynomial, '#to_string' do
  it 'should return a string representation of the polynomial' do
    @polynomial = SupremeMath::Function.parse('x^2 - 4x + 3')

    expect(@polynomial.to_string).to eq('x^2 - 4x + 3')
  end
  
  it 'should take Polynomial class elements as input' do
    @polynomial = SupremeMath::Function.parse('x^2')
    @expression_string = @polynomial.to_string

    expect(@expression_string).to eq('x^2')
  end

  it 'should convert a Polynomial (multiple elements)' do
    @polynomial = SupremeMath::Function.parse('x^2 + 4')
    @expression_string = @polynomial.to_string

    expect(@expression_string).to eq('x^2 + 4')
  end

  it 'should accommodate negative coefficients' do
    @polynomial = SupremeMath::Function.parse('-x^2')

    expect(@polynomial.to_string).to eq('-x^2')
  end
end

describe SupremeMath::Polynomial, '#degree' do
  it 'should return an integer' do
    @polynomial = SupremeMath::Function.parse('-x^2')

    expect(@polynomial.degree).to be_a Integer
  end

  it 'should return the highest exponent as the degree' do
    @polynomial = SupremeMath::Function.parse('x^7 + 2x^6 + x^3 + 4')

    expect(@polynomial.degree).to eq(7)
  end
end

describe SupremeMath::Function, '#quadratic?' do
  it 'should return true for degree 2' do
    @polynomial = SupremeMath::Function.parse('x^2 + 2x')

    expect(@polynomial.quadratic?).to be true
  end

  it 'should return false for degree != 2' do
    @polynomial = SupremeMath::Function.parse('x^3 + 3x^2')

    expect(@polynomial.quadratic?).to be false
  end
end

describe SupremeMath::Function, '#linear?' do
  it 'should return true for degree 1' do
    @polynomial = SupremeMath::Function.parse('2x + 1')

    expect(@polynomial.linear?).to be true  
  end

  it 'should return false for degree != 1' do
    @polynomial = SupremeMath::Function.parse('2x^2 + 4x + 2')

    expect(@polynomial.linear?).to be false
  end
end

describe SupremeMath::Function, '#cubic?' do
  it 'should return true for degree 3' do
    @polynomial = SupremeMath::Function.parse('3x^3 + 2x^2')

    expect(@polynomial.cubic?).to be true
  end

  it 'should return false for degree != 3' do
    @polynomial = SupremeMath::Function.parse('3x^7 + 2x^3 + 4x')

    expect(@polynomial.cubic?).to be false
  end
end
