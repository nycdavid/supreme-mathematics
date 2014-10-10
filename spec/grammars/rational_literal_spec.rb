require 'spec_helper'

describe Numerics::RationalLiteral, '#value' do
  before :all do
    @numerics_parser = NumericsParser.new
  end

  it 'should handle the single digit case (no other characters)' do
    numeric = @numerics_parser.parse('1/2')

    expect(numeric.value).to eq(1/2.to_r)
  end

  it 'should handle the single digit case (negatively signed with whitespace)' do
    numeric = @numerics_parser.parse('- 1/2')

    expect(numeric.value).to eq(-1/2.to_r)
  end

  it 'should handle the single digit case (positively signed with whitespace)' do
    numeric = @numerics_parser.parse('+ 1/2')

    expect(numeric.value).to eq(1/2.to_r)
  end

  it 'should handle the single digit case (positively signed with whitespace)' do
    numeric = @numerics_parser.parse('+ 1/2')

    expect(numeric.value).to eq(1/2.to_r)
  end

  it 'should handle the single digit case (negatively signed with parens outside)' do
    numeric = @numerics_parser.parse('-(1/2)')

    expect(numeric.value).to eq(-1/2.to_r)
  end

  it 'should handle the single digit case (negatively signed with parens inside)' do
    numeric = @numerics_parser.parse('(-1/2)')

    expect(numeric.value).to eq(-1/2.to_r)
  end

  it 'should handle the single digit case (positive signed with parens outside)' do
    numeric = @numerics_parser.parse('+ (1/2)')

    expect(numeric.value).to eq(1/2.to_r)
  end
end
