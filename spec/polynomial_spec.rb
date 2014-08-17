require 'pry'

describe Polynomial, 'parsing binomials' do
  before :each do
    @input_string = '-5x + 3'
  end

  it 'should properly parse the number of elements of a binomial' do
    @polynomial = Polynomial.new(@input_string)
    expect(@polynomial.elements.count).to eq(2)
  end

  it 'should instantiate monomials from the elements collection' do
    @polynomial = Polynomial.new(@input_string)
    @polynomial.elements.each do |element|
      expect(element).to be_a Monomial
    end
  end

  it 'should properly parse the exponent & coefficient of each element' do
    @polynomial = Polynomial.new(@input_string)
    @polynomial.elements.each do |element|
      expect(element).to be_a Monomial
    end

    expect(@polynomial.elements[0].coefficient).to eq(-5)
    expect(@polynomial.elements[0].exponent).to eq(1)

    expect(@polynomial.elements[1].coefficient).to eq(3)
    expect(@polynomial.elements[1].exponent).to eq(0)
  end

  it 'should properly parse exponent & coefficient in expression without whitespace' do
  end
end

describe Polynomial, 'parsing polynomials of > 2 elements' do
  before :all do
    @input_string = '2x^2 - 4x + 6'
  end

  it 'should properly parse the number of elements' do
    @polynomial = Polynomial.new(@input_string)
    expect(@polynomial.elements.count).to eq(3)
  end
  
  describe 'properly parsing coefficients and exponents' do
    before :all do
      @input_string = '2x^2 - 4x + 6'
    end

    it 'should parse the parts of element 1' do
      @polynomial = Polynomial.new(@input_string)

      expect(@polynomial.elements[0].coefficient).to eq(2)
      expect(@polynomial.elements[0].exponent).to eq(2)

      expect(@polynomial.elements[1].coefficient).to eq(-4)
      expect(@polynomial.elements[1].exponent).to eq(1)

      expect(@polynomial.elements[2].coefficient).to eq(6)
      expect(@polynomial.elements[2].exponent).to eq(0)
    end
  end
end
