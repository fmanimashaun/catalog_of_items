require_relative '../classes/genre'

describe Genre do
  before(:each) do
    @genre = Genre.new(
      name: 'Action',
      items: []
    )
  end

  context 'Testing the Genre class' do
    it 'The initialize method should create a item with 3 variables' do
      expect(@genre.instance_variables.length).to eq 3
      expect(@genre.instance_variables).to eq %i[@id @name @items]
    end

    it 'The initialize method should create an instance variable of name' do
      expect(@genre.instance_variable_get(:@name)).to eq 'Action'
    end

    it 'The initialize method should create an instance variable of items' do
      expect(@genre.instance_variable_get(:@items)).to eq []
    end

    it 'The initialize method should create an instance variable of id' do
      expect(@genre.instance_variable_get(:@id)).to be_a String
    end
  end
end
