module SupremeMath
  module Calculus
    def derivative
      terms.map do |term|
        term.coefficient.value = term.coefficient.value * term.exponent.value
        term.exponent.value -= 1
      end
    end
  end
end
