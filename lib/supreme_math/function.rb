module SupremeMath
  class Function
    # A function f is a rule that assigns to each element x in a set D
    # exactly one element, called f(x) in a set E

    @@regexes = {}

    def self.parse(input)
      @@regexes.select { |k, v| k.match input }.values[0].new(input)
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
      return terms.inject 0 do |memo, term|
        if term.base.value.is_a? String
          memo += term.coefficient.value * (ivar**term.exponent.value)
        else
          memo += term.coefficient.value
        end
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
    
    def to_numeric(coefficient)
      coefficient = coefficient.gsub(/\s+/, '')
      n = BigDecimal.new(coefficient)
      n.frac == 0 ? coefficient.to_i : coefficient.to_f
    end

  end

end
