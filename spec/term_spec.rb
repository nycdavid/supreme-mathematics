require 'spec_helper'

describe SupremeMath::Term, 'initialization' do
  it 'should take params in the initializer' do
    pending
    captures = SupremeMath::Monomial::REGEX.match('3x^2').captures
    @term = SupremeMath::Term.new(captures)
    
    expect(@term.coefficient).to eq(3)
    expect(@term.base).to eq('x')
    expect(@term.exponent).to eq(2)
  end
end
