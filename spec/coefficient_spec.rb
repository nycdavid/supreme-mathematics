require 'spec_helper'

describe SupremeMath::Coefficient, 'initialization' do
  it 'should handle integers' do
    coefficient = SupremeMath::Coefficient.new('8')
    expect(coefficient.value).to eq(8)
  end

  it 'should handle decimals' do
    coefficient = SupremeMath::Coefficient.new('3.41')
    expect(coefficient.value).to eq(3.41)
  end
  
  it 'should handle fractions' do
    coefficient = SupremeMath::Coefficient.new('7/8')
    expect(coefficient.value).to eq(7/8.to_r)
  end
end

describe SupremeMath::Coefficient, 'negative coefficients' do
  it 'should handle negative integers' do
    coefficient = SupremeMath::Coefficient.new('-8')
    expect(coefficient.value).to eq(-8)
  end

  it 'should handle negative decimals' do
    coefficient = SupremeMath::Coefficient.new('-3.41')
    expect(coefficient.value).to eq(-3.41)
  end

  it 'should handle negative fractions' do
    coefficient = SupremeMath::Coefficient.new('-7/8')
    expect(coefficient.value).to eq(-7/8.to_r)
  end
end

describe SupremeMath::Coefficient, 'nil and empty string' do
  it 'should parse nil into 1' do
    coefficient = SupremeMath::Coefficient.new(nil)
    expect(coefficient.value).to eq(1)
  end
  
  it 'should parse empty string into 1' do
    coefficient = SupremeMath::Coefficient.new('')
    expect(coefficient.value).to eq(1)
  end
end

describe SupremeMath::Coefficient, 'validation' do
  before :all do
    @invalid_types = ['3.', '7/', '/8', 'a', 'a.4']
  end

  it 'should raise an error for an invalid format' do
    @invalid_types.each do |type|
      expect { SupremeMath::Coefficient.new(type) }.to raise_error ArgumentError
    end
  end
end
