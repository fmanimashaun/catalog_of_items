require_relative '../classes/source'

describe Source do
  before(:each) do
    @source = Source.new(
      name: 'New York Times',
      items: []
    )
  end

  context 'Testing the Source class' do
    it 'The initialize method should create a item with 3 variables' do
      expect(@source.instance_variables.length).to eq 3
      expect(@source.instance_variables).to eq %i[@id @name @items]
    end

    it 'The initialize method should create an instance variable of name' do
      expect(@source.instance_variable_get(:@name)).to eq 'New York Times'
    end

    it 'The initialize method should create an instance variable of items' do
      expect(@source.instance_variable_get(:@items)).to eq []
    end

    it 'The initialize method should create an instance variable of id' do
      expect(@source.instance_variable_get(:@id)).to be_a String
    end
  end
end
