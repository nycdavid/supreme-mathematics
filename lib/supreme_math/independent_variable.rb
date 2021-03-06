module SupremeMath
  class IndependentVariable
    attr_reader :value

    FORMATS = {
      /\A\d+\z/ => 'to_i',
      /\A\(\d+\/\d+\)\z/ => 'to_r',
      /\A\d+\.\d+\z/ => 'to_f'
    }
    
    def initialize(input)
      @input = input
      if @input.is_a? String
        @value = delint(@input).__send__(FORMATS.select { |k, v| k.match @input }.values[0])
      else
        @value = @input
      end
    end

    private
      def delint(input)
        input.gsub(/\(|\)/, '')
      end

  end
end
