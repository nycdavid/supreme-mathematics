module SupremeMath
  class Polynomial < Function

    attr_reader :terms, :input

    include Calculus

    def initialize(input, terms)
      @input = input
      @terms = terms
    end

    def degree
      @degree ||= @terms.highest_exponent
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
    
    private 
      def valid?
        @terms.find { |term| term.exponent.value < 0 }.nil? or @terms.find { |term| term.exponent.value.integer? == false }.nil?
      end
    
      def remove_whitespace(element)
        element.gsub(/\s+/, '')
      end

      def remove_plus_sign(element)
        element.gsub("+", "")
      end

      def parse_for_elements(str)
        return str.scan(/([\+-]|\A)\s*(\d*\.*\d*[A-Za-z]*\^*\d*)/).map do |term|
          Term.new(remove_plus_sign(remove_whitespace(term.join)))
        end
      end
      
  end
end
