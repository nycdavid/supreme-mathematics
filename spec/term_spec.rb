require 'spec_helper'

describe SupremeMath::Term, 'initialization' do
  it 'should take params in the initializer' do
    @term = SupremeMath::Term.new('3x^2')
    
    expect(@term.coefficient).to eq(3)
    expect(@term.base).to eq('x')
    expect(@term.exponent).to eq(2)
  end
end

describe SupremeMath::Term, 'cbe logic' do
  it 'should handle case where C is defined' do
    @term = SupremeMath::Term.new('2')

    expect(@term.coefficient).to eq(2)
    expect(@term.base).to eq(1)
    expect(@term.exponent).to eq(0)
  end
end
