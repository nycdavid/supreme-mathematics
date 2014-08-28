module SupremeMath
  class QuadraticFunction < Polynomial

    def initialize(input)
      super
      raise ArgumentError, 'Invalid format for QuadraticFunction.' unless valid?
    end

    def a
      @a ||= elements.max_by { |el| el.exponent }.coefficient
    end

    def b
      @b ||= elements.sort_by { |el| el.exponent }[1].coefficient
    end

    def c
      @c ||= elements.min_by { |el| el.exponent }.coefficient
    end

    def roots
      @roots ||= calculate_roots
    end

    private
      def valid?
        degree === 2
      end
      
      def calculate_roots
        [
          (-b + Math.sqrt(b**2 - 4*a*c)) / (2*a), 
          (-b - Math.sqrt(b**2 - 4*a*c)) / (2*a)
        ]
      end

  end
end
