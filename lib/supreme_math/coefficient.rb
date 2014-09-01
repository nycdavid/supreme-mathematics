module SupremeMath
  class Coefficient 

    attr_reader :value

    TYPES = {
      /\A-?\d+\z/ => 'to_i',
      /\A-?\d*\.\d+\z/ => 'to_f',
      /\A-?\d+\/\d+\z/ => 'to_r'
    }

    def initialize(input)
      @input = input
      convert
    end

    def convert
      @value = @input.send(TYPES.select { |k, v| k.match @input }.values[0])
    rescue
      raise ArgumentError, 'Invalid format for Coefficient class.'
    end

  end
end
