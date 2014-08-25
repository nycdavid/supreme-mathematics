module SupremeMath
  class Monomial < Function

    attr_accessor :coefficient, :exponent, :base

    def initialize(str)
      @coefficient, @exponent = parse_for_coefficient_and_exponent(str)
    end

    def to_string
      coeff_convert(@coefficient) + @base.to_s
    end

  end
end
