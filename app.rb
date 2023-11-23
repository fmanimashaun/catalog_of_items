require_relative 'modules/store'
require_relative 'modules/item_atributes'
require_relative 'modules/create_item'

class App
  include ItemAttributes
  include CreateItem
  include Store

  attr_accessor :items, :genres, :labels, :authors, :sources

  def initialize
    @items = []
    @genres = []
    @labels = []
    @authors = []
    @sources = []
  end

  def add_item
    item_category = select_item_type
    type = item_category[:type]
    item = create_item(type)
    genre = create_genre(type)
    author = create_author(type)
    label = create_label(type)
    source = create_source(type)
    update_item(item, genre, author, label, source)
    @items << item
    puts "\n#{item_category[:name].capitalize} added successfully!"
  end

  def create_item(item_type)
    case item_type
    when 1
      create_book
    when 2
      create_game
    when 3
      create_music_album
    when 4
      create_movie
    end
  end

  def update_item(*args)
    item = args.find { |arg| arg.is_a?(Item) }
    args.each { |arg| process_arg(arg, item) }
  end

  def process_arg(arg, item)
    return if arg.nil? || arg.is_a?(Item)

    arg.add_item(item)

    case arg
    when Genre
      @genres << arg
    when Author
      @authors << arg
    when Label
      @labels << arg
    when Source
      @sources << arg
    end
  end

  def select_item_type
    puts "\nSelect item type from the list below: \n"
    ITEM_TYPES.each do |key, value|
      puts "#{key}. #{value}"
    end

    type = gets.chomp.to_i

    until ITEM_TYPES.key?(type)
      puts 'Invalid option, try again'
      type = gets.chomp.to_i
    end

    { type: type, name: ITEM_TYPES[type] }
  end

  def list_books
    books = @items.select { |item| item.is_a?(Book) }

    if books.empty?
      puts "\nNo books found."
      return
    end

    books.each_with_index do |book, index|
      puts "\n#{index + 1}) #{book.publish_date} - #{book.publisher} - #{book.cover_state}"
    end
  end

  def list_music_albums
    music_albums = @items.select { |item| item.is_a?(MusicAlbum) }

    if music_albums.empty?
      puts "\nNo music albums found."
      return
    end

    music_albums.each_with_index do |music_album, index|
      puts "\n#{index + 1}) #{music_album.publish_date} - #{music_album.on_spotify}"
    end
  end

  def list_movies
    movies = @items.select { |item| item.is_a?(Movie) }

    if movies.empty?
      puts "\nNo movies found."
      return
    end

    movies.each_with_index do |movie, index|
      puts "\n#{index + 1}) #{movie.publish_date} - #{movie.silent}"
    end
  end

  def list_games
    games = @items.select { |item| item.is_a?(Game) }

    if games.empty?
      puts "\nNo games found."
      return
    end

    games.each_with_index do |game, index|
      puts "\n#{index + 1}) #{game.publish_date} - #{game.multiplayer}"
    end
  end

  def list_genres
    if @genres.empty?
      puts "\nNo genres found."
      return
    end

    @genres.each_with_index do |genre, index|
      puts "\n#{index + 1}) - #{genre.name}"
    end
  end

  def list_labels
    if @labels.empty?
      puts "\nNo labels found."
      return
    end

    @labels.each_with_index do |label, index|
      puts "\n#{index + 1}) #{label.title} - #{label.color}"
    end
  end

  def list_authors
    if @authors.empty?
      puts "\nNo authors found."
      return
    end

    @authors.each_with_index do |author, index|
      puts "\n#{index + 1}) #{author.first_name} - #{author.last_name}"
    end
  end

  def list_sources
    if @sources.empty?
      puts "\nNo sources found."
      return
    end

    @sources.each_with_index do |source, index|
      puts "\n#{index + 1}) #{source.name}"
    end
  end
end
