require_relative 'item'
require 'date'

class Game < Item
  attr_accessor :multiplayer, :last_played_at
  attr_reader :publish_date

  def initialize(params = {})
    super(params)
    @multiplayer = params[:multiplayer] || false
    @last_played_at = params[:last_played_at]
  end

  def can_be_archived?
    super && Date.parse(@last_played_at) < (Date.today - (2 * 365))
  end
end
