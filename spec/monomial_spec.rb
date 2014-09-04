require "spec_helper"

describe SupremeMath::Monomial, 'input validations' do
  it 'should not accept negative exponents' do
    expect { SupremeMath::Monomial.new('x^-2') }.to raise_error('Invalid format for Monomial class.')
  end
end

describe SupremeMath::Monomial, 'basic parsing' do
  it 'should parse regular mononomial' do
    input_string = '5x^3'
    @monomial = SupremeMath::Monomial.new(input_string)
    expect(@monomial.term.coefficient.value).to eq(5)
    expect(@monomial.term.exponent.value).to eq(3)
  end

  it 'should parse a negative coefficient' do
    input_string = '-5x^3'
    @monomial = SupremeMath::Monomial.new(input_string)
    expect(@monomial.term.coefficient.value).to eq(-5)
    expect(@monomial.term.exponent.value).to eq(3)
  end

  it 'should parse a monomial with no exponent' do
    input_string = '-5x'
    @monomial = SupremeMath::Monomial.new(input_string)
    expect(@monomial.term.coefficient.value).to eq(-5)
    expect(@monomial.term.exponent.value).to eq(1)
  end

  it 'should parse a monomial with no coefficient' do
    input_string = '-x^2'
    @monomial = SupremeMath::Monomial.new(input_string)
    expect(@monomial.term.coefficient.value).to eq(-1)
    expect(@monomial.term.exponent.value).to eq(2)
  end

  it 'should parse a monomial with no exponent and no coefficient' do
    input_string = 'x'
    @monomial = SupremeMath::Monomial.new(input_string)
    expect(@monomial.term.coefficient.value).to eq(1)
    expect(@monomial.term.exponent.value).to eq(1)
  end

  it 'should parse a monomial with no exponent and a negative coefficient' do
    input_string = '-x'
    @monomial = SupremeMath::Monomial.new(input_string)
    expect(@monomial.term.coefficient.value).to eq(-1)
    expect(@monomial.term.exponent.value).to eq(1)
  end
end

describe SupremeMath::Monomial, 'storing the base' do
  it 'should have a base attribute' do
    @monomial = SupremeMath::Monomial.new('x^2')

    expect(@monomial.term.base.value).to be_a String
  end

  it 'should store the base of monomial' do
    @monomial = SupremeMath::Monomial.new('x^2')
  
    expect(@monomial.term.base.value).to eq('x')
  end
end
