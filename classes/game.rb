require_relative '../decorators/item_decorator'
require 'date'

class Game < ItemDecorator
  attr_accessor :multiplayer, :last_played_at

  def initialize(params = {})
    super(Item.new(params))
    @multiplayer = params[:multiplayer] || false
    @last_played_at = params[:last_played_at]
  end

  def can_be_archived?
    super && @last_played_at < (Date.today - (2 * 365))
  end
end
