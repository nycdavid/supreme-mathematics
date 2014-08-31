require 'spec_helper'

describe SupremeMath::Term, 'initialization' do
  it 'should take params in the initializer' do
    @term = SupremeMath::Term.new('3x^2')
    
    expect(@term.coefficient).to eq(3)
    expect(@term.base).to eq('x')
    expect(@term.exponent).to eq(2)
  end
end
