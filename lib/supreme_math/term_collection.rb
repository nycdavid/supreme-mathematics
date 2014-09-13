module SupremeMath
  class TermCollection

    attr_reader :terms

    def initialize(terms)
      @terms = terms
    end

    def variable_count
      @variable_count ||= @terms.select { |term| term.class == SupremeMath::Variable }.count
    end

  end
end
