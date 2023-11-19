require_relative '../classes/item'
require 'date'

describe Item do
  before(:each) do
    @item = Item.new(
      genre: 'Fantasy',
      author: 'J.K. Rowling',
      source: 'Bought online',
      label: 'New',
      publish_date: (Date.today - (11 * 365)).strftime
    )
    @item_recent = Item.new(
      genre: 'Fantasy',
      author: 'J.K. Rowling',
      source: 'Bought online',
      label: 'New',
      publish_date: (Date.today - (5 * 365)).strftime
    )
  end

  context 'Testing the Item class' do
    it 'The initialize method should create a item with seven variables' do
      expect(@item.instance_variables.length).to eq 7
      expect(@item.instance_variables).to eq %i[@id @genre @author @source @label @publish_date @archived]
      expect(@item.instance_variable_get(:@genre)).to eq 'Fantasy'
      expect(@item.instance_variable_get(:@author)).to eq 'J.K. Rowling'
      expect(@item.instance_variable_get(:@source)).to eq 'Bought online'
      expect(@item.instance_variable_get(:@label)).to eq 'New'
      expect(@item.instance_variable_get(:@publish_date)).to eq '2012-11-21'
      expect(@item.instance_variable_get(:@archived)).to eq false
      expect(@item.instance_variable_get(:@id)).to be_a String
    end
  end

  context 'Testing the can_be_archived? method' do
    it 'returns true if published_date is older than 10 years' do
      expect(@item.can_be_archived?).to eq(true)
    end

    it 'returns false if published_date is less than 10 years old' do
      expect(@item_recent.can_be_archived?).to eq(false)
    end
  end

  context 'Testing the move_to_archive method' do
    it 'changes the archived property to true if can_be_archived? is true' do
      @item.move_to_archive
      expect(@item.archived).to eq(true)
    end

    it 'does nothing if can_be_archived? is false' do
      @item_recent.move_to_archive
      expect(@item_recent.archived).to eq(false)
    end
  end
end
