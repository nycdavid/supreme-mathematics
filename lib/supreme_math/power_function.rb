module SupremeMath
  class PowerFunction < SupremeMath::Monomial
    def get_exponent(match)
      case match
      when ''
        0
      when /\A([A-Za-z])\z/
        @base = $1
        1
      when /\A([A-Za-z]\^(\d*\/?\d*))\z/
        @base = $1
        $2.to_r.to_f
      end
    end
  end
end
