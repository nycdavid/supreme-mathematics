require 'spec_helper'

describe SupremeMath::QuadraticFormula, 'validating' do
  it 'should raise an error if the calling polynomial is not a quadratic' do
    @polynomial = SupremeMath::Polynomial.new('x^3 + 3x^2')
    expect { @polynomial.calculate_roots }.to raise_error(ArgumentError, 'Polynomial must be a quadratic.')
  end
end

describe SupremeMath::QuadraticFormula, 'parsing a, b and c' do
  before :all do
    @polynomial = SupremeMath::Polynomial.new('449.36 + 0.96t - 4.90t^2')
  end

  it 'should respond to a, b and c attributes' do
    expect(@polynomial.a).to eq(-4.90)
    expect(@polynomial.b).to eq(0.96)
    expect(@polynomial.c).to eq(449.36)
  end
end

