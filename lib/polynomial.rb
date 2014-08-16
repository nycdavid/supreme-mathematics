require_relative './monomial'
require 'pry'

class Polynomial
  attr_reader :elements

  POLYNOMIAL_REGEX = Regexp.new('\A(-?\d*[A-Za-z]?\^?\d*)\s?([\+-]?\s?-?\d*[A-Za-z]?\^?\d*)\z')

  def initialize(string)
    @input_string = string
    parse_for_elements
  end

  private
    def parse_for_elements
      match = POLYNOMIAL_REGEX.match @input_string
      @elements = match.captures.map do |element|
        Monomial.new(remove_whitespace(element))
      end
    end

    def remove_whitespace(element)
      element = element.gsub(/\s+/, '').gsub('+', '')
    end
end
