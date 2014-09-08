require 'spec_helper'

describe SupremeMath::SupremeRational, 'initialization' do
  it 'should parse a regular rational' do
    pending
    input = '1/2'  

    @supreme_rational = SupremeMath::Function.parse('1/2')
    expect(@supreme_rational).to be_a SupremeMath::SupremeRational
  end
end
