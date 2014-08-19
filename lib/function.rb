class Function
  # A function f is a rule that assigns to each element x in a set D
  # exactly one element, called f(x) in a set E

  def evaluate(independent_var)
    value = independent_var

    solution = elements.map do |element|
      element.coefficient * (value**element.exponent)
    end
    solution.inject(:+)
  end
end
