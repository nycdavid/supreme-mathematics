require 'spec_helper'

describe SupremeMath::LinearFunction, 'slope and intercept' do
  before :each do
    @input_string = '3x + 4'
    @linear_function = SupremeMath::Function.parse(@input_string)
  end

  it 'should properly identify the slope' do
    expect(@linear_function.slope).to eq(3)
  end

  it 'should properly indentify the y-intercept' do
    expect(@linear_function.y_intercept).to eq(4)
  end
end

describe SupremeMath::LinearFunction, 'slope and intercept with decimal values' do
  before :each do
    @input_string = '3.45x + 2.79'
    @linear_function = SupremeMath::LinearFunction.new(@input_string)
  end

  it 'should properly identify the slope' do
    expect(@linear_function.slope).to eq(3.45)
  end

  it 'should properly identify the y-intercept' do
    expect(@linear_function.y_intercept).to eq(2.79)
  end

  it 'should parse in any order' do
    @linear_function = SupremeMath::LinearFunction.new('2.79 + 3.45x')

    expect(@linear_function.slope).to eq(3.45)
    expect(@linear_function.y_intercept).to eq(2.79)
  end
end

describe SupremeMath::LinearFunction, 'negative slope and intercept' do
  before :each do
    @input_string = '-3.45x - 2.79'
    @linear_function = SupremeMath::LinearFunction.new(@input_string)
  end

  it 'should properly parse the negative slope' do
    expect(@linear_function.slope).to eq(-3.45)
  end

  it 'should properly parse the negative y-intercept' do
    expect(@linear_function.y_intercept).to eq(-2.79)
  end
end

describe SupremeMath::LinearFunction, 'parsing errors and incorrect arguments' do
  it 'should not accept any polynomials that are not of degree 1' do
    @input_string = '2x^2 + 3x - 7'
    expect { SupremeMath::LinearFunction.new(@input_string) }.to raise_error ArgumentError
  end

  it 'should not accept any non-polynomials (negative or non-integer exponents)' do
    @input_string = '2x + 2x^-1'
    expect { SupremeMath::LinearFunction.new(@input_string) }.to raise_error ArgumentError
  end

end

describe SupremeMath::LinearFunction, 'table test of different forms of linear functions' do
  it 'should return a LinearFunction instance for each' do
    equations = ['(3/4)x + (3/4)', '(3/4)x + 3', '(3/4)x + 3.33', '(3/4)x - (3/4)', '(3/4)x - 3', '(3/4)x - 3.33', '3x + (3/4)',
     '3x + 3', '3x + 3.33', '3x - (3/4)', '3x - 3', '3x - 3.33', '3.33x + (3/4)', '3.33x + 3', '3.33x + 3.33',
     '3.33x - (3/4)', '3.33x - 3', '3.33x - 3.33', '(-3/4)x + (3/4)', '(-3/4)x + 3', '(-3/4)x + 3.33', '(-3/4)x - (3/4)', 
     '(-3/4)x - 3', '-3x - 3', '-3x - 3.33', '-3.33x + (3/4)', '-3.33x + 3', '-3.33x + 3.33', '-3.33x - (3/4)', 
     '-3.33x - 3', '-3.33x - 3.33']
    
    equations.each do |equation|
      @linear_function = SupremeMath::Function.parse(equation)

      expect(@linear_function).to be_a SupremeMath::LinearFunction
    end
  end
end
