require 'spec_helper'

describe SupremeMath::RegexFactory, 'linear functions' do
  it 'should scan for the number of operators' do
    @input_string = '3x^2 + 4x - 2'

    @function = SupremeMath::Function.new(@input_string)
    
    expect(@function.operator_count).to eq(2)
  end
end
