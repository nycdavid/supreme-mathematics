module SupremeMath
  class Function

    include SupremeMath::Parsing
    # A function f is a rule that assigns to each element x in a set D
    # exactly one element, called f(x) in a set E

    def evaluate(independent_var)
      if independent_var.is_a? String
        algebraically_evaluate
      else
        numerically_evaluate independent_var
      end
    end

    def numerically_evaluate(ivar)
      return elements.inject 0 do |memo, ele|
        memo += ele.coefficient * (ivar**ele.exponent)
        memo
      end
    end

    def algebraically_evaluate
    end

    def linear?
      degree === 1
    end
    
    def quadratic?
      degree === 2
    end

    def cubic?
      degree === 3
    end

  end
end
