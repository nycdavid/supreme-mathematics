require 'spec_helper'

describe Numerics, 'base data types' do
  before :all do
    @parser = NumericsParser.new
  end

  it 'should detect an integer' do
    result = @parser.parse('9')

    expect(result.elements[0].value).to eq(9)
  end

  it 'should detect a negative integer' do
    result = @parser.parse('-9')

    expect(result.elements[0].value).to eq(-9)
  end

  it 'should detect a decimal' do
    result = @parser.parse('1.2')

    expect(result.elements[0].value).to eq(1.2)
  end

  it 'should detect a negative decimal' do
    result = @parser.parse('-1.2')

    expect(result.elements[0].value).to eq(-1.2)
  end

  it 'should detect a rational without parens' do
    result = @parser.parse('1/2')

    expect(result.elements[0].value).to eq(1/2.to_r)
  end

  it 'should detect a negative rational without parens' do
    result = @parser.parse('-1/2')

    expect(result.elements[0].value).to eq(-1/2.to_r)
  end

  it 'should detect a rational with parens' do
    result = @parser.parse('(1/2)')

    expect(result.elements[0].value).to eq(1/2.to_r)
  end

  it 'should detect a negative rational with parens (different types)' do
    types = %w(-(1/2) (-1/2))
    types.each do |type|
      result = @parser.parse(type)

      expect(result.elements[0].value).to eq(-1/2.to_r)
    end
  end
end

describe Numerics, 'expressions' do
  before :all do
    @parser = NumericsParser.new
  end

  it 'should evaluate all integer expressions (2 elements)' do
    expression = '1 + 2'
    result = @parser.parse(expression).evaluate

    expect(result).to eq(3)
  end

  it 'should evaluate all integer expressions (n elements)' do
    expression = '1 + 2 + 3'
    result = @parser.parse(expression).evaluate

    expect(result).to eq(6)
  end

  it 'should evaluate all integer expression (n + 1 elements)' do
    expression = '1 + 2 + 3 + 4'
    result = @parser.parse(expression).evaluate

    expect(result).to eq(10)
  end

  describe Numerics, 'decimal expressions' do
    it 'should evaluate decimal expression (2)' do
      expression = '1.2 + 3.4'
      result = @parser.parse(expression).evaluate

      expect(result).to eq(4.6)
    end

    it 'should evaluate decimal expressions (n elements)' do
      expression = '1.1 + 1.1 + 2.1 + 3.1'
      result = @parser.parse(expression).evaluate

      expect(result).to eq(7.4)
    end
  end
end
