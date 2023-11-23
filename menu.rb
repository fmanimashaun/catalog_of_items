class Menu
  def self.display
    puts "\nWelcome to Media Library Home Page!"
    puts 'Please enter a number: '
    puts '1 - List all books'
    puts '2 - List all music albums'
    puts '3 - List all movies'
    puts '4 - List of games'
    puts '5 - List all genres'
    puts '6 - List all labels'
    puts '7 - List all authors'
    puts '8 - List all sources'
    puts '9 - Add an item [Book, Game, Music Album, Movie]'
    puts '10 - Exit'
  end

  def self.invalid_option
    puts 'Invalid option. Please try again.'
  end
end
