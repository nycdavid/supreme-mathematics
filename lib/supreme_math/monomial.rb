module SupremeMath
  class Monomial < Function

    attr_accessor :terms

    def initialize(str)
      @input = str
      @terms = [] << Term.new(str)
      raise ArgumentError, 'Invalid format for Monomial class.' unless valid?
    end

    def to_string
      @input
    end

    def term
      @terms.first
    end
    
    private
      def valid?
        term.exponent.value > 0 and term.exponent.value.is_a? Integer and term.base.value.is_a? String
      end

  end
end
