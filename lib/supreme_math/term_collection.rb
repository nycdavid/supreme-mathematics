module SupremeMath
  class TermCollection

    attr_reader :terms

    def initialize(terms)
      @terms = terms
    end

    def variable_count
      @variable_count ||= variables.count
    end

    def variables
      @variables ||= @terms.select { |term| term.class == SupremeMath::Variable }
    end

    def exponents
      @exponents ||= variables.map { |variable| variable.exponent }.sort { |x, y| y <=> x }
    end

  end
end
