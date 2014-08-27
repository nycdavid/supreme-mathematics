module SupremeMath
  class LinearFunction < Polynomial

    attr_reader :slope, :y_intercept

    REGEX = Regexp.new '\A(-?\d*\.?\d*)[A-Za-z]\s*([\+-]?\s*\d*\.?\d*)\z'

    def initialize(input)
      matches = REGEX.match input   
      @slope = to_numeric(matches[1])
      @y_intercept = to_numeric(matches[2].gsub(/\s+/, ''))
    end

  end
end
