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

  end
end
