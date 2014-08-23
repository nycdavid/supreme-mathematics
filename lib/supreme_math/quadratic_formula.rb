module SupremeMath
  module QuadraticFormula
    def calculate_roots
      valid?
    end

    def a
      valid?
      elements.max_by { |el| el.exponent }.coefficient
    end

    def b
      valid?
      elements.sort_by { |el| el.exponent }[1].coefficient
    end

    def c
      valid?
      elements.min_by { |el| el.exponent }.coefficient
    end

    private
      def valid?
        raise(ArgumentError, 'Polynomial must be a quadratic.') unless quadratic?
      end
  end
end
