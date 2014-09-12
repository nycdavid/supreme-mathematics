module SupremeMath
  class Variable

    attr_reader :coefficient, :base, :exponent

    REGEX = /([\+-]?\s*\(*-?\d?[\/\.]*\d*\)*) ([a-z]) \^? (\d*)/ix

    COEFFICIENT_MAP = {
      /^[\+-]?\s*\d+$/ => 'to_i',
      /^[\+-]?\s*\d+\.\d+$/ => 'to_f',
      /^[\+-]?\s*\(\d+\/\d+\)$/ => 'to_r'
    }

    EXPONENT_MAP = {
      /^[\+-]?\s*\d+$/ => 'to_i',
    }
    
    def initialize(input)
      @input = input
      @captures = REGEX.match(input).captures
      set_components
    end

    def set_components
      @coefficient = @captures[0].to_s === '' ? 1 : delint(@captures[0]).__send__(COEFFICIENT_MAP.select { |k, v| k.match(@captures[0]) }.values[0])
      @base = @captures[1]
      @exponent = @captures[2].to_s === '' ? 1 : @captures[2].__send__(EXPONENT_MAP.select { |k, v| k.match(@captures[2]) }.values[0])
    end

    private
      def delint(capture)
        capture.gsub(/\(/, '').gsub(/\)/, '').gsub(/\s+/, '') 
      end

  end
end
