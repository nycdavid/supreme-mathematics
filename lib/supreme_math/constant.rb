module SupremeMath
  class Constant

    attr_reader :value, :input
    
    FORMATS = {
      /^[\+-]?\s*\d+$/ => 'to_i',
      /^[\+-]?\s*\d+\.\d+$/ => 'to_f',
      /^[\+-]?\s*\(\d+\/\d+\)$/ => 'to_r'
    }
   
    def initialize(input)
      @input = input
      coerce
    end

    private
      def coerce
        method = FORMATS.select { |k, v| k.match(@input) }.values[0]
        @value = delinted_input.__send__(method)
      end

      def delinted_input
        @input.gsub(/\(/, '').gsub(/\)/, '').gsub(/\s+/, '')
      end

  end
end
