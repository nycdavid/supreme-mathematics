module SupremeMath
  class Base
    
    attr_reader :value

    def initialize(input)
      @value = input
      if input.to_s === ''
        @value = 1
      end
    end

  end
end
