require 'securerandom'

class Genre
  attr_reader :id
  attr_accessor :name, :items

  def initialize(params = {})
    @id = params[:id] || SecureRandom.uuid
    @name = params[:name]
    @items = params[:items] || []
  end

  def add_item(item)
    @items << item
    item.genre = self
  end
end
