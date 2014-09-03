require 'spec_helper'

describe SupremeMath::Term, 'initializations' do
  before :all do
    @term = SupremeMath::Term.new('3.78x') 
  end

  it 'should instantiate coefficient class' do
    expect(@term.coefficient).to be_a SupremeMath::Coefficient
  end

  it 'should properly parse coefficients' do
    expect(@term.coefficient.value).to eq(3.78)
  end
end

describe SupremeMath::Term, 'base parsing' do
  it 'should set the proper base' do
    term = SupremeMath::Term.new('3x^2')
    expect(term.base.value).to eq('x')
  end
end

describe SupremeMath::Term, 'exponent parsing' do
  it 'should set the proper exponent' do
    term = SupremeMath::Term.new('3x^2')
    expect(term.exponent.value).to eq(2)
  end
end

describe SupremeMath::Term, 'irregular term strings' do
  it 'should parse irregular term 1' do
    term = SupremeMath::Term.new('3x^1/2')

    expect(term.coefficient.value).to eq(3)
    expect(term.base.value).to eq('x')
    expect(term.exponent.value).to eq(1/2.to_r)
  end

  it 'should parse irregular term 2' do
    term = SupremeMath::Term.new('5')

    expect(term.coefficient.value).to eq(5)
    expect(term.base.value).to eq(1)
    expect(term.exponent.value).to eq(0)
  end

  it 'should parse irregular term 3' do
    term = SupremeMath::Term.new('2.5x^4/5')

    expect(term.coefficient.value).to eq(2.5)
    expect(term.base.value).to eq('x')
    expect(term.exponent.value).to eq(4/5.to_r)
  end

  it 'should parse irregular term 4' do
    term = SupremeMath::Term.new('4.5x')

    expect(term.coefficient.value).to eq(4.5)
    expect(term.base.value).to eq('x')
    expect(term.exponent.value).to eq(1)
  end

  it 'should parse irregular term 5' do
    term = SupremeMath::Term.new('-17x^3/2')

    expect(term.coefficient.value).to eq(-17)
    expect(term.base.value).to eq('x')
    expect(term.exponent.value).to eq(3/2.to_r)
  end
end

describe SupremeMath::Term, 'parsing constants and first order exponents' do
  it 'should parse exponent values as 0 if passed a constant' do
    term = SupremeMath::Term.new('4')

    expect(term.coefficient.value).to eq(4)
    expect(term.exponent.value).to eq(0)
  end

  it 'should parse exponent values as 1 if passed a first order variable' do
    term = SupremeMath::Term.new('2x')

    expect(term.coefficient.value).to eq(2)
    expect(term.exponent.value).to eq(1)
  end
end
