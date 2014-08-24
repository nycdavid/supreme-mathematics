require "spec_helper"

describe SupremeMath::Polynomial, 'parsing binomials' do
  before :each do
    @input_string = '-5x + 3'
  end

  it 'should properly parse the number of elements of a binomial' do
    @polynomial = SupremeMath::Polynomial.new(@input_string)
    expect(@polynomial.elements.count).to eq(2)
  end

  it 'should instantiate monomials from the elements collection' do
    @polynomial = SupremeMath::Polynomial.new(@input_string)
    @polynomial.elements.each do |element|
      expect(element).to be_a SupremeMath::Monomial
    end
  end

  it 'should properly parse the exponent & coefficient of each element' do
    @polynomial = SupremeMath::Polynomial.new(@input_string)
    @polynomial.elements.each do |element|
      expect(element).to be_a SupremeMath::Monomial
    end

    expect(@polynomial.elements[0].coefficient).to eq(-5)
    expect(@polynomial.elements[0].exponent).to eq(1)

    expect(@polynomial.elements[1].coefficient).to eq(3)
    expect(@polynomial.elements[1].exponent).to eq(0)
  end

  it 'should properly parse exponent & coefficient in expression without whitespace' do
    @input_string.gsub!(/\s+/, '')
    @polynomial = SupremeMath::Polynomial.new(@input_string)
    
    expect(@polynomial.elements[0].coefficient).to eq(-5)
    expect(@polynomial.elements[0].exponent).to eq(1)

    expect(@polynomial.elements[1].coefficient).to eq(3)
    expect(@polynomial.elements[1].exponent).to eq(0)
  end
end

describe SupremeMath::Polynomial, 'parsing decimal coefficients' do
  before :all do 
    @polynomial = SupremeMath::Polynomial.new('-4.90t^2 + 0.96t + 449.36')
  end

  it 'should account for decimal/float coefficients' do
    expect(@polynomial.elements[0].coefficient).to eq(-4.90)
    expect(@polynomial.elements[1].coefficient).to eq(0.96)
    expect(@polynomial.elements[2].coefficient).to eq(449.36)
  end
end

describe SupremeMath::Polynomial, 'parsing polynomials of > 2 elements' do
  before :all do
    @input_string = '2x^2 - 4x + 6'
  end

  it 'should properly parse the number of elements' do
    @polynomial = SupremeMath::Polynomial.new(@input_string)
    expect(@polynomial.elements.count).to eq(3)
  end
  
  describe 'properly parsing coefficients and exponents' do
    before :all do
      @input_string = '2x^2 - 4x + 6'
      @polynomial = SupremeMath::Polynomial.new(@input_string)
    end

    it 'should parse the parts of element 1' do
      expect(@polynomial.elements[0].coefficient).to eq(2)
      expect(@polynomial.elements[0].exponent).to eq(2)
    end

    it 'should parse the parts of element 2' do
      expect(@polynomial.elements[1].coefficient).to eq(-4)
      expect(@polynomial.elements[1].exponent).to eq(1)
    end

    it 'should parse the parts of element 3' do
      expect(@polynomial.elements[2].coefficient).to eq(6)
      expect(@polynomial.elements[2].exponent).to eq(0)
    end
  end
end

describe SupremeMath::Polynomial, 'properly storing the base' do
  before :all do
    @input_string = '2x^2 - 4x + 6'
    @polynomial = SupremeMath::Polynomial.new(@input_string)
  end

  it 'should store the base of element 1' do
    expect(@polynomial.elements[0].base).to eq('x^2')
  end

  it 'should store the base of element 2' do
    expect(@polynomial.elements[1].base).to eq('x')
  end

  it 'should store the base of element 3' do
    expect(@polynomial.elements[2].base).to be_nil
  end
end

describe SupremeMath::Polynomial, 'parsing polynomials regardless of whitespace' do
  before :all do
    @input_string = '2x^2-4x+6'
    @polynomial = SupremeMath::Polynomial.new(@input_string)
  end

  it 'should parse the parts of element 1' do
    expect(@polynomial.elements[0].coefficient).to eq(2)
    expect(@polynomial.elements[0].exponent).to eq(2)
  end
  
  it 'should parse the parts of element 2' do
    expect(@polynomial.elements[1].coefficient).to eq(-4)
    expect(@polynomial.elements[1].exponent).to eq(1)
  end
  
  it 'should parse the parts of element 3' do
    expect(@polynomial.elements[2].coefficient).to eq(6)
    expect(@polynomial.elements[2].exponent).to eq(0)
  end
end

describe SupremeMath::Polynomial, '#to_string' do
  it 'should return a string representation of the polynomial' do
    @polynomial = SupremeMath::Polynomial.new('x^2 - 4x + 3')

    expect(@polynomial.to_string).to eq('x^2 - 4x + 3')
  end
  
  it 'should take Polynomial class elements as input' do
    @polynomial = SupremeMath::Polynomial.new('x^2')
    @expression_string = @polynomial.to_string

    expect(@expression_string).to eq('x^2')
  end

  it 'should convert a Polynomial (multiple elements)' do
    @polynomial = SupremeMath::Polynomial.new('x^2 + 4')
    @expression_string = @polynomial.to_string

    expect(@expression_string).to eq('x^2 + 4')
  end

  it 'should accommodate negative coefficients' do
    @polynomial = SupremeMath::Polynomial.new('-x^2')
    @expression_string = @polynomial.to_string

    expect(@expression_string).to eq('-x^2')
  end
end

describe SupremeMath::Polynomial, '#degree' do
  it 'should return an integer' do
    @polynomial = SupremeMath::Polynomial.new('-x^2')

    expect(@polynomial.degree).to be_a Integer
  end

  it 'should return the highest exponent as the degree' do
    @polynomial = SupremeMath::Polynomial.new('x^7 + 2x^6 + x^3 + 4')

    expect(@polynomial.degree).to eq(7)
  end
end
