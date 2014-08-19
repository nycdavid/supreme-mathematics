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
    solution = elements.map do |element|
      element.coefficient * (@indep_var**element.exponent)
    end
    solution.inject(:+)
  end

  def algebraically_evaluate
  end
end
