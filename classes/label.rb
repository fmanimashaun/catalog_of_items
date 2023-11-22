require 'securerandom'

class Label
  attr_reader :id
  attr_accessor :title, :color, :items

  def initialize(params = {})
    @id = params[:id] || SecureRandom.uuid
    @title = params[:title]
    @color = params[:color]
    @items = params[:items] || []
  end

  def add_item(item)
    @items << item
    item.label = self
  end
end
