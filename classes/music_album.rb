require_relative '../decorators/item_decorator'

class MusicAlbum < ItemDecorator
  attr_accessor :on_spotify

  def initialize(params = {})
    super(Item.new(params))
    @on_spotify = params[:on_spotify] || false
  end

  def can_be_archived?
    super && @on_spotify
  end
end
