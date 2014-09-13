require 'spec_helper'

describe SupremeMath::TermCollection, 'initialization' do
  it 'should accept and store terms array as a attribute' do
    @terms = [SupremeMath::Term.parse('3'), SupremeMath::Term.parse('4x'), SupremeMath::Term.parse('2x^2')]
    @term_collection = SupremeMath::TermCollection.new(@terms)

    expect(@term_collection.terms).to be_a Array
    expect(@term_collection.terms.count).to be(3)
  end
end

describe SupremeMath::TermCollection, '#variable_count' do
  it 'should return the proper number of variables' do
    @terms = [SupremeMath::Term.parse('3'), SupremeMath::Term.parse('4x'), SupremeMath::Term.parse('2x^2')]
    @term_collection = SupremeMath::TermCollection.new(@terms)

    expect(@term_collection.variable_count).to eq(2)
  end
end

describe SupremeMath::TermCollection, '#variables' do
  it 'should return an array of only the variables' do
    @terms = [SupremeMath::Term.parse('3'), SupremeMath::Term.parse('4x'), SupremeMath::Term.parse('2x^2')]
    @term_collection = SupremeMath::TermCollection.new(@terms)

    expect(@term_collection.variables).to be_a Array
    expect(@term_collection.variables[0]).to be_a SupremeMath::Variable
  end
end

describe SupremeMath::TermCollection, '#exponents' do
  it 'should return an array of the exponent values of the variables' do
    @terms = 
      [
        SupremeMath::Term.parse('3'), SupremeMath::Term.parse('4x'), 
        SupremeMath::Term.parse('2x^2'), SupremeMath::Term.parse('2x^(1/2)')
      ]
    
    @term_collection = SupremeMath::TermCollection.new(@terms)
    
    expect(@term_collection.exponents).to eq([2, 1, 1/2.to_r])
  end
end

describe SupremeMath::TermCollection, '#all_integer_exponents?' do
  it 'should return true if all variable exponent values are integers' do
    @terms = 
      [
        SupremeMath::Term.parse('3'), SupremeMath::Term.parse('4x'), 
        SupremeMath::Term.parse('2x^2')
      ]

    @term_collection = SupremeMath::TermCollection.new(@terms)

    expect(@term_collection.all_integer_exponents?).to be true
  end

  it 'should return false if even one variable exponent is not an integer' do
    @terms = 
      [
        SupremeMath::Term.parse('3'), SupremeMath::Term.parse('4x'), 
        SupremeMath::Term.parse('2x^2'), SupremeMath::Term.parse('2x^(1/2)')
      ]
    @term_collection = SupremeMath::TermCollection.new(@terms)

    expect(@term_collection.all_integer_exponents?).to be false
  end
end

describe SupremeMath::TermCollection, '#highest_exponent' do
  it 'should return the numeric value of the greatest exponent' do
    @terms = 
      [
        SupremeMath::Term.parse('3'), SupremeMath::Term.parse('4x'), 
        SupremeMath::Term.parse('2x^2'), SupremeMath::Term.parse('2x^(1/2)')
      ]
    @term_collection = SupremeMath::TermCollection.new(@terms)

    expect(@term_collection.highest_exponent).to eq(2)
  end
end

describe SupremeMath::TermCollection, '#constant' do
  it 'should return the constant of the expression' do
    @terms = 
      [
        SupremeMath::Term.parse('3'), SupremeMath::Term.parse('4x'), 
        SupremeMath::Term.parse('2x^2'), SupremeMath::Term.parse('2x^(1/2)')
      ]
    @term_collection = SupremeMath::TermCollection.new(@terms)

    expect(@term_collection.constant.value).to eq(3)
  end
end

describe SupremeMath::TermCollection, '#all' do
  it 'should provide a synonym for the terms array/attribute' do
    @terms = 
      [
        SupremeMath::Term.parse('3'), SupremeMath::Term.parse('4x'), 
        SupremeMath::Term.parse('2x^2'), SupremeMath::Term.parse('2x^(1/2)')
      ]
    @term_collection = SupremeMath::TermCollection.new(@terms)

    expect(@term_collection.all).to eq(@term_collection.terms)
  end
end
