require_relative '../classes/game'

describe Game do
  before(:each) do
    @game = Game.new(
      genre: 'Fantasy',
      author: 'J.K. Rowling',
      source: 'Bought online',
      label: 'New',
      publish_date: (Date.today - (11 * 365)).strftime
      multiplayer: true,
      last_played_at: (Date.today).strftime
    )
    @game_played_old = Book.new(
      genre: 'Fantasy',
      author: 'J.K. Rowling',
      source: 'Bought online',
      label: 'New',
      publish_date: (Date.today - (5 * 365)).strftime
      multiplayer: true,
      last_played_at: (Date.today - (3 * 365)).strftime
    )

    @game_played_recent = Book.new(
      genre: 'Fantasy',
      author: 'J.K. Rowling',
      source: 'Bought online',
      label: 'New',
      publish_date: (Date.today - (5 * 365)).strftime
      multiplayer: true,
      last_played_at: (Date.today).strftime
    )
  end

  context 'Testing the Item class' do
    it 'The initialize method should create a game with 8 variables' do
      expect(@game.instance_variables.length).to eq 8
      expect(@game.instance_variables).to eq %i[@id @genre @author @source @label @publish_date @archived @multiplayer @last_played_at]
    end

    it 'The initialize method should create an instance variable of genre' do
      expect(@game.instance_variable_get(:@genre)).to eq 'Fantasy'
    end

    it 'The initialize method should create an instance variable of author' do
      expect(@game.instance_variable_get(:@author)).to eq 'J.K. Rowling'
    end

    it 'The initialize method should create an instance variable of source' do
      expect(@game.instance_variable_get(:@source)).to eq 'Bought online'
    end

    it 'The initialize method should create an instance variable of label' do
      expect(@game.instance_variable_get(:@label)).to eq 'New'
    end

    it 'The initialize method should create an instance variable of publish_date' do
      expect(@game.instance_variable_get(:@publish_date)).to eq '2012-11-21'
    end

    it 'The initialize method should create an instance variable of archived' do
      expect(@game.instance_variable_get(:@archived)).to eq false
    end

    it 'The initialize method should create an instance variable of multiplayer' do
      expect(@game.instance_variable_get(:@multiplayer)).to eq true
    end

    it 'The initialize method should create an instance variable of last_played_at' do
      expect(@game.instance_variable_get(:@last_played_at)).to eq (Date.today).strftime

    it 'The initialize method should create an instance variable of id' do
      expect(@game.instance_variable_get(:@id)).to be_a String
    end
  end

  context 'Testing the can_be_archived? method' do
    it 'returns true if published_date is older than 10 years' do
      expect(@game.can_be_archived?).to eq(true)
    end

    it 'returns false if cover_state is bad' do
      expect(@game_played_old.can_be_archived?).to eq(true)
    end

    it 'returns false if cover_state is not bad and published_date less than 10yrs' do
      expect(@game_played_recent.can_be_archived?).to eq(false)
  end

  context 'Testing the move_to_archive method' do
    it 'changes the archived property to true if can_be_archived? is true' do
      @game.move_to_archive
      @game_played_old.move_to_archive
      expect(@game.archived).to eq(true)
      expect(@game_played_old.archived).to eq(true)
    end

    it 'does nothing if can_be_archived? is false' do
      @game_good.move_to_archive
      expect(@game_played_recent.archived).to eq(false)
    end
  end
end
