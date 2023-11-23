require './app'
require './menu'

class Main
  ACTIONS = {
    1 => :list_books,
    2 => :list_music_albums,
    3 => :list_movies,
    4 => :list_games,
    5 => :list_genres,
    6 => :list_labels,
    7 => :list_authors,
    8 => :list_sources,
    9 => :add_item
  }.freeze
  def start
    app = App.new
    option = 1

    while option != 10
      Menu.display
      option = user_input
      handle_option(app, option)
    end

    puts "\nThanks for using the Catelog App!"
  end

  def user_input
    gets.chomp.to_i
  end

  def handle_option(app, option)
    method = ACTIONS[option]
    return unless app.respond_to?(method)

    app.public_send(method)
  end
end

Main.new.start
