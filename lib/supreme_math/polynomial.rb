module SupremeMath
  class Polynomial < Function

    attr_reader :elements

    include Calculus
    include QuadraticFormula

    HEADER = '\A'
    FIRST_REGEX = '(-?\d*\.?\d*[A-Za-z]?\^?\d*)'
    REGEX = '-?\d*\.?\d*[A-Za-z]?\^?\d*)'
    DELIMITER = '\s?([\+-]?\s?'
    FOOTER = '\z'

    def initialize(str)
      reg = Regexp.new(construct_regex(str.scan(/-?\d*[A-Za-z]?\^?\d*\s?[\+-]\s?-?\d*[A-Za-z]?\^?\d*/).count))
      @elements = parse_for_elements reg, str
    end

    def to_string
      @elements.map { |monomial| monomial.to_string }.join
    end

    def degree
      @degree ||= @elements.map { |el| el.exponent }.max
    end
    
    private 
      def remove_whitespace(element)
        element.gsub(/\s+/, '')
      end

      def remove_plus_sign(element)
        element.gsub("+", "")
      end

      def parse_for_elements(reg, str)
        match = reg.match str

        return match.captures.map do |element|
          Monomial.new(remove_plus_sign(remove_whitespace(element)))
        end
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
