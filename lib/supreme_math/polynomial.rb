module SupremeMath
  class Polynomial < Function
    include Calculus
    include QuadraticFormula

    attr_reader :elements

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

  end
end
