require 'spec_helper'

describe Numerics, 'base data types' do
  before :all do
    @parser = NumericsParser.new
  end

  it 'should detect an integer' do
    result = @parser.parse('9')

    expect(result).to be_a Numerics::IntegerLiteral
    expect(result.value).to eq(9)
  end

  it 'should detect a negative integer' do
    result = @parser.parse('-9')

    expect(result).to be_a Numerics::IntegerLiteral
    expect(result.value).to eq(-9)
  end

  it 'should detect a decimal' do
    result = @parser.parse('1.2')

    expect(result).to be_a Numerics::DecimalLiteral
    expect(result.value).to eq(1.2)
  end

  it 'should detect a negative decimal' do
    result = @parser.parse('-1.2')

    expect(result).to be_a Numerics::DecimalLiteral
    expect(result.value).to eq(-1.2)
  end

  it 'should detect a rational without parens' do
    result = @parser.parse('1/2')

    expect(result).to be_a Numerics::RationalLiteral
    expect(result.value).to eq(1/2.to_r)
  end

  it 'should detect a negative rational without parens' do
    result = @parser.parse('-1/2')

    expect(result.value).to eq(-1/2.to_r)
  end

  it 'should detect a rational with parens' do
    result = @parser.parse('(1/2)')

    expect(result.value).to eq(1/2.to_r)
  end

  it 'should detect a negative rational with parens (different types)' do
    types = %w(-(1/2) (-1/2))
    types.each do |type|
      result = @parser.parse(type)

      expect(result.value).to eq(-1/2.to_r)
    end
  end
end
