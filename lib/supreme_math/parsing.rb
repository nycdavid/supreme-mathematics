module SupremeMath
  module Parsing
    
    private
      # Monomial
      MONOMIAL_REGEX = Regexp.new('\A(-?\d*\.?\d*)([A-Za-z]?\^?-?\d*\/?\d*)\z')

      def parse_for_coefficient_and_exponent(str)
        match = MONOMIAL_REGEX.match str
        return get_coefficient(match.captures[0]), get_exponent(match.captures[1])
      end

      def to_numeric(coefficient)
        n = BigDecimal.new(coefficient)
        n.frac == 0 ? coefficient.to_i : coefficient.to_f
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

      # Polynomial
      HEADER = '\A'
      FIRST_REGEX = '(-?\d*\.?\d*[A-Za-z]?\^?\d*)'
      REGEX = '-?\d*\.?\d*[A-Za-z]?\^?\d*)'
      DELIMITER = '\s?([\+-]?\s?'
      FOOTER = '\z'

      def parse_for_elements(reg, str)
        match = reg.match str

        return match.captures.map do |element|
          Monomial.new(remove_plus_sign(remove_whitespace(element)))
        end
      end

      def remove_whitespace(element)
        element.gsub(/\s+/, '')
      end

      def remove_plus_sign(element)
        element.gsub("+", "")
      end

      def construct_regex(count)
        regex_array = [] << FIRST_REGEX
        count.times do
          regex_array << REGEX
        end
        regex_array = regex_array.join(DELIMITER)
        HEADER + regex_array + FOOTER
      end

  end
end
