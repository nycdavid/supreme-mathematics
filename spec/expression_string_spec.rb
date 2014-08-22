require 'spec_helper'

describe SupremeMath::ExpressionString, 'give expression strings' do
  it 'should take Polynomial class elements as input' do
    @polynomial = SupremeMath::Polynomial.new('x^2')
    @expression_string = SupremeMath::ExpressionString.new(@polynomial.elements)

    expect(@expression_string.elements[0]).to be_a SupremeMath::Monomial
    expect(@expression_string.read).to eq('x^2')
  end

  it 'should convert a Polynomial (multiple elements)' do
    @polynomial = SupremeMath::Polynomial.new('x^2 + 4')
    @expression_string = SupremeMath::ExpressionString.new(@polynomial.elements)

    expect(@expression_string.read).to eq('x^2 + 4')
  end

end
