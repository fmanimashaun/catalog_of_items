require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify
  attr_reader :publish_date

  def initialize(params = {})
    super(params)
    @on_spotify = params[:on_spotify] || false
    @publish_date = params[:publish_date]
  end

  def can_be_archived?
    super && @on_spotify
  end
end
