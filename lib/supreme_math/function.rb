module SupremeMath
  class Function
    # A function f is a rule that assigns to each element x in a set D
    # exactly one element, called f(x) in a set E

    def evaluate(independent_var)
      @indep_var = independent_var
      if @indep_var.is_a? String
        algebraically_evaluate
      else
        numerically_evaluate
      end
    end

    def numerically_evaluate
      return elements.inject 0 do |memo, ele|
        memo += ele.coefficient * (@indep_var**ele.exponent)
        memo
      end
    end

    def algebraically_evaluate
    end
  end
end
