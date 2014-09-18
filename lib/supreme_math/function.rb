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

    def evaluate(param)
      param = SupremeMath::IndependentVariable.new(param)
      if param.value.is_a? String
        algebraically_evaluate param
      else
        numerically_evaluate param
      end
    end

    def numerically_evaluate(ivar)
      return terms.variables.inject terms.constant.value do |memo, term|
        memo += term.coefficient * (ivar.value**term.exponent)
      end
    end

    def algebraically_evaluate(param)
      new_terms = []
      param_fn = SupremeMath::Function.parse(param)
      terms.variables.each do |term|
        param_fn.terms.variables.each do |param_fn_term|
          new_terms << "#{term.coefficient * param_fn_term.coefficient}#{term.base}^#{term.exponent}"
        end
      end
      SupremeMath::Function.analyze(new_terms)
    end

  end

end
