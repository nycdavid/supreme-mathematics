module SupremeMath
  class Monomial
    MONOMIAL_REGEX = Regexp.new('\A(-?\d*)([A-Za-z]?\^?\d*)\z')

    attr_accessor :coefficient, :exponent

    def initialize(str)
      @coefficient, @exponent = parse_for_coefficient_and_exponent(str)
    end

    private
      def parse_for_coefficient_and_exponent(str)
        match = MONOMIAL_REGEX.match str
        return get_coefficient(match.captures[0]), get_exponent(match.captures[1])
      end

      def get_coefficient(match)
        case match
        when '-'
          -1
        when ''
          1
        else
          match.to_i
        end
      end

      def get_exponent(match)
        case match
        when ''
          0
        when /\A[A-Za-z]\z/
          1
        when /\A[A-Za-z]\^(\d)\z/
          $1.to_i
        end
      end
  end
end
