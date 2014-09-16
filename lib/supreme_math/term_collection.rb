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

    def simplify
      new_terms = []
      terms = variables.map { |variable| { coefficient: variable.coefficient, pair: "#{variable.base}^#{variable.exponent.to_s}" } }
      terms.map { |term| term[:pair] }.uniq.each do |unique_pair|
        sum = terms.select { |term| term[:pair] == unique_pair }.map { |term| term[:coefficient] }.reduce(:+)
        new_terms << SupremeMath::Term.parse("#{sum}#{unique_pair}")
      end
      @terms = new_terms
    end

    def all
      @terms
    end

  end
end
