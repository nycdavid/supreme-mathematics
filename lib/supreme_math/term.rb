module SupremeMath
  class Term
    attr_reader :coefficient, :base, :exponent

    REGEX = /\A(-?\d*|-?\d*\.\d+|-?\d*\/\d+?)([A-Za-z]?)\^(\d+|\d+\/\d+)?\z/ 

    def initialize(input)
      captures = REGEX.match(input).captures
      @coefficient = to_numeric(captures[0])
      @base = captures[1]
      @exponent = to_numeric(captures[2])
    end

    private
      def to_numeric(string)
        string.to_i
      end
  end
end
