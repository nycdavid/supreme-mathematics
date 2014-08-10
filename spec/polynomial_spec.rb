require_relative '../lib/polynomial'
require 'rspec'

describe Polynomial, 'separate elements' do
  it 'should split a quadratic polynomial with all positive elements' do
    polynomial = Polynomial.new('x^2 + 5x + 3')
    expect(polynomial.elements.count).to eq(3)
  end

  it 'should split a polynomial with all negative elements' do
    polynomial = Polynomial.new('x^2 - 5x - 3')
    expect(polynomial.elements.count).to eq(3)
  end

  it 'should split a polynomial with mixed sign elements' do
    polynomial = Polynomial.new('x^2 -5x + 3')
    expect(polynomial.elements.count).to eq(3)
  end
end

describe Polynomial, 'correctly identify components of an element' do
  before :each do
    @polynomial = Polynomial.new('x^2 - 5x + 3')
  end

  it 'should store components in a hash' do
    expect(@polynomial.elements[0]).to be_an_instance_of Hash
  end

  describe 'element with exponent' do
    before :each do
      @element = @polynomial.elements[0]
    end

    it 'should properly identify the coefficient' do
      expect(@element[:coefficient]).to eq(1)
    end

    it 'should properly identify the exponent' do
      expect(@element[:exponent]).to eq(2)
    end
  end

  describe 'element without exponent' do
    before :each do
      @element = @polynomial.elements[1]
    end

    it 'should properly indentify the coefficient' do
      expect(@element[:coefficient]).to eq(-5)
    end
  end
end
