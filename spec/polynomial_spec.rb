describe Polynomial, 'parsing binomials' do
  before :each do
    @input_string = '-5x + 3'
  end

  it 'should properly parse the number of elements of a binomial' do
    @polynomial = Polynomial.new(@input_string)
    expect(@polynomial.elements.count).to eq(2)
  end

  it 'should instantiate monomials from the elements collection' do
    @polynomial = Polynomial.new(@input_string)
    @polynomial.elements.each do |element|
      expect(element).to be_a Monomial
    end
  end
end
