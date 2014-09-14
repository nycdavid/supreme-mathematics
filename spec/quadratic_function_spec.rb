require 'spec_helper'

describe SupremeMath::QuadraticFunction, 'parsing' do
  before :each do
    @input = 'x^2 + 3x - 4'
    @quadratic_function = SupremeMath::Function.parse(@input)
  end

  it 'should set a, b and c attributes' do
    expect(@quadratic_function.a).to eq(1)
    expect(@quadratic_function.b).to eq(3)
    expect(@quadratic_function.c).to eq(-4)
  end
end

describe SupremeMath::QuadraticFunction, 'solving for roots' do
  before :all do
    @quadratic_function = SupremeMath::Function.parse('449.36 + 0.96t - 4.90t^2')
  end

  it 'should solve for the roots' do
    expect(@quadratic_function.roots.map { |root| root.round(2) }).to eq([-9.48, 9.67])
  end
end
