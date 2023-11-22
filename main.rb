require './app'
require './menu'

class Main
  def initialize
    @app = App.new
    @menu = Menu.new
    @menu.main_menu
  end
end
