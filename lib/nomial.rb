require 'pry'

class Nomial
  NOMIAL_REGEX = Regexp.new('\A(-?\d*)[A-Za-z]?\^?(\d*)\z')

  attr_reader :coefficient, :exponent

  def initialize(string)
    @input_string = string
    parse_for_coefficient_and_exponent
  end

  private
    def parse_for_coefficient_and_exponent
      match = NOMIAL_REGEX.match @input_string
      @coefficient, @exponent = match.captures.map do |capture|
        is_zero?(capture.to_i) ? 1 : capture.to_i
      end
    end

    def is_zero?(capture)
      capture === 0
    end
end
