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
end
