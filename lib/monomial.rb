require 'pry'

class Monomial
  MONOMIAL_REGEX = Regexp.new('\A(-?\d*)([A-Za-z]?\^?\d*)\z')

  attr_accessor :coefficient, :exponent

  def initialize(string)
    @input_string = string
    parse_for_coefficient_and_exponent
  end

  private
    def parse_for_coefficient_and_exponent
      match = MONOMIAL_REGEX.match @input_string
      @coefficient = get_coefficient(match.captures[0])
      @exponent = get_exponent(match.captures[1])
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
