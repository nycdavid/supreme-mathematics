require "spec_helper"

describe SupremeMath::Monomial, 'basic parsing' do
  it 'should parse regular mononomial' do
    input_string = '5x^3'
    @monomial = SupremeMath::Function.parse(input_string)
    expect(@monomial.terms.all[0].coefficient).to eq(5)
    expect(@monomial.terms.all[0].exponent).to eq(3)
  end

  it 'should parse a negative coefficient' do
    input_string = '-5x^3'
    @monomial = SupremeMath::Function.parse(input_string)
    expect(@monomial.terms.all[0].coefficient).to eq(-5)
    expect(@monomial.terms.all[0].exponent).to eq(3)
  end

  it 'should parse a monomial with no exponent' do
    input_string = '-5x'
    @monomial = SupremeMath::Function.parse(input_string)
    expect(@monomial.terms.all[0].coefficient).to eq(-5)
    expect(@monomial.terms.all[0].exponent).to eq(1)
  end

  it 'should parse a monomial with no coefficient' do
    input_string = '-x^2'
    @monomial = SupremeMath::Function.parse(input_string)
    expect(@monomial.terms.all[0].coefficient).to eq(-1)
    expect(@monomial.terms.all[0].exponent).to eq(2)
  end

  it 'should parse a monomial with no exponent and no coefficient' do
    input_string = 'x'
    @monomial = SupremeMath::Function.parse(input_string)
    expect(@monomial.terms.all[0].coefficient).to eq(1)
    expect(@monomial.terms.all[0].exponent).to eq(1)
  end

  it 'should parse a monomial with no exponent and a negative coefficient' do
    input_string = '-x'
    @monomial = SupremeMath::Function.parse(input_string)
    expect(@monomial.terms.all[0].coefficient).to eq(-1)
    expect(@monomial.terms.all[0].exponent).to eq(1)
  end
end

describe SupremeMath::Monomial, 'storing the base' do
  it 'should have a base attribute' do
    @monomial = SupremeMath::Function.parse('x^2')

    expect(@monomial.terms.all[0].base).to be_a String
  end

  it 'should store the base of monomial' do
    @monomial = SupremeMath::Function.parse('x^2')
  
    expect(@monomial.terms.all[0].base).to eq('x')
  end
end
