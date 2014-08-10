require_relative '../lib/polynomial'
require 'rspec'

describe Polynomial, 'separate elements' do
  it 'should parse a quadratic polynomial with all positive elements' do
    polynomial = Polynomial.new('x^2 + 5x + 3')
    expect(polynomial.elements.count).to eq(3)
  end

  it 'should parse a polynomial with all negative elements' do
    polynomial = Polynomial.new('x^2 - 5x - 3')
    expect(polynomial.elements.count).to eq(3)
  end

  it 'should parse a polynomial with mixed sign elements' do
    polynomial = Polynomial.new('x^2 -5x + 3')
    expect(polynomial.elements.count).to eq(3)
  end
end

