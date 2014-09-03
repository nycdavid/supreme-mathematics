module SupremeMath
  class Exponent
    
    attr_reader :value

    TYPES = {
      /\A\z/ => 0,
      /\A[A-Za-z]\z/ => 1,
      /\A-?[A-Za-z]\^\d+\z/ => 'to_i',
      /\A-?[A-Za-z]\^\d*\.\d+\z/ => 'to_f',
      /\A-?[A-Za-z]\^\d+\/\d+\z/ => 'to_r'
    }
    
    def initialize(power, exponent)
      @power = power 
      @exponent = exponent
      convert_numeric
    end

    def convert_numeric
      match = TYPES.select { |k, v| k.match @power.to_s }.values[0]
      @value = match.is_a?(Integer) ? match : @exponent.send(match)
      rescue
        raise ArgumentError, 'Invalid format for Exponent class.'
    end
    
  end
end
