require_relative '../classes/author'

describe Author do
  before(:each) do
    @author = Author.new(
      name: 'J. K. Rowling',
      items: []
    )
  end

  context 'Testing the Auhtor class' do
    it 'The initialize method should create a item with 3 variables' do
      expect(@item.instance_variables.length).to eq 3
      expect(@item.instance_variables).to eq %i[@id @name @items]
    end

    it 'The initialize method should create an instance variable of name' do
      expect(@item.instance_variable_get(:@name)).to eq 'J. K. Rowling'
    end

    it 'The initialize method should create an instance variable of items' do
      expect(@item.instance_variable_get(:@items)).to eq []
    end

    it 'The initialize method should create an instance variable of id' do
      expect(@item.instance_variable_get(:@id)).to be_a String
    end
  end
end
