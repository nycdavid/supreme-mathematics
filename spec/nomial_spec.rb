require_relative '../lib/nomial'

describe Nomial, 'basic parsing' do
  it 'should parse regular mononomial' do
    input_string = '5x^3'
    @nomial = Nomial.new(input_string)
    expect(@nomial.coefficient).to eq(5)
    expect(@nomial.exponent).to eq(3)
  end

  it 'should parse a negative coefficient' do
    input_string = '-5x^3'
    @nomial = Nomial.new(input_string)
    expect(@nomial.coefficient).to eq(-5)
    expect(@nomial.exponent).to eq(3)
  end

  it 'should parse a monomial with no exponent' do
    input_string = '-5x'
    @nomial = Nomial.new(input_string)
    expect(@nomial.coefficient).to eq(-5)
    expect(@nomial.exponent).to eq(1)
  end

  it 'should parse a monomial with no coefficient' do
    input_string = '-x^2'
    @nomial = Nomial.new(input_string)
    expect(@nomial.coefficient).to eq(-1)
    expect(@nomial.exponent).to eq(2)
  end
end
