require 'pry'

class Monomial
  MONOMIAL_REGEX = Regexp.new('\A(-?\d*)[A-Za-z]?\^?(\d*)\z')

  attr_reader :coefficient, :exponent

  MAP = {
    '-' => -1,
    '' => 1
  }

  def initialize(string)
    @input_string = string
    parse_for_coefficient_and_exponent
  end

  private
    def parse_for_coefficient_and_exponent
      match = MONOMIAL_REGEX.match @input_string
      @coefficient, @exponent = match.captures.map do |capture|
        (capture === '-' || capture === '') ? MAP[capture] : capture.to_i
      end
    end

end
