require 'spec_helper'

describe Numerics::IntegerLiteral, '#value' do
  before :all do
    @numerics_parser = NumericsParser.new
  end

  it 'should handle the single digit case (no other characters)' do
    numeric = @numerics_parser.parse('3')

    expect(numeric.value).to eq(3)
  end

  it 'should handle the single digit case (negatively signed with white space)' do
    numeric = @numerics_parser.parse('- 3')

    expect(numeric.value).to eq(-3)
  end

  it 'should handle the single digit case (positively signed with white space)' do
    numeric = @numerics_parser.parse('+ 3')

    expect(numeric.value).to eq(3)
  end

  it 'should n amount of digits' do
    numeric = @numerics_parser.parse('33333')

    expect(numeric.value).to eq(33333)
  end
end
