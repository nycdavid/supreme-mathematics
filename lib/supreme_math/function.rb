module SupremeMath
  class Function
    # A function f is a rule that assigns to each element x in a set D
    # exactly one element, called f(x) in a set E

    TERM_REGEX = /([\+-]?\s*\(*-?\d*[\/\.]*\d*\)*[a-z] \^? -?\(?\d*\/?\d*\)? | [\+-]? \s* \(*\d*[\/\.]*\d*\)*)/ix

    def self.parse(input)
      matches = input.scan(TERM_REGEX).map { |matches| matches.compact }.flatten.delete_if { |match| match.gsub(/\s+/, '') == '' }
      matches.map! { |match| SupremeMath::Term.parse(match) }
      term_collection = SupremeMath::TermCollection.new(matches)
      analyze(input, term_collection)
    end

    def self.analyze(input, term_collection)
      if term_collection.all_integer_exponents? && term_collection.highest_exponent == 1
        SupremeMath::LinearFunction.new(input, term_collection)
      elsif term_collection.all_integer_exponents? && term_collection.highest_exponent == 2
        SupremeMath::QuadraticFunction.new(input, term_collection)
      elsif term_collection.all_integer_exponents? && term_collection.all_positive_exponents?
        SupremeMath::Polynomial.new(input, term_collection)
      elsif term_collection.all.count == 1
        SupremeMath::PowerFunction.new(input, term_collection)
      end
    end

    def to_string
      @input
    end

    def evaluate(independent_var)
      if independent_var.is_a? String
        algebraically_evaluate
      else
        numerically_evaluate independent_var
      end
    end

    def numerically_evaluate(ivar)
      return terms.variables.inject terms.constant.value do |memo, term|
        memo += term.coefficient * (ivar**term.exponent)
      end
    end

    def algebraically_evaluate
    end

  end

end
