require_relative './monomial'
require 'pry'

class Polynomial
  attr_reader :elements

  POLYNOMIAL_REGEX = Regexp.new('\A(-?\d*[A-Za-z]?\^?\d*)\s?([\+-]?\s?-?\d*[A-Za-z]?\^?\d*)\z')

  HEADER = '\A'
  REGEX = '(-?\d*[A-Za-z]?\^?\d*)'
  DELIMITER = '\s?[\+-]?\s?'
  FOOTER = '\z'

  def initialize(string)
    @input_string = string
    @regex = Regexp.new(construct_regex(@input_string.scan(/-?\d*[A-Za-z]?\^?\d*\s+[\+-]\s+-?\d*[A-Za-z]?\^?\d*/).count))
    parse_for_elements
  end

  private
    def parse_for_elements
      match = @regex.match @input_string
      @elements = match.captures.map do |element|
        Monomial.new(remove_whitespace(element))
      end
    end

    def remove_whitespace(element)
      element = element.gsub(/\s+/, '').gsub('+', '')
    end

    def construct_regex(count)
      regex_array = []
      0.upto(count).each do
        regex_array << REGEX
      end
      regex_array = regex_array.join(DELIMITER)
      HEADER + regex_array + FOOTER
    end
end
