module SupremeMath
  class Monomial < Function

    MONOMIAL_REGEX = Regexp.new('\A(-?\d*\.?\d*)([A-Za-z]?\^?-?\d*\/?\d*)\z')

    attr_accessor :coefficient, :exponent, :base

    def initialize(str)
      @coefficient, @exponent = parse_for_coefficient_and_exponent(str)
    end

    def to_string
      coeff_convert(@coefficient) + @base.to_s
    end
    
    private
      def coeff_convert(coefficient)
        case 
        when coefficient === -1
          '-'
        when coefficient < 0
          " - #{coefficient.abs.to_s}"
        when coefficient === 1
          ''
        else
          " + #{coefficient.to_s}"
        end
      end

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
          to_numeric(match)
        end
      end

      def get_exponent(match)
        case match
        when ''
          0
        when /\A([A-Za-z])\z/
          @base = $1
          1
        when /\A([A-Za-z]\^(\d))\z/
          @base = $1
          $2.to_i
        else
          raise ArgumentError, 'Invalid value for exponent. Must be non-negative/an integer.'
        end
      end

  end
end
