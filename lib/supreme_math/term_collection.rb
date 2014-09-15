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

    def constant
      @constant ||= (@terms.select { |term| term.class == SupremeMath::Constant }.first || SupremeMath::Constant.new('0'))
    end

    def all_integer_exponents?
      exponents.select { |exponent| !exponent.is_a?(Integer) }.count == 0
    end

    def all_positive_exponents?
      exponents.select { |exponent| exponent < 0 }.count == 0
    end
  
    def highest_exponent
      exponents.first
    end

    def all
      @terms
    end

  end
end
