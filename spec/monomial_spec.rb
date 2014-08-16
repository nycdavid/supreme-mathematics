require_relative '../lib/monomial'

describe Monomial, 'basic parsing' do
  it 'should parse regular mononomial' do
    input_string = '5x^3'
    @monomial = Monomial.new(input_string)
    expect(@monomial.coefficient).to eq(5)
    expect(@monomial.exponent).to eq(3)
  end

  it 'should parse a negative coefficient' do
    input_string = '-5x^3'
    @monomial = Monomial.new(input_string)
    expect(@monomial.coefficient).to eq(-5)
    expect(@monomial.exponent).to eq(3)
  end

  it 'should parse a monomial with no exponent' do
    input_string = '-5x'
    @monomial = Monomial.new(input_string)
    expect(@monomial.coefficient).to eq(-5)
    expect(@monomial.exponent).to eq(1)
  end

  it 'should parse a monomial with no coefficient' do
    input_string = '-x^2'
    @monomial = Monomial.new(input_string)
    expect(@monomial.coefficient).to eq(-1)
    expect(@monomial.exponent).to eq(2)
  end

  it 'should parse a monomial with no exponent and no coefficient' do
    input_string = 'x'
    @monomial = Monomial.new(input_string)
    expect(@monomial.coefficient).to eq(1)
    expect(@monomial.exponent).to eq(1)
  end

  it 'should parse a monomial with no exponent and a negative coefficient' do
    input_string = '-x'
    @monomial = Monomial.new(input_string)
    expect(@monomial.coefficient).to eq(-1)
    expect(@monomial.exponent).to eq(1)
  end

  it 'should parse a monomial with no exponent and no coefficient' do
    input_string = '3'
    @monomial = Monomial.new(input_string)
    expect(@monomial.coefficient).to eq(3)
    expect(@monomial.exponent).to eq(0)
  end

  it 'should parse a monomial with no exponent and no coefficient' do
    input_string = '-3'
    @monomial = Monomial.new(input_string)
    expect(@monomial.coefficient).to eq(-3)
    expect(@monomial.exponent).to eq(0)
  end
end
