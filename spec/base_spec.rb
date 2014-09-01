require 'spec_helper'

describe SupremeMath::Base, 'initialization' do
  it 'should parse an empty string into 1' do
    @base = SupremeMath::Base.new('')
    expect(@base.value).to eq(1)
  end

  it 'should parse a nil value into 1' do
    @base = SupremeMath::Base.new(nil)
    expect(@base.value).to eq(1)
  end

  it 'should parse the variable letter as-is' do
    @base = SupremeMath::Base.new('x')
    expect(@base.value).to eq('x')
  end
end
