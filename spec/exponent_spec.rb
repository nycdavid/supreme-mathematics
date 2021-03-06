require 'spec_helper'

describe SupremeMath::Exponent, 'initialization' do
  it 'should parse integer values properly' do
    @exponent = SupremeMath::Exponent.new('x^2', '2')
    
    expect(@exponent.value).to eq(2)
  end

  it 'should parse fractional values properly' do
    @exponent = SupremeMath::Exponent.new('x^1/2', '1/2')

    expect(@exponent.value).to eq(1/2.to_r)
  end

end
