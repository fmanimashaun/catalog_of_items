require_relative '../classes/label'

describe Label do
  before(:each) do
    @label = Label.new(
      title : 'New',
      color : 'green',
      items: []
    )
  end

  context 'Testing the Label class' do
    it 'The initialize method should create a item with 4 variables' do
      expect(@label.instance_variables.length).to eq 4
      expect(@label.instance_variables).to eq %i[@id @title @color @items]
    end

    it 'The initialize method should create an instance variable of title' do
      expect(@label.instance_variable_get(:@title)).to eq 'New'
    end

    it 'The initialize method should create an instance variable of color' do
      expect(@label.instance_variable_get(:@color)).to eq 'green'
    end

    it 'The initialize method should create an instance variable of items' do
      expect(@label.instance_variable_get(:@items)).to eq []
    end

    it 'The initialize method should create an instance variable of id' do
      expect(@label.instance_variable_get(:@id)).to be_a String
    end
  end
end
