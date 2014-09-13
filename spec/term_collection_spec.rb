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
