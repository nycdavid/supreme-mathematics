module SupremeMath
  module QuadraticFormula
    def roots
      valid?
      @roots ||= calculate_roots
      
    end

    def a
      valid?
      @a ||= elements.max_by { |el| el.exponent }.coefficient
    end

    def b
      valid?
      @b ||= elements.sort_by { |el| el.exponent }[1].coefficient
    end

    def c
      valid?
      @c ||= elements.min_by { |el| el.exponent }.coefficient
    end

    private
      def valid?
        raise(ArgumentError, 'Polynomial must be a quadratic.') unless quadratic?
      end

      def calculate_roots
        [
          (-b + Math.sqrt(b**2 - 4*a*c)) / (2*a), 
          (-b - Math.sqrt(b**2 - 4*a*c)) / (2*a)
        ]
      end
  end
end
