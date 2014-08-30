module SupremeMath
  class PowerFunction < Function

    def self.new(*args, &block)
      find_klass(args[0]).new(*args[0])
    end

    def self.find_klass(input)
      @@regexes.select { |k, v| k.match(input) }.values[0]
    end

  end
end
