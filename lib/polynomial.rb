class Polynomial
  attr_reader :elements

  def initialize(string)
    @elements = string.split(/\+|\-/)
  end
end
