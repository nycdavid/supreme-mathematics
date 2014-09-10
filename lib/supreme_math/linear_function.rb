module SupremeMath
  class LinearFunction < Polynomial

    attr_reader :slope, :y_intercept
    REGEX_FILE = YAML.load_file('lib/config/regexes/linear_function.yml')
    REGEX_ARRAY = []
    REGEX_FILE['slope'].each do |slope_format|
      REGEX_FILE['operator'].each do |operator_format|
        REGEX_FILE['intercept'].each do |intercept_format|
          REGEX_ARRAY << slope_format + operator_format + intercept_format
          REGEX_ARRAY << intercept_format + operator_format + slope_format
        end
      end
    end

    REGEX_ARRAY.each do |regex|
      @@regexes[Regexp.new(regex, true)] = self
    end

    def initialize(input)
      super
      raise ArgumentError, 'Invalid format for LinearFunction.' unless valid?
      @slope = terms.find { |term| term.base.value.is_a? String }.coefficient.value
      @y_intercept = terms.find { |term| term.base.value === 1 }.coefficient.value
    end

    private
      def valid?
        degree === 1
      end

  end
end
