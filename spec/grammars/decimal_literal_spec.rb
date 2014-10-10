require 'spec_helper'

describe Numerics::DecimalLiteral, '#value' do
  before :all do
    @numerics_parser = NumericsParser.new
  end

  it 'should handle the single digit case (no other characters)' do
    numeric = @numerics_parser.parse('1.5')

    expect(numeric.value).to eq(1.5)
  end

  it 'should handle the single digit case (negatively signed with white space)' do
    numeric = @numerics_parser.parse('- 1.5')

    expect(numeric.value).to eq(-1.5)
  end

  it 'should handle the single digit case (positively signed with white space)' do
    numeric = @numerics_parser.parse('+ 1.5')

    expect(numeric.value).to eq(1.5)
  end

  it 'should handle n amount of digits' do
    numeric = @numerics_parser.parse('111.567')

    expect(numeric.value).to eq(111.567)
  end
end
