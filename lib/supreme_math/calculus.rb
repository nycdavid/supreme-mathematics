module SupremeMath
  module Calculus
    def derivative
      elements.map do |el|
        el.coefficient = el.coefficient * el.exponent
        el.exponent -= 1
      end
    end
  end
end
