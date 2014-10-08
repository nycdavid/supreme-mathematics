require 'spec_helper'

describe FunctionParser, 'arithmetic' do
  before :each do
    @parser = FunctionParser.new
  end

  describe 'String input' do
    it 'should add numbers together' do
      exp = @parser.parse('2 + 3 + 4') 

      expect(exp.evaluate).to eq(9)
    end

    it 'should subtract numbers' do
      exp = @parser.parse('10 - 8 - 1')

      expect(exp.evaluate).to eq(1)
    end

    it 'should divide numbers' do
      pending
      fail
      exp = @parser.parse('10 / 2')

      expect(exp.evaluate).to eq(5)
    end
  end
end
