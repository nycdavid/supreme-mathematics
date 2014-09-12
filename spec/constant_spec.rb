require 'spec_helper'

describe SupremeMath::Constant, 'initialization' do
  it 'should accept an input as param in the initializer' do
    @constant = SupremeMath::Constant.new('+ 3')

    expect(@constant.value).to eq(3)
  end

  it 'should parse positive decimal constants' do
    @constant = SupremeMath::Constant.new('+ 3.33')

    expect(@constant.value).to eq(3.33)
  end

  it 'should parse positive rational constants' do
    @constant = SupremeMath::Constant.new('+ (3/4)')

    expect(@constant.value).to eq(3/4.to_r)
  end

  it 'should parse negative integer constants' do
    @constant = SupremeMath::Constant.new('- 3')

    expect(@constant.value).to eq(-3)
  end

  it 'should parse negative decimal constants' do
    @constant = SupremeMath::Constant.new('- 3.33')

    expect(@constant.value).to eq(-3.33)
  end

  it 'should parse negative rational constants' do
    @constant = SupremeMath::Constant.new('- (3/4)')

    expect(@constant.value).to eq(-3/4.to_r)
  end

  it 'should parse plain integer constants' do
    @constant = SupremeMath::Constant.new('3')

    expect(@constant.value).to eq(3)
  end

  it 'should parse plain decimal constants' do
    @constant = SupremeMath::Constant.new('3.33')

    expect(@constant.value).to eq(3.33)
  end

  it 'should parse plain rational constants' do
    @constant = SupremeMath::Constant.new('(3/4)')

    expect(@constant.value).to eq(3/4.to_r)
  end
end
