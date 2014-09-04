module SupremeMath
  class Monomial < Function

    REGEX = /\A(-?\d*\.?\d*)([A-Za-z]?\^?(\d*))\z/
    @@regexes[REGEX] = self

    attr_accessor :term

    def initialize(str)
      @input = str
      @term = Term.new(str)
      raise ArgumentError, 'Invalid format for Monomial class.' unless valid?
    end

    def to_string
      @input
    end
    
    private
      def valid?
        @term.exponent.value > 0 and @term.exponent.value.is_a? Integer and @term.base.value.is_a? String
      end

  end
end
