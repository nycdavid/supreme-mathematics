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
end

describe DecimalNumerics, 'base data types' do
  before :all do
    @parser = DecimalNumericsParser.new
  end

  it 'should detect a decimal' do
    result = @parser.parse('9.9')

    expect(result).to be_a DecimalNumerics::DecimalLiteral
    expect(result.value).to eq(9.9)
  end

  it 'should detect a negative decimal' do
    result = @parser.parse('-99.79')

    expect(result).to be_a DecimalNumerics::DecimalLiteral
    expect(result.value).to eq(-99.79)
  end

  it 'should detect an arithmetic expression' do
    pending
    fail
    result = @parser.parse('1.2 + 3.4')

    expect(result).to be_a DecimalNumerics::Expression
    expect(result.value).to eq(4.6)
  end
end
