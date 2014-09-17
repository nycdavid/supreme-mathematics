require 'spec_helper'

describe SupremeMath::IndependentVariable, 'initialization' do
  it 'should accept and coerce integer IVars' do
    ivar = SupremeMath::IndependentVariable.new('3')

    expect(ivar.value).to be_a Integer
    expect(ivar.value).to eq(3)
  end

  it 'should accept and coerce rationals' do
    ivar = SupremeMath::IndependentVariable.new('(1/3)')

    expect(ivar.value).to be_a Rational
    expect(ivar.value).to eq(1/3.to_r)
  end
end
