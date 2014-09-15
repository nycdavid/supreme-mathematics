module SupremeMath
  module Calculus
    def derivative
      terms.variables.map do |term|
        term.coefficient = term.coefficient * term.exponent
        term.exponent -= 1
      end
    end
  end
end
