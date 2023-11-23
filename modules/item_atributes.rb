require_relative '../classes/genre'
require_relative '../classes/author'
require_relative '../classes/label'
require_relative '../classes/source'
require_relative '../classes/item'

module ItemAttributes
  ITEM_TYPES = { 1 => 'Book', 2 => 'Game', 3 => 'Music Album', 4 => 'Movie'}.freeze

  def create_genre(item_type)
    print "Do you know the #{ITEM_TYPES[item_type]}'s genre? [Y/N]: "
    genre_answer = gets.chomp.downcase
    return unless genre_answer == 'y'

    print 'Enter the genre name: '
    name = gets.chomp
    Genre.new(name: name)
  end

  def create_author(item_type)
    print "Do you know the #{ITEM_TYPES[item_type]}'s author? [Y/N]: "
    author_answer = gets.chomp.downcase
    return unless author_answer == 'y'

    print 'Enter the author first name: '
    first_name = gets.chomp
    print 'Enter the author last name: '
    last_name = gets.chomp
    Author.new(first_name: first_name, last_name: last_name)
  end

  def create_label(item_type)
    print "Do you know the #{ITEM_TYPES[item_type]}'s label? [Y/N]: "
    label_answer = gets.chomp.downcase
    return unless label_answer == 'y'

    print 'Enter the label title: '
    title = gets.chomp
    print 'Enter the label color: '
    color = gets.chomp
    Label.new(title: title, color: color)
  end

  def create_source(item_type)
    print "Do you know the #{ITEM_TYPES[item_type]}'s source? [Y/N]: "
    source_answer = gets.chomp.downcase
    return unless source_answer == 'y'

    print 'Enter the source name: '
    name = gets.chomp
    Source.new(name: name)
  end
end
