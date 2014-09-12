require 'spec_helper'

describe SupremeMath::Term, 'initialization' do
  it 'should parse integer constants' do
    term = SupremeMath::Term.parse('3')

    expect(term).to be_a SupremeMath::Constant
    expect(term.value).to eq(3)
  end
  
  it 'should parse a variable' do
    term = SupremeMath::Term.parse('3x')

    expect(term).to be_a SupremeMath::Variable
    expect(term.coefficient).to be(3)
    expect(term.base).to eq('x')
    expect(term.exponent).to eq(1)
  end
end
