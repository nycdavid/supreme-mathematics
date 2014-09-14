module SupremeMath
  class Variable < Term

    attr_reader :coefficient, :base, :exponent

    REGEX = /([\+-]?\s*\(*-?\d?[\/\.]*\d*\)*) ([a-z]) \^? (-?\(?\d*\/?\d*\)?)/ix

    NUMERIC_MAP = {
      /^[\+-]?\s*\d+$/ => 'to_i',
      /^[\+-]?\s*\d+\.\d+$/ => 'to_f',
      /^[\+-]?\s*\(\d+\/\d+\)$/ => 'to_r'
    }
    
    def initialize(input)
      @input = input
      @captures = REGEX.match(input).captures
      set_components
    end

    def set_components
      if @captures[0].to_s == ''
        @coefficient = 1
      elsif @captures[0].gsub(/\s+/, '') == '-'
        @coefficient = -1
      elsif @captures[0].gsub(/\s+/, '') == '+'
        @coefficient = 1
      else
        @coefficient = delint(@captures[0]).__send__(NUMERIC_MAP.select { |k, v| k.match(@captures[0]) }.values[0])
      end
      @base = @captures[1]
      @exponent = @captures[2].to_s == '' ? 1 : delint(@captures[2]).__send__(NUMERIC_MAP.select { |k, v| k.match(@captures[2]) }.values[0])
    end

    private
      def delint(capture)
        capture.gsub(/\(/, '').gsub(/\)/, '').gsub(/\s+/, '') 
      end

  end
end
