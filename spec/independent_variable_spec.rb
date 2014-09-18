require 'spec_helper'

describe SupremeMath::IndependentVariable, 'string initialization' do
  it 'should accept and coerce integer-type strings' do
    ivar = SupremeMath::IndependentVariable.new('3')

    expect(ivar.value).to be_a Integer
    expect(ivar.value).to eq(3)
  end

  it 'should accept and coerce rational-type strings' do
    ivar = SupremeMath::IndependentVariable.new('(1/3)')

    expect(ivar.value).to be_a Rational
    expect(ivar.value).to eq(1/3.to_r)
  end

  it 'should accept and coerce decimal-type strings' do
    ivar = SupremeMath::IndependentVariable.new('1.5')

    expect(ivar.value).to be_a Float
    expect(ivar.value).to eq(1.5)
  end
end

describe SupremeMath::IndependentVariable, 'numerical initialization' do
  it 'should accept Integer numbers by default' do
    ivar = SupremeMath::IndependentVariable.new(3)

    expect(ivar.value).to be_a Integer
    expect(ivar.value).to eq(3)
  end

  it 'should accept rational numbers by default' do
    ivar = SupremeMath::IndependentVariable.new(1/3.to_r)

    expect(ivar.value).to be_a Rational
    expect(ivar.value).to eq(1/3.to_r)
  end

  it 'should accept decimal numbers by default' do
    ivar = SupremeMath::IndependentVariable.new(1.5)

    expect(ivar.value).to be_a Float
    expect(ivar.value).to eq(1.5)
  end
end
