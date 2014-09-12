require 'spec_helper'

describe SupremeMath::Variable, 'parsing' do
  it 'should accept an input as param in the initializer' do
    @variable = SupremeMath::Variable.new('+ 3x')

    expect(@variable.coefficient).to eq(3)
    expect(@variable.base).to eq('x')
    expect(@variable.exponent).to eq(1)
  end

  it 'should parse positive decimal variables' do
    @variable = SupremeMath::Variable.new('+ 3.33x')

    expect(@variable.coefficient).to eq(3.33)
    expect(@variable.base).to eq('x')
    expect(@variable.exponent).to eq(1)
  end

  it 'should parse positive rational variables' do
    @variable = SupremeMath::Variable.new('+ (3/4)x')

    expect(@variable.coefficient).to eq(3/4.to_r)
    expect(@variable.base).to eq('x')
    expect(@variable.exponent).to eq(1)
  end

  it 'should parse negative integer variables' do
    @variable = SupremeMath::Variable.new('- 3x')

    expect(@variable.coefficient).to eq(-3)
    expect(@variable.base).to eq('x')
    expect(@variable.exponent).to eq(1)
  end

  it 'should parse negative decimal variables' do
    @variable = SupremeMath::Variable.new('- 3.33x')

    expect(@variable.coefficient).to eq(-3.33)
    expect(@variable.base).to eq('x')
    expect(@variable.exponent).to eq(1)
  end

  it 'should parse negative rational variables' do
    @variable = SupremeMath::Variable.new('- (3/4)x')

    expect(@variable.coefficient).to eq(-3/4.to_r)
    expect(@variable.base).to eq('x')
    expect(@variable.exponent).to eq(1)
  end

  it 'should parse plain integer variables' do
    @variable = SupremeMath::Variable.new('3x')

    expect(@variable.coefficient).to eq(3)
    expect(@variable.base).to eq('x')
    expect(@variable.exponent).to eq(1)
  end

  it 'should parse plain decimal variables' do
    @variable = SupremeMath::Variable.new('3.33x')

    expect(@variable.coefficient).to eq(3.33)
    expect(@variable.base).to eq('x')
    expect(@variable.exponent).to eq(1)
  end

  it 'should parse plain rational variables' do
    @variable = SupremeMath::Variable.new('(3/4)x')

    expect(@variable.coefficient).to eq(3/4.to_r)
    expect(@variable.base).to eq('x')
    expect(@variable.exponent).to eq(1)
  end
end
