require_relative '../decorators/item_decorator'

class Movie < ItemDecorator
  attr_accessor :silent

  def initialize(params = {})
    super(Item.new(params))
    @silent = params[:silent] || false
  end

  def can_be_archived?
    super || @silent
  end
end
