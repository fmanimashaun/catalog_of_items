require_relative '../classes/author'

describe Author do
  before(:each) do
    @author = Author.new(
      first_name : 'Rowling',
      last_name : 'J. K.',
      items: []
    )
  end

  context 'Testing the Author class' do
    it 'The initialize method should create a item with 4 variables' do
      expect(@author.instance_variables.length).to eq 4
      expect(@author.instance_variables).to eq %i[@id @first_name @last_name @items]
    end

    it 'The initialize method should create an instance variable of first_name' do
      expect(@author.instance_variable_get(:@first_name)).to eq 'Rowling'
    end

    it 'The initialize method should create an instance variable of last_name' do
      expect(@author.instance_variable_get(:@last_name)).to eq 'J. K.'
    end

    it 'The initialize method should create an instance variable of items' do
      expect(@author.instance_variable_get(:@items)).to eq []
    end

    it 'The initialize method should create an instance variable of id' do
      expect(@author.instance_variable_get(:@id)).to be_a String
    end
  end
end
