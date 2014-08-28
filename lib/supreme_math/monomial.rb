module SupremeMath
  class Monomial < Function

    REGEX = /\A(-?\d*\.?\d*)([A-Za-z]?\^?(\d*))\z/

    attr_accessor :coefficient, :exponent, :base

    def initialize(str)
      @match = REGEX.match str
      raise ArgumentError, 'Invalid value for exponent. Must be non-negative/an integer.' unless valid?
      @base = @match.captures[1]
      @coefficient, @exponent = parse_for_coefficient_and_exponent(str)
    end

    def to_string
      coeff_convert(@coefficient) + @base.to_s
    end
    
    private
      def valid?
        @match.respond_to? 'captures' and @match.captures.length === 3
      end

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
        return get_coefficient, get_exponent
      end
      
      def get_coefficient
        case @match.captures[0]
        when '-'
          -1
        when ''
          1
        else
          to_numeric(@match.captures[0])
        end
      end

      def get_exponent
        case @match.captures[1]
        when ''
          0
        when /\A([A-Za-z])\z/
          1
        when /\A([A-Za-z]\^(\d))\z/
          $2.to_i
        end
      end

  end
end
