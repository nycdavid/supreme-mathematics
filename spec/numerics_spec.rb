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

  describe Numerics, 'integer expressions' do
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

    it 'should handle subtractions of integers' do
      expression = '5 - 1 - 3'
      result = @parser.parse(expression).evaluate

      expect(result).to eq(1)
    end
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

    it 'should evaluate decimal subtraction' do
      expression = '5.0 - 1.2 - 1.3 - 1.4'
      result = @parser.parse(expression).evaluate

      expect(result).to eq(1.1)
    end
  end

  describe Numerics, 'rational term expressions' do
    it 'should evaluate rational term expressions (2 terms)' do
      expression = '1/4 + 2/4'
      result = @parser.parse(expression).evaluate
      
      expect(result).to eq(3/4.to_r)
    end

    it 'should evaluate rational term expressions (n terms)' do
      expression = '1/8 + 1/8 + 1/8 + 2/8'
      result = @parser.parse(expression).evaluate

      expect(result).to eq(5/8.to_r)
    end

    it 'should evaluate rational subtraction' do
      expression = '7/8 - 1/8 - 3/8'
      result = @parser.parse(expression).evaluate

      expect(result).to eq(3/8.to_r)
    end
  end
end

describe Numerics, 'arithmetic of mixed numeric types' do
  before :all do
    @parser = NumericsParser.new
  end

  it 'should add/subtract an integer and decimal' do
    op1 = '1 + 1.5'
    op2 = '1.1 - 1'
    res1 = @parser.parse(op1).evaluate
    res2 = @parser.parse(op2).evaluate

    expect(res1).to eq(2.5)
    expect(res2).to eq(1.1 - 1)
  end

  it 'should add/subtract a decimal and a rational' do
    op1 = '0.1 + 1/10'
    op2 = '0.5 - 1/10'

    expect(@parser.parse(op1).evaluate).to eq(0.2)
    expect(@parser.parse(op2).evaluate).to eq(0.4)
  end

  it 'should add/subtract an integer and a rational' do
    op1 = '1 + 1/10'
    op2 = '1 - 1/10'

    expect(@parser.parse(op1).evaluate).to eq(11/10.to_r)
    expect(@parser.parse(op2).evaluate).to eq(9/10.to_r)
  end
end
